import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gryson/ui/auth/signup/signup_page.dart';

import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/base_app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 5.0).r,
          child: Text(
            "My Matches",
            style: TextStyle(fontSize: 18.sp, color: Colors.black),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                60.verticalSpace,
                Text(
                  "Welcome back!",
                  style: TextStyle(fontSize: 35.sp),
                ),
                20.verticalSpace,
                Text.rich(
                  TextSpan(
                    text: "New here? ",
                    style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                    children: [
                      TextSpan(
                          text: "Create Account",
                          style: const TextStyle(
                            color: Color(0xFFD5715B),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupPage(),
                                  ));
                            })
                    ],
                  ),
                ),
                70.verticalSpace,
                AppTextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email Address',
                  prefixIcon: const Icon(Icons.alternate_email_rounded),
                ),
                20.verticalSpace,
                AppTextField(
                  controller: _passController,
                  textInputAction: TextInputAction.done,
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0, top: 15).r,
                      child: Text(
                        'Forget?',
                        style: TextStyle(
                            fontSize: 15.sp, color: const Color(0xFFD5715B)),
                      ),
                    ),
                  ),
                  // suffixIcon: Text('Forget Password?'),
                ),
                30.verticalSpace,
                AppButton(
                  onPressed: () {
                    RegExp emailRegex =
                        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                    bool isValidEmail =
                        emailRegex.hasMatch(_emailController.text);
                    if (_emailController.text.isEmpty) {
                      showSnackBar("Enter your email address");
                    } else if (isValidEmail == false) {
                      showSnackBar("Enter your correct email address");
                    } else if (_passController.text.isEmpty) {
                      showSnackBar("Enter your password");
                    } else {
                      showSnackBar("Login successful");
                    }
                  },
                  title: 'Login',
                ),
                35.verticalSpace,
                Center(
                  child: Text(
                    "or login with",
                    style: TextStyle(
                        fontSize: 12.sp, color: Colors.grey.withOpacity(0.8)),
                  ),
                ),
                35.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    loginMethod("assets/images/img_2.png"),
                    loginMethod(
                      "assets/images/img.png",
                    ),
                    loginMethod(
                      "assets/images/img_1.png",
                    ),
                  ],
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginMethod(String image) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30).r,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40).r,
            border: Border.all(color: Colors.grey.withOpacity(0.4))),
        child: Image.asset(
          image,
          width: 30.r,
          height: 30.r,
        ),
      ),
    );
  }

  showSnackBar(String text) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
