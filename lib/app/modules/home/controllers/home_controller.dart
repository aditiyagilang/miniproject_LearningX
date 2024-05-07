import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString imageUrl = ''.obs;
  RxString email = ''.obs;
  RxString name = ''.obs;
  RxString address = ''.obs;
  RxString phone = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> uploadAndDisplayImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      try {
        File imageFile = File(pickedFile.path);
        final path = "files/" +
            DateTime.now().millisecondsSinceEpoch.toString() +
            ".jpg";
        final ref = FirebaseStorage.instance.ref().child(path);

        // Upload the image file to Firebase Storage
        await ref.putFile(imageFile);

        // Get the download URL of the uploaded image
        String downloadUrl = await ref.getDownloadURL();

        // Update user's photo data with the new URL
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await user.updatePhotoURL(downloadUrl);
          imageUrl.value = downloadUrl; // Update imageUrl value
        }
        print(imageUrl.value);
        updateUserDataPhoto(imageUrl.value);
        Get.snackbar(
          'Upload Berhasil',
          'Gambar berhasil diupload',
          backgroundColor: const Color.fromARGB(255, 245, 95, 145),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        print('Error uploading image: $e');
        // Display error message
        Get.snackbar(
          'Error',
          'Terjadi kesalahan saat mengunggah gambar',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      print('No image selected.');
    }
  }

  void drop() {
    Get.defaultDialog(
      title: "Pilih",
      backgroundColor: Colors.white,
      barrierDismissible: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              // Tambahkan aksi yang ingin dilakukan saat memilih profile
              uploadAndDisplayImage();
              Get.back();
            },
            child: Container(
              height: 40,
              width: 60,
              child: Text("Profile"),
            ),
          ),
          InkWell(
            onTap: () async {
              // Tutup pop-up
              Get.back();
              // Hapus sesi data user_id
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('user_uid');
              Get.offNamed(Routes.SPLASH);
            },
            child: Container(
              height: 40,
              width: 60,
              child: Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> updateUserDataPhoto(String url) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('user_uid');
      if (uid != null) {
        await _usersCollection.doc(uid).update({
          'photo': url,
        });
        print('User photo updated successfully.');
      } else {
        print('No user logged in.');
      }
    } catch (e) {
      print('Error updating user photo: $e');
    }
  }

  Future<void> fetchUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? uid = prefs.getString('user_uid');
      if (uid != null) {
        QuerySnapshot querySnapshot =
            await _usersCollection.where('id', isEqualTo: uid).get();
        if (querySnapshot.docs.isNotEmpty) {
          var userData =
              querySnapshot.docs.first.data() as Map<String, dynamic>;
          name.value = userData['name'] ?? '';
          address.value = userData['address'] ?? '';
          phone.value = userData['phoneNumber'] ?? '';
          email.value = userData['email'] ?? '';
          imageUrl.value = userData['photo'] ??
              ''; // Gunakan .value untuk mengubah nilai RxString
          print(
              'User email: ${userData['email']}'); // Tambahkan pesan untuk mencetak email pengguna
          print(
              'User UID: $uid'); // Tambahkan pesan untuk mencetak UID pengguna
        } else {
          print('No user data found.');
        }
      } else {
        print('No user logged in.');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}
