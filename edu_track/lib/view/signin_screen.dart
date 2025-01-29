import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_track/view/admin_section/admin_main.dart';
import 'package:edu_track/view/student_section/student_main.dart';
import 'package:edu_track/view/teacher_section/teacher_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<SigninScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _email = "", _password = "";

  Future<void> _signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      String userId = userCredential.user!.uid;

      // Fetch role from Firestore
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        String role = userDoc['role']; // Assuming role is stored under 'role'

        // Navigate to the correct screen based on role
        if (role == 'Student') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const StudentMain()));
        } else if (role == 'Teacher') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const TeacherMain()));
        } else if (role == 'Admin') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AdminMain()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid role assigned")),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 150),
              SizedBox(
                  height: 180,
                  width: 180,
                  child: Image.asset('lib/assets/user.png')),
              SizedBox(height: 20),
              Text("Sign In",
                  style: GoogleFonts.poppins(
                      fontSize: 36, fontWeight: FontWeight.w600)),
              SizedBox(height: 15),

              // Email Field
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  onChanged: (value) => _email = value,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),

              // Password Field
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  onChanged: (value) => _password = value,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),

              // Sign In Button
              SizedBox(
                height: 65,
                width: 267,
                child: ElevatedButton(
                    onPressed: _signIn,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
