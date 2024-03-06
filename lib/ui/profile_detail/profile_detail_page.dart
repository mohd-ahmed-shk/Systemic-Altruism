import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gryson/widgets/base_app_bar.dart';

class ProfileDetailPage extends StatefulWidget {
  final File image;
  final String name;
  final String email;
  final String number;
  final String address;
  final String age;
  final String education;
  final String birthPlace;
  final int gender;

  const ProfileDetailPage(
      {super.key,
      required this.image,
      required this.name,
      required this.email,
      required this.number,
      required this.address,
      required this.age,
      required this.education,
      required this.birthPlace,
      required this.gender});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45.withOpacity(0.1),

      appBar: BaseAppBar(
        title: Text("Profile Details",style: TextStyle(color: Colors.white,fontSize: 20.sp),),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    widget.image,
                    width: 150.r,
                    height: 150.r,
                    fit: BoxFit.cover,
                  ),
                ),
                30.verticalSpace,
                userDetails("Name : ", widget.name),
                5.verticalSpace,
                userDetails("Age : ", widget.age),
                5.verticalSpace,
                userDetails("Gender : ", widget.gender == 1 ? "Male" : "Female"),
                5.verticalSpace,
                userDetails("Address : ", widget.address),
                5.verticalSpace,
                userDetails("Phone Number : ", widget.number),
                5.verticalSpace,
                userDetails("Email : ", widget.email),
                5.verticalSpace,
                userDetails("Birth Place : ", widget.birthPlace),
                5.verticalSpace,
                userDetails("Education : ", widget.education),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget userDetails(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 20.sp), textAlign: TextAlign.left),
          Text(
            value,
            style: TextStyle(fontSize: 20.sp),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }

}
