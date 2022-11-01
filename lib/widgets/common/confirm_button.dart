import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final String text;

  const ConfirmButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(-0.94, 1.8),
          colors: [
            Color(0xffBA00FF),
            Color(0xffB003FA),
            Color(0xff960AEE),
            Color(0xff6A15DB),
            Color(0xff2F25BF),
            Color(0xff0031AA),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
