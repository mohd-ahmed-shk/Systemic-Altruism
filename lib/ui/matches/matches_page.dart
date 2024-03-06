import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gryson/model/user_list.dart';
import 'package:gryson/model/user_model.dart';
import 'package:gryson/ui/user_info/user_info_page.dart';
import 'package:gryson/widgets/base_app_bar.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45.withOpacity(0.1),
      appBar: BaseAppBar(
        title: Text(
          "Matches",
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: userList.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            UserModel person = userList[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoPage(user: person,),));
              },
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10).r,
                leading: ClipRRect(borderRadius: BorderRadius.circular(100).r,child: Image.asset(person.image,fit: BoxFit.cover,width: 50.r,height: 50.r,),),
                title: Text(person.fullName),
                subtitle: Text(person.gender),
        
        
        
              ),
            );
          },
        ),
      ),
    );
  }
}
