import 'package:flutter/material.dart';

class AddProfileInputHeaderTitle extends StatelessWidget {
  final String text;

  const AddProfileInputHeaderTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        color: Color(0xff0031AA),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class AddProfileInputHeaderSubTitle extends StatelessWidget {
  final String text;

  const AddProfileInputHeaderSubTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        color: Color(0xff494949),
      ),
    );
  }
}
