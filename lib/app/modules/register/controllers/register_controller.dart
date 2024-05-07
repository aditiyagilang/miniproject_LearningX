import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 RxBool obsecuretext = false.obs;

  void toggleObsecureText() {
    obsecuretext.value = !obsecuretext.value;
  }
  Future<void> registerWithEmailAndPassword() async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Send email verification
      await userCredential.user!.sendEmailVerification();

      // Save additional user data to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'id': userCredential.user!.uid,
        'email': emailController.text.trim(),
        'name': nameController.text.trim(),
        'address': addressController.text.trim(),
        'phoneNumber': phoneNumberController.text.trim(),
        'photo':
            "https://assets.materialup.com/uploads/b6c33467-82c3-442c-a2dc-c089bbff9fa1/preview.png"
        // Add more fields as needed
      });

      // Show success message
      Get.snackbar(
        'Success',
        'Registration successful. Please verify your email to login.',
        snackPosition: SnackPosition.BOTTOM,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('user_uid', userCredential.user!.uid);
      prefs.setString('new', "1");
    } catch (error) {
      // Show error message if registration fails
      Get.snackbar(
        'Error',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  bool isEmailValid() {
    // Ekspresi reguler untuk memeriksa validitas alamat email
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailPattern.hasMatch(emailController.text);
  }

  // Metode lainnya untuk validasi nomor telepon dan lainnya
  bool isPhoneNumberValid() {
    // Ekspresi reguler untuk memeriksa nomor telepon hanya terdiri dari angka
    final phoneNumberPattern = RegExp(r'^[0-9]+$');
    return phoneNumberPattern.hasMatch(phoneNumberController.text);
  }

  @override
  void onClose() {
    // Clean up controllers when the controller is disposed
    emailController.dispose();
    addressController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
