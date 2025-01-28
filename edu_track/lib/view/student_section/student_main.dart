import 'package:edu_track/view/student_section/calander_page.dart';
import 'package:edu_track/view/student_section/course_page.dart';
import 'package:edu_track/view/student_section/home_page.dart';
import 'package:edu_track/view/student_section/profilr_page.dart';
import 'package:flutter/material.dart';

class StudentMain extends StatefulWidget {
  const StudentMain({super.key});

  @override
  State<StudentMain> createState() => _StudentMainState();
}

class _StudentMainState extends State<StudentMain> {
  int selectedIndex = 0;

  List page = [
    HomePage(),
    SubjectPage(),
    CalenderPage(),
    ProfilePage(),
  ];

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
              icon: Icon(Icons.book, color: Colors.black), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month, color: Colors.black), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: ""),
        ],
      ),
    );
  }
}
