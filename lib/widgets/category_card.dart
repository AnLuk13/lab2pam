import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color backgroundColor;

  CategoryCard({
    required this.title,
    required this.iconPath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Truncate the title if it is longer than 7 characters
    String truncatedTitle = title.length > 7 ? '${title.substring(0, 7)}...' : title;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            iconPath,
            height: 30,
            width: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(
          truncatedTitle, // Use the truncated title here
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
