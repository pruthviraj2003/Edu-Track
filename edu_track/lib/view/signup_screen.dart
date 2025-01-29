import 'package:edu_track/view/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String? _role; // Selected role
  String _name = '', _email = '', _password = '', _confirmPassword = '';

  // Sign-Up Logic
  Future<void> _signUp() async {
    // Validate input fields
    if (_name.isEmpty ||
        _email.isEmpty ||
        _password.isEmpty ||
        _confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields are required"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    if (_password != _confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Passwords do not match"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    if (_role == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select a role"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    try {
      // Create the user in Firebase Auth
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // Store user details in Firestore
      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        'name': _name,
        'email': _email,
        'role': _role, // Store role here
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Navigate to Sign-in screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigninScreen()),
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sign up successful! Please log in."),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      // Handle errors (e.g., email already in use)
      // ignore: use_build_context_synchronously
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
              // Welcome vector image
              SizedBox(
                height: 120,
                width: 120,
                child: Image.asset('lib/assets/user.png'),
              ),
              const SizedBox(height: 20),

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
              const SizedBox(height: 10),

              // Title
              Text(
                "Sign Up",
                style: GoogleFonts.poppins(
                    fontSize: 36, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),

              // Name Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => _name = value,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              // Email Field
              Padding(
                padding: const EdgeInsets.all(8.0),
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

              // Password Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) => _password = value,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              // Confirm Password Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) => _confirmPassword = value,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Sign Up Button
              SizedBox(
                height: 65,
                width: 267,
                child: ElevatedButton(
                    onPressed: _signUp,
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
