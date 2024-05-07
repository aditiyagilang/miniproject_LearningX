import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:login/app/routes/app_pages.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends StatefulWidget {
  @override
  _SplashscreenViewState createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 1, 64),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          InkWell(
              onTap: () {
                Get.offNamed(Routes.LOGIN);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      height: 0.11,
                      letterSpacing: 0.07,
                    ),
                  ),
                ),
              )),
          const Spacer(),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Screen1(),
                Screen2(),
                Screen3(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Screen1() {
    return Container(
      height: 335,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(
                'The best app for Find Your Dream Job',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0D0140),
                  fontSize: 24,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to the ultimate app for discovering your dream job, featuring an intuitive interface and innovative features to seamlessly explore thousands of career opportunities.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA3A2A7),
                    fontSize: 14,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ]),
          ),
          const SizedBox(height: 24),
          Container(
            width: 76,
            height: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 10,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0D0140),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Opacity(
                  opacity: 0.16,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0D0140),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Opacity(
                  opacity: 0.16,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF0D0140),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () {
              setState(() {
                // Increment currentPage
                _currentPage++;

                // Check if currentPage exceeds the maximum value (2)
                if (_currentPage > 2) {
                  _currentPage = 0; // Reset currentPage to 0
                  _pageController.jumpToPage(0); // Jump to the first page
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              });
            },
            child: Container(
              // width: Me,
              height: 56,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFF0D0140),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Next',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w600,
                              height: 0.09,
                              letterSpacing: 0.08,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget Screen2() {
    return Container(
      height: 335,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Column(children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Better ',
                      style: TextStyle(
                        color: Color(0xFF0D0140),
                        fontSize: 24,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'future',
                      style: TextStyle(
                        color: Color(0xFF0D0140),
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ' is starting \n  from you',
                      style: TextStyle(
                        color: Color(0xFF0D0140),
                        fontSize: 24,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Text(
                'Discover your dream job effortlessly with our app\'s intuitive interface and innovative features.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFA3A2A7),
                  fontSize: 14,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ),
          const SizedBox(height: 24),
          Container(
            width: 76,
            height: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: 0.16,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0D0140),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 32,
                  height: 10,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0D0140),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Opacity(
                  opacity: 0.16,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF0D0140),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () {
              setState(() {
                // Increment currentPage
                _currentPage++;

                // Check if currentPage exceeds the maximum value (2)
                if (_currentPage > 2) {
                  _currentPage = 0; // Reset currentPage to 0
                  _pageController.jumpToPage(0); // Jump to the first page
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              });
            },
            child: Container(
              // width: Me,
              height: 56,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFF0D0140),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Next',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w600,
                              height: 0.09,
                              letterSpacing: 0.08,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget Screen3() {
    return Container(
      height: 335,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Column(children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Application surely viewed by ',
                      style: TextStyle(
                        color: Color(0xFF0D0140),
                        fontSize: 24,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'each company',
                      style: TextStyle(
                        color: Color(0xFF0D0140),
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Text(
                'Embark on your journey towards your dream career with our app\'s user-friendly interface and comprehensive features. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFA3A2A7),
                  fontSize: 14,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ),
          const SizedBox(height: 24),
          Container(
            width: 76,
            height: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: 0.16,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0D0140),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Opacity(
                  opacity: 0.16,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF0D0140),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 32,
                  height: 10,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0D0140),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () {
              Get.offNamed(Routes.LOGIN);
            },
            child: Container(
              // width: Me,
              height: 56,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFF0D0140),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Get Started',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w600,
                              height: 0.09,
                              letterSpacing: 0.08,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
