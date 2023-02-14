import 'package:cornie_app/constants/colors.dart';
import 'package:cornie_app/controller/authenController.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    super.key,
  });

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool signIn = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passswordController = TextEditingController();

  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController passswordRegisterController = TextEditingController();
  bool isLoading = false;
  bool isHiddenPassword = true;
  String message = '';
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return signIn
        ? Container(
            width: 300,
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    "Đăng Nhập",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                ),
                SizedBox(height: 24),
                const Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey900),
                ),
                SizedBox(height: 8),
                Container(
                  alignment: Alignment.center,
                  child: Form(
                    // key: formKey,
                    child: Container(
                      width: 327,
                      height: 40,
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white,
                          border: Border.all(color: AppColors.grey500)),
                      child: TextFormField(
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: AppColors.grey900,
                              fontWeight: FontWeight.w400),
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          onChanged: (val) {},
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: 327 - 24,
                  height: 40,
                  child: Row(
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey900),
                      ),
                      Spacer(),
                      const Text(
                        "Quên mật khẩu",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey700),
                      ),
                    ],
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.error),
                ),
                SizedBox(height: 8),
                Container(
                  alignment: Alignment.center,
                  child: Form(
                    // key: formKey,
                    child: Container(
                      width: 327,
                      height: 40,
                      padding: EdgeInsets.only(left: 12, right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white,
                          border: Border.all(color: AppColors.grey500)),
                      alignment: Alignment.topCenter,
                      child: TextFormField(
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: AppColors.grey900,
                              fontWeight: FontWeight.w400),
                          controller: passswordController,
                          obscureText: isHiddenPassword,
                          keyboardType: TextInputType.visiblePassword,
                          autofillHints: [AutofillHints.password],
                          onChanged: (val) {},
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHiddenPassword = !isHiddenPassword;
                                });
                              },
                              child: isHiddenPassword
                                  ? Icon(Iconsax.eye_slash,
                                      size: 16, color: AppColors.grey700)
                                  : Icon(Iconsax.eye,
                                      size: 16, color: AppColors.grey700),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: 327 + 24,
                  height: 44,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.grey900,
                  ),
                  child: ElevatedButton(
                    //action navigate to dashboard screen
                    onPressed: () async {
                      if (isLoading) return;
                      setState(() {
                        signInController(emailController.text,
                                passswordController.text, context)
                            .catchError((e) {
                          message = e;
                        });
                      });
                      await Future.delayed(const Duration(seconds: 3));
                      if (this.mounted) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.grey900,
                        onPrimary: Colors.white,
                        shadowColor: AppColors.grey900.withOpacity(0.25),
                        elevation: 15,
                        animationDuration: Duration(milliseconds: 300),
                        // maximumSize: Size.fromWidth(200),
                        minimumSize: const Size(327 + 24, 44),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        // BorderRadius.all(Radius.circular(16)),
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    child: isLoading
                        ? Container(
                            height: 48,
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                        color: AppColors.white)),
                                SizedBox(width: 16),
                                Text(
                                  "Loading...",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Đăng Nhập',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Chưa có tài khoản?',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey700),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          signIn = !signIn;
                        });
                      },
                      child: const Text(
                        ' Đăng ký ngay !',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.alt700),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        : Container(
            width: 300,
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    "Đăng Ký",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                ),
                SizedBox(height: 24),
                const Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey900),
                ),
                SizedBox(height: 8),
                Container(
                  alignment: Alignment.center,
                  child: Form(
                    // key: formKey,
                    child: Container(
                      width: 327,
                      height: 40,
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white,
                          border: Border.all(color: AppColors.grey500)),
                      child: TextFormField(
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: AppColors.grey900,
                              fontWeight: FontWeight.w400),
                          controller: emailRegisterController,
                          keyboardType: TextInputType.text,
                          onChanged: (val) {},
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: 327 - 24,
                  height: 40,
                  child: Row(
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey900),
                      ),
                      Spacer(),
                      Container()
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  alignment: Alignment.center,
                  child: Form(
                    // key: formKey,
                    child: Container(
                      width: 327,
                      height: 40,
                      padding: EdgeInsets.only(left: 12, right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white,
                          border: Border.all(color: AppColors.grey500)),
                      alignment: Alignment.topCenter,
                      child: TextFormField(
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: AppColors.grey900,
                              fontWeight: FontWeight.w400),
                          controller: passswordRegisterController,
                          obscureText: isHiddenPassword,
                          keyboardType: TextInputType.visiblePassword,
                          autofillHints: [AutofillHints.password],
                          onChanged: (val) {},
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHiddenPassword = !isHiddenPassword;
                                });
                              },
                              child: isHiddenPassword
                                  ? Icon(Iconsax.eye_slash,
                                      size: 16, color: AppColors.grey700)
                                  : Icon(Iconsax.eye,
                                      size: 16, color: AppColors.grey700),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: 327 + 24,
                  height: 44,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.grey900,
                  ),
                  child: ElevatedButton(
                    //action navigate to dashboard screen
                    onPressed: () async {
                      if (isLoading) return;
                      setState(() {
                        registerUser(emailRegisterController.text,
                            passswordRegisterController.text, context);
                      });
                      await Future.delayed(const Duration(seconds: 3));
                      if (this.mounted) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.grey900,
                        onPrimary: Colors.white,
                        shadowColor: AppColors.grey900.withOpacity(0.25),
                        elevation: 15,
                        animationDuration: Duration(milliseconds: 300),
                        // maximumSize: Size.fromWidth(200),
                        minimumSize: const Size(327 + 24, 44),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        // BorderRadius.all(Radius.circular(16)),
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    child: isLoading
                        ? Container(
                            height: 48,
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                        color: AppColors.white)),
                                SizedBox(width: 16),
                                Text(
                                  "Loading...",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Đăng Ký',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Đã có tài khoản?',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey700),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          signIn = !signIn;
                        });
                      },
                      child: const Text(
                        ' Đăng nhập ngay !',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.alt700),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
