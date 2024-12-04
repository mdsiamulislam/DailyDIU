import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final String imageUrl;

  ImageSlider({
    super.key,
    required this.imageUrl, // Required named parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue[100],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(0.5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
