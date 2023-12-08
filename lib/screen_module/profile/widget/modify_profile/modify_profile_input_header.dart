import 'package:flutter/material.dart';

class ModifyProfileHeaderTitle extends StatelessWidget {
  final String text;

  const ModifyProfileHeaderTitle({super.key, required this.text});

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

class ModifyProfileText extends StatelessWidget {
  final String text;

  const ModifyProfileText({super.key, required this.text});

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
