import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16)),
            Text('See All', style: TextStyle(color: Colors.blue)),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryCard(
                title: 'Dentistry',
                iconPath: 'assets/images/dental.png',
                backgroundColor: const Color(0xFFDC9497)),
            CategoryCard(
                title: 'Cardiology',
                iconPath: 'assets/images/cardio.png',
                backgroundColor: const Color(0xFF93C19E)),
            CategoryCard(
                title: 'Pulmonology',
                iconPath: 'assets/images/pulmo.png',
                backgroundColor: const Color(0xFFF5AD7E)),
            CategoryCard(
                title: 'General',
                iconPath: 'assets/images/general.png',
                backgroundColor: const Color(0xFFACA1CD)),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryCard(
                title: 'Neurology',
                iconPath: 'assets/images/neurology.png',
                backgroundColor: const Color(0xFF4D9B91)),
            CategoryCard(
                title: 'Gastroenterology',
                iconPath: 'assets/images/gastro.png',
                backgroundColor: const Color(0xFF352261)),
            CategoryCard(
                title: 'Laboratory',
                iconPath: 'assets/images/lab.png',
                backgroundColor: const Color(0xFFDEB6B5)),
            CategoryCard(
                title: 'Vaccination',
                iconPath: 'assets/images/vaccination.png',
                backgroundColor: const Color(0xFF89CCDB)),
          ],
        ),
      ],
    );
  }
}
