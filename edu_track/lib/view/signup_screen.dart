import 'package:edu_track/view/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<SignupScreen> {
  bool stdFlag = false;
  bool teacherFlag = false;
  bool adminFLag = false;
  Color textClr = Colors.black;
  Color buttonClr = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        stdFlag = true;
                        teacherFlag = false;
                        adminFLag = false;
                        textClr = Colors.white;
                        buttonClr = Colors.blue;
                      });
                    },
                    child: Container(
                      height: 46,
                      width: 104,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: buttonClr,
                      ),
                      child: Center(
                          child: Text(
                        "Student",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: textClr,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        stdFlag = false;
                        teacherFlag = true;
                        adminFLag = false;
                        textClr = Colors.white;
                        buttonClr = Colors.blue;
                      });
                    },
                    child: Container(
                      height: 46,
                      width: 104,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: buttonClr,
                      ),
                      child: Center(
                          child: Text(
                        "Teacher",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: textClr,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        stdFlag = false;
                        teacherFlag = false;
                        adminFLag = true;
                        textClr = Colors.white;
                        buttonClr = Colors.blue;
                      });
                    },
                    child: Container(
                      height: 46,
                      width: 104,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: buttonClr,
                      ),
                      child: Center(
                          child: Text(
                        "Admin",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: textClr,
                            fontWeight: FontWeight.bold),
                      )),
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
                padding: EdgeInsets.all(5),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
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
                              builder: (context) => const SigninScreen()));
                    },
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
      ),
    );
  }
}
