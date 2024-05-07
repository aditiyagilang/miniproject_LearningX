import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool emailError = false.obs;
  final RxBool passwordError = false.obs;
  final RxString errorMessage = ''.obs;
 RxBool obsecuretext = false.obs;

  void toggleObsecureText() {
    obsecuretext.value = !obsecuretext.value;
  }
  bool isEmailValid() {
    // Ekspresi reguler untuk memeriksa validitas alamat email
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailPattern.hasMatch(emailController.text);
  }

  Future<void> signInWithEmailAndPassword() async {
    // Validasi email dan password tidak boleh kosong
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      // Tampilkan pesan error jika email atau password kosong
      Get.snackbar(
        'Error',
        'Email dan password harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Simpan UID pengguna ke dalam SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user_uid', userCredential.user!.uid);
      prefs.setString('new', "1");
      // Navigasi ke halaman utama setelah berhasil login
      Get.offNamed(Routes.HOME);
    } catch (error) {
      // Tampilkan pesan kesalahan jika login gagal
      if (error.toString().contains('user-not-found')) {
        // Jika email tidak ditemukan
        Get.snackbar(
          'Error',
          'Email tidak ditemukan',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (error.toString().contains('wrong-password')) {
        // Jika password salah
        Get.snackbar(
          'Error',
          'Password salah',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        // Jika kesalahan lainnya
        Get.snackbar(
          'Error',
          'Terjadi kesalahan saat login',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  void onClose() {
    // Bersihkan controller ketika controller di-dispose
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
