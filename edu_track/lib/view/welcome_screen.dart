import 'package:edu_track/view/signin_screen.dart';
import 'package:edu_track/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            //welcome Image
            SizedBox(
              height: 150,
            ),
            Image.asset('lib/assets/welcomeImage.png'),
            SizedBox(
              height: 20,
            ),
            //Title
            Text(
              "EduTrack",
              style: GoogleFonts.poppins(
                  fontSize: 36, fontWeight: FontWeight.w800),
            ),
            //Button
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 65,
              width: 267,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigninScreen()));
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
            //sub text
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "don’t have an account?",
                  style: GoogleFonts.poppins(),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
