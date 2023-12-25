import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final bool isChecked;

  const CustomChip({
    super.key,
    required this.text,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      side: BorderSide(
        color: isChecked ? const Color(0xff0031AA) : Colors.transparent,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      label: Text(
        text,
        style: TextStyle(
          color: isChecked ? const Color(0xFF0031AA) : const Color(0xFF6C6C6C),
        ),
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
