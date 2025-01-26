import 'package:edu_track/view/student_section/student_main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //welcome Image
            SizedBox(
              height: 150,
            ),
            SizedBox(
              height: 180,
              width: 180,
              child: Image.asset('lib/assets/user.png'),
            ),
            SizedBox(
              height: 20,
            ),
            //Title
            Text(
              "Sign In",
              style: GoogleFonts.poppins(
                  fontSize: 36, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            //Email Field
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            //Button
            SizedBox(
              height: 65,
              width: 267,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentMain()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
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
    );
  }
}
