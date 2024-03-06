import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gryson/widgets/base_app_bar.dart';

import '../../model/user_model.dart';

class UserInfoPage extends StatefulWidget {
  final UserModel user;

  const UserInfoPage({super.key, required this.user});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(widget.user.fullName,),
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
                  child: Image.asset(
                    widget.user.image,
                    width: 150.r,
                    height: 150.r,
                    fit: BoxFit.cover,
                  ),
                ),
                30.verticalSpace,
                userDetails("Name : ", widget.user.fullName),
                5.verticalSpace,
                userDetails("Age : ", widget.user.age),
                5.verticalSpace,
                userDetails("Gender : ", widget.user.gender),
                5.verticalSpace,
                userDetails("Address : ", widget.user.address),
                5.verticalSpace,
                userDetails("Phone Number : ", widget.user.phoneNumber),
                5.verticalSpace,
                userDetails("Email : ", widget.user.email),
                5.verticalSpace,
                userDetails("Birth Place : ", widget.user.birthPlace),
                5.verticalSpace,
                userDetails("Education : ", widget.user.education),
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
