import 'package:edu_track/view/models/sub_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of subjects for dynamic display
    final List<String> subjects = [
      "Mathematics",
      "Physics",
      "Chemistry",
      "Biology",
      "English",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subjects',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SubCard(subjectName: subjects[index]),
            );
          },
        ),
      ),
    );
  }
}
