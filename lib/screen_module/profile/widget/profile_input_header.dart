import 'package:flutter/material.dart';

class ProfileInputHeaderTitle extends StatelessWidget {
  final String text;

  const ProfileInputHeaderTitle({super.key, required this.text});

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

class ProfileInputHeaderSubTitle extends StatelessWidget {
  final String text;

  const ProfileInputHeaderSubTitle({super.key, required this.text});

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
