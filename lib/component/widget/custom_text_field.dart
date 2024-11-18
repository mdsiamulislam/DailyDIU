// Reusable widget for text field
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.keyboardType,
    required this.lasbels,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    super.key,
  });

  String lasbels;
  String hintText;
  Icon prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration:  InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
        label: Text(lasbels),
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}