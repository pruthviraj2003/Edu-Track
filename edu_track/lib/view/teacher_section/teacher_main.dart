import 'package:edu_track/view/teacher_section/home_page.dart';
import 'package:edu_track/view/teacher_section/profile_page.dart';
import 'package:flutter/material.dart';

class TeacherMain extends StatefulWidget {
  const TeacherMain({super.key});

  @override
  State<TeacherMain> createState() => _TeacherMainState();
}

class _TeacherMainState extends State<TeacherMain> {
  int selectedIndex = 0;

  List page = [TeacherHomePage(), TeacherProfilePage()];

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
