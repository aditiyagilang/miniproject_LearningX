import 'package:get/get.dart';
import 'package:login/app/modules/splashscreen/views/splashscreen_view.dart';
import 'package:login/app/routes/app_pages.dart';

class SplashController extends GetxController {
  void goToNextPage() {
    Get.offNamed(Routes.SPLASHSCREEN); // Ganti dengan rute halaman berikutnya
  }
}
