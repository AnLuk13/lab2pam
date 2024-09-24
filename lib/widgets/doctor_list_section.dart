import 'package:flutter/material.dart';
import 'doctor_card.dart';

class DoctorListSection extends StatefulWidget {
  @override
  _DoctorListSectionState createState() => _DoctorListSectionState();
}

class _DoctorListSectionState extends State<DoctorListSection> {
  List<Map<String, dynamic>> generateDoctorCards() {
    return List<Map<String, dynamic>>.generate(10000, (index) {
      final adjustedIndex = index + 1;
      return {
        'id': adjustedIndex, // Unique ID for each card to avoid conflicts
        'name': 'Dr. Doctor $adjustedIndex',
        'specialty': 'Specialty ${adjustedIndex % 5}', // Different specialties
        'location': 'Clinic ${adjustedIndex % 10}, USA', // Different locations
        'rating': 4.5 + (adjustedIndex % 10) / 10, // Slightly different ratings
        'reviews': 100 + adjustedIndex, // Unique reviews count
        'imagePath': 'assets/images/doctor${(adjustedIndex % 5) + 1}.png', // Loop through 5 images
      };
    });
  }

  bool isReversed = false; // Track if the list is reversed
  late List<Map<String, dynamic>> doctorCards;

  @override
  void initState() {
    super.initState();
    doctorCards = generateDoctorCards();
  }

  // Method to reverse the list
  void reverseList() {
    setState(() {
      isReversed = !isReversed;
      doctorCards = doctorCards.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display the number of found doctors
            Text(
              '${doctorCards.length} found',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            GestureDetector(
              onTap: reverseList, // Reverse list when clicked
              child: const Text(
                'Default',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        // ListView.builder to render the doctor list
        Expanded( // Expanded ensures ListView.builder fills the available space
          child: ListView.builder(
            itemCount: doctorCards.length,
            itemBuilder: (context, index) {
              final doctor = doctorCards[index];
              return DoctorCard(
                key: ValueKey(doctor['id']), // Unique key for each card
                id: doctor['id'], // Unique ID passed to the card
                name: doctor['name'],
                specialty: doctor['specialty'],
                location: doctor['location'],
                rating: doctor['rating'],
                reviews: doctor['reviews'],
                imagePath: doctor['imagePath'],
              );
            },
          ),
        ),
      ],
    );
  }
}
