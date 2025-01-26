import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Edu Track',
            style: GoogleFonts.poppins(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue)),
        actions: [
          IconButton(
              icon: Icon(
                Icons.qr_code,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
