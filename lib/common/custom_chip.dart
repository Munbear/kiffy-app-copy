import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String text;
  const CustomChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      side: BorderSide(color: Colors.transparent),
      backgroundColor: Color(0xFFF5F5F5),
      label: Text(text),
    );
  }
}
