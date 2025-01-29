import 'package:edu_track/view/welcome_screen.dart';
import 'package:edu_track/view/student_section/student_main.dart';
import 'package:edu_track/view/teacher_section/teacher_main.dart';
import 'package:edu_track/view/admin_section/admin_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthCheck(), // Redirect to AuthCheck before showing screens
    );
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  void _checkUserStatus() async {
    User? user = _auth.currentUser;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          String role = userDoc['role']; // Get role from Firestore

          if (role == 'Student') {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => StudentMain()));
          } else if (role == 'Teacher') {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => TeacherMain()));
          } else if (role == 'Admin') {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => AdminMain()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Welcome()));
          }
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Welcome()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()), // Show loading
    );
  }
}
