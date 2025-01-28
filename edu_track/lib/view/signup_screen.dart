import 'package:edu_track/view/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<SignupScreen> {
  String selectedRole = "";

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String? _role; // Selected role
  String _name = '', _email = '', _password = '';

  // Sign-Up Logic
  Future<void> _signUp() async {
    if (_role == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select a role"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // Store user in the correct Firestore collection
      await _firestore
          .collection(_role!.toLowerCase() + "s")
          .doc(user.user!.uid)
          .set({
        'name': _name,
        'email': _email,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigninScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

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
                height: 120,
                width: 120,
                child: Image.asset('lib/assets/user.png'),
              ),
              SizedBox(
                height: 20,
              ),

              // Role Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (String role in ['Student', 'Teacher', 'Admin'])
                    ElevatedButton(
                      onPressed: () => setState(() => _role = role),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _role == role ? Colors.blue : Colors.grey,
                      ),
                      child: Text(
                        role,
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
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
                  onChanged: (value) => _name = value,
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
                  onChanged: (value) => _email = value,
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
                  onChanged: (value) => _password = value,
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
                      _signUp();
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
