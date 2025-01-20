import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //welcome vector Image
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 120,
              width: 120,
              child: Image.asset('lib/assets/user.png'),
            ),
            SizedBox(
              height: 20,
            ),

            //Pannel Selection

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 46,
                  width: 104,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                ),
                Container(
                  height: 46,
                  width: 104,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                ),
                Container(
                  height: 46,
                  width: 104,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //Title
            Text(
              "Sign Up",
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    "Sign Up",
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
