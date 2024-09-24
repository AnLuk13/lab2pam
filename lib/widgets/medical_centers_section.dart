import 'package:flutter/material.dart';
import 'medical_center_card.dart';

class MedicalCentersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Nearby Medical Centers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('See All', style: TextStyle(color: Colors.blue)),
          ],
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MedicalCenterCard(
                title: 'Sunrise Health Clinic',
                location: '123 Oak Street, CA 98765',
                rating: 5.0,
                distance: '2.5 km',
                time: '40min',
                imagePath: 'assets/images/doctor.png',
              ),
              MedicalCenterCard(
                title: 'Golden Cardio Clinic',
                location: '555 Bridge Street, CA 98765',
                rating: 4.9,
                distance: '2.5 km',
                time: '40min',
                imagePath: 'assets/images/golden.png',
              ),
              MedicalCenterCard(
                title: 'Republical Clinic',
                location: 'Chisinau',
                rating: 4.7,
                distance: '5 km',
                time: '50min',
                imagePath: 'assets/images/republican.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
