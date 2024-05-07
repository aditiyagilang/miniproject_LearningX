import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:login/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterController _registerController = Get.put(RegisterController());

  bool emailError = false;
  bool addressError = false;
  bool phoneNumberError = false;
  bool passwordError = false;
  bool nameError = false;

  @override
  void initState() {
    super.initState();
    // Tambahkan listener untuk mendeteksi perubahan pada field email
    _registerController.emailController.addListener(_updateEmailError);
    // Tambahkan listener untuk mendeteksi perubahan pada field address
    _registerController.addressController.addListener(_updateAddressError);
    _registerController.nameController.addListener(_updateNameError);
    // Tambahkan listener untuk mendeteksi perubahan pada field phone number
    _registerController.phoneNumberController
        .addListener(_updatePhoneNumberError);
    // Tambahkan listener untuk mendeteksi perubahan pada field password
    _registerController.passwordController.addListener(_updatePasswordError);
  }

  @override
  void dispose() {
    // Hapus listener saat widget dihapus
    _registerController.emailController.removeListener(_updateEmailError);
    _registerController.addressController.removeListener(_updateAddressError);
    _registerController.phoneNumberController
        .removeListener(_updatePhoneNumberError);
    _registerController.passwordController.removeListener(_updatePasswordError);
    super.dispose();
  }

  // Method untuk memperbarui status error pada field email
  void _updateEmailError() {
    setState(() {
      emailError = !_registerController.isEmailValid();
    });
  }

  // Method untuk memperbarui status error pada field address
  void _updateAddressError() {
    setState(() {
      addressError = _registerController.addressController.text.isEmpty;
    });
  }

  void _updateNameError() {
    setState(() {
      nameError = _registerController.nameController.text.isEmpty;
    });
  }

  // Method untuk memperbarui status error pada field phone number
  void _updatePhoneNumberError() {
    setState(() {
      phoneNumberError = !_registerController.isPhoneNumberValid();
    });
  }

  // Method untuk memperbarui status error pada field password
  void _updatePasswordError() {
    setState(() {
      passwordError = _registerController.passwordController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: Expanded(
                    child: SingleChildScrollView(
              child: Expanded(
                  child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Hi, Register Your Account! 👋',
                    style: TextStyle(
                      color: Color(0xFF0D0140),
                      fontSize: 24,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 327,
                    height: 94,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
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
                                color:
                                    emailError ? Colors.red : Color(0xFFE3E3E5),
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Container(
                              width: 271,
                              height: double.infinity,
                              child: Expanded(
                                child: TextField(
                                  controller:
                                      _registerController.emailController,
                                  keyboardType: TextInputType.emailAddress,
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
                                      borderSide: BorderSide(
                                          color: Color(0xFFE3E3E5), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          color: Color(0xFF0D0140), width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          color: Color(0xFFE3E3E5), width: 1),
                                    ),
                                  ),
                                ),
                              )),
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 327,
                    height: 95,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
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
                                'Name',
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
                                  color: addressError
                                      ? Colors.red
                                      : Color(0xFFE3E3E5)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Container(
                              width: 271,
                              height: double.infinity,
                              child: Expanded(
                                child: TextField(
                                  controller:
                                      _registerController.nameController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    labelStyle: TextStyle(
                                      color: Color(0xFF87868C),
                                      fontSize: 16,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          color: Color(0xFFE3E3E5), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          color: Color(0xFF0D0140), width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          color: Color(0xFFE3E3E5), width: 1),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Text(
                          nameError ? '      Nama Harus Diisi!' : '',
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
                  Container(
                    width: 327,
                    height: 95,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
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
                                'Address',
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
                                  color: addressError
                                      ? Colors.red
                                      : Color(0xFFE3E3E5)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Container(
                              width: 271,
                              height: double.infinity,
                              child: Expanded(
                                child: TextField(
                                  controller:
                                      _registerController.addressController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Address',
                                    labelStyle: TextStyle(
                                      color: Color(0xFF87868C),
                                      fontSize: 16,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          color: Color(0xFFE3E3E5), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          color: Color(0xFF0D0140), width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          color: Color(0xFFE3E3E5), width: 1),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Text(
                          nameError ? '      Alamat Harus Diisi!' : '',
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
                  Container(
                    width: 327,
                    height: 95,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
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
                                'Phone Number',
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
                                  color: phoneNumberError
                                      ? Colors.red
                                      : Color(0xFFE3E3E5)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Container(
                              width: 271,
                              height: double.infinity,
                              child: Expanded(
                                child: TextField(
                                  controller:
                                      _registerController.phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    labelStyle: TextStyle(
                                      color: Color(0xFF87868C),
                                      fontSize: 16,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          color: Color(0xFFE3E3E5), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          color: Color(0xFF0D0140), width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      borderSide: BorderSide(
                                          color: Color(0xFFE3E3E5), width: 1),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Text(
                          nameError ? '      Nomor Harus Diisi!' : '',
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
                  Container(
                    width: 327,
                    height: 95,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
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
                                  color: passwordError
                                      ? Colors.red
                                      : Color(0xFFE3E3E5)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Container(
                            width: 271,
                            height: double.infinity,
                            child: Expanded(
                                child: Obx(
                              () => TextField(
                                controller:
                                    _registerController.passwordController,
                                obscureText:
                                    !_registerController.obsecuretext.value,
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
                                    borderSide: BorderSide(
                                        color: Color(0xFFE3E3E5), width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    borderSide: BorderSide(
                                        color: Color(0xFF0D0140), width: 1),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed:
                                        _registerController.toggleObsecureText,
                                    icon: Icon(
                                      _registerController.obsecuretext.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    borderSide: BorderSide(
                                        color: Color(0xFFE3E3E5), width: 1),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ),
                        Text(
                          nameError ? '      Password Harus Diisi!' : '',
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
                  InkWell(
                    onTap: () async {
                      await _registerController.registerWithEmailAndPassword();
                    },
                    child: Container(
                      width: 327,
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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Register',
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
                  ),
                  SizedBox(
                    height: 20,
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
                          Get.offNamed(Routes.LOGIN);
                        },
                        child: Text(
                          ' Sign in',
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
                    height: 20,
                  ),
                ],
              )),
            )))));
  }
}
