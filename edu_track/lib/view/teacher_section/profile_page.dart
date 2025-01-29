import "package:edu_track/view/welcome_screen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class TeacherProfilePage extends StatelessWidget {
  const TeacherProfilePage({super.key});

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Welcome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Center(
        child: ElevatedButton(
            onPressed: () => _logout(context), child: Text("Log Out")),
      )),
    );
  }
}
