import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:login/app/modules/splashscreen/views/splashscreen_view.dart';
import 'app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inisialisasi Firebase

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        //  GetMaterialApp(
        //   title: "Application",
        //   debugShowCheckedModeBanner: false,
        //   initialRoute: Routes.REGISTER,
        //   getPages: AppPages.routes,
        // );

        FutureBuilder<bool>(
      future: checkLoggedInStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.data == true) {
          return GetMaterialApp(
            title: "Application",
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.HOME,
            getPages: AppPages.routes,
          );
        } else {
          return GetMaterialApp(
            title: "Application",
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        }
      },
    );
  }

  Future<bool> checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? isNewUser = prefs.getString('new'); // Mengambil data sesi "new"
    String? uid = prefs.getString('user_uid');

    if (isNewUser != null) {
      print(isNewUser);
      return false;
    } else if (uid != null && uid.isNotEmpty) {
      // Jika ada data sesi "user_uid" dan tidak kosong, arahkan ke halaman home
      return true;
    } else {
      // Jika tidak ada kedua data tersebut atau data "user_uid" kosong, arahkan ke splashscreen
      return false;
    }
  }
}
