import 'package:edu_track/view/admin_section/home_page.dart';
import 'package:edu_track/view/admin_section/profile_page.dart';
import 'package:flutter/material.dart';

class AdminMain extends StatefulWidget {
  const AdminMain({super.key});

  @override
  State<AdminMain> createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> {
  int selectedIndex = 0;

  List page = [AdminHomePage(), AdminProfilePage()];

  void Function(int)? onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: ""),
        ],
      ),
    );
  }
}
