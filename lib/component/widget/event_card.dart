import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
          height: 80,
          padding: const EdgeInsets.all(8),
          child: const Center(
            child: Text(
              "Event",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}