import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gryson/ui/bottom_nav/bottom_nav_page.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/base_app_bar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController(text: "+91");
  final _confirmController = TextEditingController();
  final _addressController = TextEditingController();
  final _ageController = TextEditingController();
  final _eduController = TextEditingController();
  final _birthController = TextEditingController();

  File? image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  int? selectedOption;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
    _numberController.dispose();
    _confirmController.dispose();
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
                10.verticalSpace,
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 35.sp),
                ),
                35.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContainer("assets/images/img_2.png"),
                    buildContainer("assets/images/img.png"),
                    buildContainer("assets/images/img_1.png"),
                  ],
                ),
                20.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "or signup with",
                    style: TextStyle(
                        fontSize: 10.sp, color: Colors.grey.withOpacity(0.4)),
                  ),
                ),
                20.verticalSpace,
                Center(
                    child: InkWell(
                  onTap: () {
                    showOptions();
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100).r,
                      child: image == null
                          ? Container(
                              margin: const EdgeInsets.all(10).r,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100).r,
                                  border: Border.all(
                                    color: Colors.black,
                                  )),
                              child: Icon(
                                CupertinoIcons.person,
                                size: 120.r,
                              ),
                            )
                          : Image.file(
                              image!,
                              width: 150.r,
                              height: 150.r,
                              fit: BoxFit.cover,
                            )),
                )),
                20.verticalSpace,
                AppTextField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  hintText: 'Full name',
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                  ),
                ),
                20.verticalSpace,
                AppTextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email Address',
                  prefixIcon: const Icon(Icons.alternate_email_rounded),
                ),
                20.verticalSpace,
                AppTextField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  maxLength: 13,
                  hintText: 'Phone Number',
                  prefixIcon: const Icon(Icons.phone_outlined),
                ),
                20.verticalSpace,
                AppTextField(
                  controller: _addressController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintText: 'Address',
                  prefixIcon: const Icon(Icons.home_outlined),
                ),
                20.verticalSpace,
                AppTextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  maxLength: 2,
                  hintText: 'Age',
                  prefixIcon: const Icon(Icons.numbers),
                ),
                20.verticalSpace,
                Container(
                  padding: const EdgeInsets.all(2).r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.2)),
                  child: Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                      Text('Male'),
                      10.horizontalSpace,
                      Radio(
                        value: 2,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                      Text('Female')
                    ],
                  ),
                ),
                20.verticalSpace,
                AppTextField(
                  controller: _eduController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintText: 'Education',
                  prefixIcon: const Icon(Icons.cast_for_education),
                ),
                20.verticalSpace,
                AppTextField(
                  controller: _birthController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintText: 'Birth Place',
                  prefixIcon: const Icon(Icons.child_care),
                ),
                20.verticalSpace,
                AppTextField(
                  controller: _passController,
                  textInputAction: TextInputAction.next,
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                  ),
                ),
                20.verticalSpace,
                AppTextField(
                  controller: _confirmController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Re-enter Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                30.verticalSpace,
                AppButton(
                    onPressed: () {
                      RegExp emailRegex =
                          RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                      bool isValidEmail =
                          emailRegex.hasMatch(_emailController.text);
                      if (image == null) {
                        showSnackBar("Select your Profile Photo");
                      } else
                      if (_nameController.text.isEmpty) {
                        showSnackBar("Enter your full name");
                      } else if (_emailController.text.isEmpty) {
                        showSnackBar("Enter your email");
                      } else if (isValidEmail == false) {
                        showSnackBar("Enter correct email");
                      } else if (_numberController.text.length != 13) {
                        showSnackBar("Enter your Phone number");
                      } else if (_addressController.text.isEmpty) {
                        showSnackBar("Enter your Address");
                      } else if (_ageController.text.isEmpty) {
                        showSnackBar("Enter your Age");
                      } else if (selectedOption == null) {
                        showSnackBar("Select your gender");
                      } else if (_eduController.text.isEmpty) {
                        showSnackBar("Enter your Education");
                      } else if (_birthController.text.isEmpty) {
                        showSnackBar("Enter your Birth Place");
                      } else if (_passController.text.isEmpty ||
                          _passController.text.length < 6) {
                        showSnackBar("Enter password");
                      } else if (_confirmController.text.isEmpty ||
                          _confirmController.text.length < 6) {
                        showSnackBar("Enter confirm password");
                      } else if (_passController.text !=
                          _confirmController.text) {
                        showSnackBar("Password does not match");
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavPage(
                                image: image!,
                                name: _nameController.text,
                               email: _emailController.text,
                                number: _numberController.text,
                                 address: _addressController.text,
                                age: _ageController.text,
                                   gender: selectedOption!,
                                  education: _eduController.text,
                                  birthPlace: _birthController.text,



                              ),
                            ));
                      }
                    },
                    title: "Continue"),
                20.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer(String image) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30).r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40).r,
          border: Border.all(color: Colors.grey.withOpacity(0.4))),
      child: Image.asset(
        image,
        width: 30.r,
        height: 30.r,
      ),
    );
  }

  showSnackBar(String text) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
