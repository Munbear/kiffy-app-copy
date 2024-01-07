import 'package:flutter/material.dart';

class EditProfileHeaderTitle extends StatelessWidget {
  final String text;

  const EditProfileHeaderTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xff494949),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class EditProfileText extends StatelessWidget {
  final String text;

  const EditProfileText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xff494949),
      ),
    );
  }
}
