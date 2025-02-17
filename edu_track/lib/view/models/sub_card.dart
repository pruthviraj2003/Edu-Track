import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubCard extends StatelessWidget {
  final String subjectName;
  final VoidCallback? onTap;

  const SubCard({super.key, required this.subjectName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Allows clicking functionality
      child: Container(
        height: 80,
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          subjectName,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
