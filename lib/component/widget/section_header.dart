
import 'package:dailydiu/screen/features/all_features.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;


  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AllFeatures.id);
            },
            child: const Text(
              "See all",
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}