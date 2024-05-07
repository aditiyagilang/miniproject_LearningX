import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:login/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController _loginController = Get.put(LoginController());
  bool emailError = false;
  bool passError = false;
  @override
  void initState() {
    super.initState();
    // Tambahkan listener untuk mendeteksi perubahan pada field email
    _loginController.emailController.addListener(_updateEmailError);
    // Tambahkan listener untuk mendeteksi perubahan pada field password
    _loginController.passwordController.addListener(_updatePassError);
  }

  @override
  void dispose() {
    // Hapus listener saat widget dihapus
    _loginController.emailController.removeListener(_updateEmailError);
    _loginController.passwordController.removeListener(_updatePassError);
    super.dispose();
  }

  // Method untuk memperbarui status emailError
  void _updateEmailError() {
    setState(() {
      emailError = !_loginController.isEmailValid();
    });
  }

  // Method untuk memperbarui status passError
  void _updatePassError() {
    setState(() {
      passError = _loginController.passwordController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      SizedBox(
        height: 80,
      ),
      Text(
        'Hi, Welcome Back! 👋',
        style: TextStyle(
          color: Color(0xFF0D0140),
          fontSize: 24,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w700,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          'Welcome back! Log in to explore exciting opportunities \n and take the next step in your career journey.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFA3A2A7),
            fontSize: 14,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      SizedBox(
        height: 60,
      ),
      Container(
        width: 327,
        height: 100,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 22,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Color(0xFF0D0140),
                      fontSize: 14,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      letterSpacing: 0.07,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 52,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: emailError ? Colors.red : Color(0xFFE3E3E5),
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Container(
                width: 271,
                height: double.infinity,
                child: Expanded(
                    child: Obx(
                  () => TextField(
                    controller: _loginController.emailController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color(0xFF87868C),
                        fontSize: 16,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                            BorderSide(color: Color(0xFFE3E3E5), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                            BorderSide(color: Color(0xFF0D0140), width: 1),
                      ),
                      suffixIcon: IconButton(
                        onPressed: _loginController.toggleObsecureText,
                        icon: Icon(
                          _loginController.obsecuretext.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                            BorderSide(color: Color(0xFFE3E3E5), width: 1),
                      ),
                    ),
                  ),
                )),
              ),
            ),
            Text(
              emailError ? '      Format Email Harus Benar!' : '',
              style: TextStyle(
                color: Colors.red,
                fontSize: 9,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 8),
      Container(
        width: 327,
        height: 100,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 22,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      color: Color(0xFF0D0140),
                      fontSize: 14,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 52,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: passError ? Colors.red : Color(0xFFE3E3E5),
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Container(
                  width: 271,
                  height: double.infinity,
                  child: Expanded(
                    child: TextField(
                      controller: _loginController.passwordController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Color(0xFF87868C),
                          fontSize: 16,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide:
                              BorderSide(color: Color(0xFFE3E3E5), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide:
                              BorderSide(color: Color(0xFF0D0140), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide:
                              BorderSide(color: Color(0xFFE3E3E5), width: 1),
                        ),
                      ),
                    ),
                  )),
            ),
            Text(
              passError ? '      Password tidak boleh kosong' : '',
              style: TextStyle(
                color: Colors.red,
                fontSize: 9,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Spacer(),
      Container(
        width: 327,
        height: 56,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  await _loginController.signInWithEmailAndPassword();
                },
                child: Container(
                  height: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFF0D0140),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
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
            )
          ],
        ),
      ),
      SizedBox(
        height: 60,
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Don’t have an account?',
            style: TextStyle(
              color: Color(0xFFA3A2A7),
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: () {
              Get.offNamed(Routes.REGISTER);
            },
            child: Text(
              ' Sign up',
              style: TextStyle(
                color: Color(0xFF0D0140),
                fontSize: 16,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      SizedBox(
        height: 30,
      )
    ])));
  }
}
