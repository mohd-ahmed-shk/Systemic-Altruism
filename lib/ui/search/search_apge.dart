import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gryson/model/user_list.dart';
import 'package:gryson/model/user_model.dart';
import 'package:gryson/ui/search/widget/search_widget.dart';
import 'package:gryson/ui/user_info/user_info_page.dart';
import 'package:gryson/widgets/base_app_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  late List<UserModel> searchedUser;
  String query = "";

  @override
  void initState() {
    super.initState();
    searchedUser = userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45.withOpacity(0.1),
      appBar: BaseAppBar(
        title: Text(
          "Search User",
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
          child: Column(children: [
            buildTextFormField(),
            searchedUser.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: searchedUser.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        UserModel searchedUserList = searchedUser[index];
                        return buildInkWell(context, searchedUserList);
                      },
                    ),
                  )
                : Text(
                    "User Not Found",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  )
          ]),
        ),
      ),
    );
  }

  Widget buildTextFormField() => SearchWidget(
      text: query, onChanged: searchUser, hintText: "Search the User");

  void searchUser(String query) {
    final updatedUser = userList.where((book) {
      final titleLower = book.fullName.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      searchedUser = updatedUser;
    });
  }

  InkWell buildInkWell(BuildContext context, UserModel person) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserInfoPage(
                user: person,
              ),
            ));
      },
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 0, vertical: 10).r,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100).r,
          child: Image.asset(
            person.image,
            fit: BoxFit.cover,
            width: 50.r,
            height: 50.r,
          ),
        ),
        title: Text(person.fullName),
        subtitle: Text(person.gender),
      ),
    );
  }
}
