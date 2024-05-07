import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:login/app/modules/splashscreen/views/splashscreen_view.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Tambahkan logika penundaan untuk navigasi ke halaman berikutnya
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(SplashscreenView()); // Ganti dengan halaman berikutnya
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 1, 64),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/job.png",
              width: 100,
            ),
            const SizedBox(height: 24),
            const Text(
              'Hired',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                height: 0.04,
                letterSpacing: 0.16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
