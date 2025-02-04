// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('Edu Track',
//             style: GoogleFonts.poppins(
//                 fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue)),
//         actions: [
//           IconButton(
//               icon: Icon(
//                 Icons.qr_code,
//                 color: Colors.black,
//               ),
//               onPressed: () {}),
//           IconButton(
//               icon: Icon(
//                 Icons.notifications,
//                 color: Colors.black,
//               ),
//               onPressed: () {}),
//         ],
//       ),
//       body: Center(
//         child: Text("Home Page"),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  String firstName = "User";

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        setState(() {
          firstName = userDoc['firstName'] ?? "User";
        });
      }
    } catch (e) {
      print("Error fetching user name: $e");
    }
  }

  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Edu Track',
          style: GoogleFonts.poppins(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.qr_code, color: Colors.black), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.amber,
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  getGreeting(),
                  style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  firstName,
                  style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                )
              ])
            ],
          ),
        ]),
      ),
    );
  }
}
