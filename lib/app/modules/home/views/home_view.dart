import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          const SizedBox(
            height: 40,
          ),
          Row(children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text(
                      'Hi ,${_homeController.name.value}! 👋, ${_homeController.email.value}',
                      style: const TextStyle(
                        color: Color(0xFF0D0140),
                        fontSize: 14,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                Obx(() => Text(
                      'Alamat : ${_homeController.address.value}',
                      style: const TextStyle(
                        color: Color(0xFF87868C),
                        fontSize: 12,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Obx(() => Text(
                      'No Hp : ${_homeController.phone.value}',
                      style: const TextStyle(
                        color: Color(0xFF87868C),
                        fontSize: 12,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
            const Spacer(),
            Obx(
              () => _homeController.imageUrl.value.isEmpty
                  ? CircleAvatar(
                      child: Container(
                        color: const Color.fromRGBO(220, 220, 220, 1),
                        height: 60,
                        width: 60,
                        child: Image.network(
                          'https://assets.materialup.com/uploads/b6c33467-82c3-442c-a2dc-c089bbff9fa1/preview.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        _homeController.drop();
                      },
                      child: CircleAvatar(
                        radius: 25,
                        child: Image.network(
                          _homeController.imageUrl.value,
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
            ),
            const SizedBox(
              width: 20,
            ),
          ]),
          const SizedBox(
            height: 40,
          ),
          Center(
              child: Container(
            width: 327,
            height: 52,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFE3E3E5)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/Icon - Search.png"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                      width: 271,
                                      height: double.infinity,
                                      child: Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Search.....',
                                            labelStyle: TextStyle(
                                              color: Color(0xFF87868C),
                                              fontSize: 16,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                            border: InputBorder
                                                .none, // Menghilangkan border bawah dan border
                                            focusedBorder: InputBorder
                                                .none, // Menghilangkan border saat TextField mendapat fokus
                                            enabledBorder: InputBorder
                                                .none, // Menghilangkan border saat TextField tidak aktif
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recent',
                    style: TextStyle(
                      color: Color(0xFF0D0140),
                      fontSize: 18,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ))),
          Container(
              height: 206,
              padding: EdgeInsets.only(left: 20),
              child: Expanded(
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                container(),
                const SizedBox(
                  width: 20,
                ),
                container2(),
              ]))),
          const SizedBox(
            height: 20,
          ),
          const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recommendation',
                    style: TextStyle(
                      color: Color(0xFF0D0140),
                      fontSize: 18,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ))),
          Container(
              height: 350,
              padding: EdgeInsets.only(left: 20),
              child: Expanded(
                  child: ListView(scrollDirection: Axis.vertical, children: [
                container3(),
                const SizedBox(
                  height: 20,
                ),
                container4(),
              ])))
        ]));
  }

  Widget container() {
    return Container(
      width: 273,
      height: 176,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 273,
              height: 176,
              decoration: ShapeDecoration(
                color: Color(0xFF0D0140),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 273,
              height: 176,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 54.37,
                      height: 58.67,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 54.37,
                              height: 58.67,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 9.06,
                            top: 9.78,
                            child: Container(
                              width: 36.25,
                              height: 39.11,
                              padding: const EdgeInsets.only(
                                top: 1.96,
                                left: 6.34,
                                right: 5.53,
                                bottom: 0.98,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24.38,
                                    height: 36,
                                    child: Image.network(
                                        "https://aromaincense.id/wp-content/uploads/2018/10/shopee-icon-png-5.png"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 67.97,
                    top: 10,
                    child: Container(
                      width: 205.03,
                      height: 174,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                              'Senior UI/UX Designer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w700,
                                height: 0.11,
                                letterSpacing: 0.07,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 29.78,
                            child: Container(
                              width: 205.03,
                              height: 86,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Opacity(
                                      opacity: 0.80,
                                      child: Text(
                                        'Shopee',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.w600,
                                          height: 0.14,
                                          letterSpacing: 0.06,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 34.22,
                                    child: Container(
                                      width: 205.03,
                                      height: 51.78,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 31.78,
                                            child: Text(
                                              '\$1100 - \$12.000/Month',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: SizedBox(
                                              width: 205.03,
                                              height: 26.89,
                                              child: Opacity(
                                                opacity: 0.64,
                                                child: Text(
                                                  'Jakarta, Indonesia (Remote)',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.14,
                                                    letterSpacing: 0.06,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 115.78,
                            child: Container(
                              width: 200.90,
                              height: 34.22,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 79.29,
                                      height: 34.22,
                                      padding: const EdgeInsets.only(
                                        top: 2,
                                        left: 13.59,
                                        right: 19.70,
                                        bottom: 9.33,
                                      ),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF16026C),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: 0.80,
                                            child: Text(
                                              'Fulltime',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 87.22,
                                    top: 0,
                                    child: Container(
                                      width: 116.68,
                                      height: 34.22,
                                      padding: const EdgeInsets.only(
                                        top: 4.89,
                                        left: 13.59,
                                        right: 24.08,
                                        bottom: 9.33,
                                      ),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF16026C),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: 0.80,
                                            child: Text(
                                              'Two days ago',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget container2() {
    return Container(
      width: 273,
      height: 176,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 273,
              height: 176,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 140, 72, 171),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 273,
              height: 176,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 54.37,
                      height: 58.67,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 54.37,
                              height: 58.67,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 9.06,
                            top: 9.78,
                            child: Container(
                              width: 36.25,
                              height: 39.11,
                              padding: const EdgeInsets.only(
                                top: 1.96,
                                left: 6.34,
                                right: 5.53,
                                bottom: 0.98,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24.38,
                                    height: 36,
                                    child: Image.network(
                                        "https://aromaincense.id/wp-content/uploads/2018/10/shopee-icon-png-5.png"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 67.97,
                    top: 10,
                    child: Container(
                      width: 205.03,
                      height: 174,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                              'Senior UI/UX Designer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w700,
                                height: 0.11,
                                letterSpacing: 0.07,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 29.78,
                            child: Container(
                              width: 205.03,
                              height: 86,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Opacity(
                                      opacity: 0.80,
                                      child: Text(
                                        'Shopee',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.w600,
                                          height: 0.14,
                                          letterSpacing: 0.06,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 34.22,
                                    child: Container(
                                      width: 205.03,
                                      height: 51.78,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 31.78,
                                            child: Text(
                                              '\$1100 - \$12.000/Month',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: SizedBox(
                                              width: 205.03,
                                              height: 26.89,
                                              child: Opacity(
                                                opacity: 0.64,
                                                child: Text(
                                                  'Jakarta, Indonesia (Remote)',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.14,
                                                    letterSpacing: 0.06,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 115.78,
                            child: Container(
                              width: 200.90,
                              height: 34.22,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 79.29,
                                      height: 34.22,
                                      padding: const EdgeInsets.only(
                                        top: 2,
                                        left: 13.59,
                                        right: 19.70,
                                        bottom: 9.33,
                                      ),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF16026C),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: 0.80,
                                            child: Text(
                                              'Fulltime',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 87.22,
                                    top: 0,
                                    child: Container(
                                      width: 116.68,
                                      height: 34.22,
                                      padding: const EdgeInsets.only(
                                        top: 4.89,
                                        left: 13.59,
                                        right: 24.08,
                                        bottom: 9.33,
                                      ),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF16026C),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: 0.80,
                                            child: Text(
                                              'Two days ago',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget container4() {
    return Container(
      width: 273,
      height: 176,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 365,
              height: 176,
              decoration: ShapeDecoration(
                color: Color.fromARGB(151, 57, 64, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 273,
              height: 176,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 54.37,
                      height: 58.67,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 54.37,
                              height: 58.67,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 9.06,
                            top: 9.78,
                            child: Container(
                              width: 36.25,
                              height: 39.11,
                              padding: const EdgeInsets.only(
                                top: 1.96,
                                left: 6.34,
                                right: 5.53,
                                bottom: 0.98,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24.38,
                                    height: 36,
                                    child: Image.network(
                                        "https://aromaincense.id/wp-content/uploads/2018/10/shopee-icon-png-5.png"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 67.97,
                    top: 10,
                    child: Container(
                      width: 205.03,
                      height: 174,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                              'Senior UI/UX Designer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w700,
                                height: 0.11,
                                letterSpacing: 0.07,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 29.78,
                            child: Container(
                              width: 205.03,
                              height: 86,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Opacity(
                                      opacity: 0.80,
                                      child: Text(
                                        'Shopee',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.w600,
                                          height: 0.14,
                                          letterSpacing: 0.06,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 34.22,
                                    child: Container(
                                      width: 205.03,
                                      height: 51.78,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 31.78,
                                            child: Text(
                                              '\$1100 - \$12.000/Month',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: SizedBox(
                                              width: 205.03,
                                              height: 26.89,
                                              child: Opacity(
                                                opacity: 0.64,
                                                child: Text(
                                                  'Jakarta, Indonesia (Remote)',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.14,
                                                    letterSpacing: 0.06,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 115.78,
                            child: Container(
                              width: 200.90,
                              height: 34.22,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 79.29,
                                      height: 34.22,
                                      padding: const EdgeInsets.only(
                                        top: 2,
                                        left: 13.59,
                                        right: 19.70,
                                        bottom: 9.33,
                                      ),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF16026C),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: 0.80,
                                            child: Text(
                                              'Fulltime',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 87.22,
                                    top: 0,
                                    child: Container(
                                      width: 116.68,
                                      height: 34.22,
                                      padding: const EdgeInsets.only(
                                        top: 4.89,
                                        left: 13.59,
                                        right: 24.08,
                                        bottom: 9.33,
                                      ),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF16026C),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: 0.80,
                                            child: Text(
                                              'Two days ago',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget container3() {
    return Container(
      width: 353,
      height: 176,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 365,
              height: 176,
              decoration: ShapeDecoration(
                color: Color.fromARGB(131, 72, 171, 84),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 273,
              height: 176,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 54.37,
                      height: 58.67,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 54.37,
                              height: 58.67,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 9.06,
                            top: 9.78,
                            child: Container(
                              width: 36.25,
                              height: 39.11,
                              padding: const EdgeInsets.only(
                                top: 1.96,
                                left: 6.34,
                                right: 5.53,
                                bottom: 0.98,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24.38,
                                    height: 36,
                                    child: Image.network(
                                        "https://aromaincense.id/wp-content/uploads/2018/10/shopee-icon-png-5.png"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 67.97,
                    top: 10,
                    child: Container(
                      width: 205.03,
                      height: 174,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                              'Senior UI/UX Designer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w700,
                                height: 0.11,
                                letterSpacing: 0.07,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 29.78,
                            child: Container(
                              width: 205.03,
                              height: 86,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Opacity(
                                      opacity: 0.80,
                                      child: Text(
                                        'Shopee',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.w600,
                                          height: 0.14,
                                          letterSpacing: 0.06,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 34.22,
                                    child: Container(
                                      width: 205.03,
                                      height: 51.78,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 31.78,
                                            child: Text(
                                              '\$1100 - \$12.000/Month',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: SizedBox(
                                              width: 205.03,
                                              height: 26.89,
                                              child: Opacity(
                                                opacity: 0.64,
                                                child: Text(
                                                  'Jakarta, Indonesia (Remote)',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.14,
                                                    letterSpacing: 0.06,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 115.78,
                            child: Container(
                              width: 200.90,
                              height: 34.22,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 79.29,
                                      height: 34.22,
                                      padding: const EdgeInsets.only(
                                        top: 2,
                                        left: 13.59,
                                        right: 19.70,
                                        bottom: 9.33,
                                      ),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF16026C),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: 0.80,
                                            child: Text(
                                              'Fulltime',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 87.22,
                                    top: 0,
                                    child: Container(
                                      width: 116.68,
                                      height: 34.22,
                                      padding: const EdgeInsets.only(
                                        top: 4.89,
                                        left: 13.59,
                                        right: 24.08,
                                        bottom: 9.33,
                                      ),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF16026C),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: 0.80,
                                            child: Text(
                                              'Two days ago',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.14,
                                                letterSpacing: 0.06,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getImageGalerry() async {
    var galleryPermission = Permission.storage;

    if (galleryPermission.status == PermissionStatus.denied) {
      galleryPermission.request();
      if (galleryPermission.status == PermissionStatus.permanentlyDenied) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(""))
          ]),
        );
      }
    }
  }
}
