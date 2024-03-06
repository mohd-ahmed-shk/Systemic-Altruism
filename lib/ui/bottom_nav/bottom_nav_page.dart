import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gryson/ui/profile_detail/profile_detail_page.dart';

import '../matches/matches_page.dart';
import '../search/search_apge.dart';

class BottomNavPage extends StatefulWidget {
  final File image;
  final String name;
  final String email;
  final String number;
  final String address;
  final String age;
  final String education;
  final String birthPlace;
  final int gender;

  const BottomNavPage(
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
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0; //New

  late final List<Widget> _pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = <Widget>[
      const MatchesPage(),
      const SearchPage(),
      ProfileDetailPage(
          image: widget.image,
          name: widget.name,
          email: widget.email,
          number: widget.number,
          address: widget.address,
          age: widget.age,
          education: widget.education,
          birthPlace: widget.birthPlace,
          gender: widget.gender)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _pages.elementAt(_selectedIndex), //New
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        elevation: 0,
        backgroundColor: const Color(0xFFD5715B),
        unselectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(color: Colors.black45),
        selectedItemColor: Colors.black45,
        iconSize: 25.r,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Favourite"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
