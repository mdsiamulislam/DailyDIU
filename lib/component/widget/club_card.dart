
import 'package:flutter/material.dart';

class ClubCard extends StatelessWidget {
  final String title;

  const ClubCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.group,
              color: Colors.blue,
              size: 30,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}