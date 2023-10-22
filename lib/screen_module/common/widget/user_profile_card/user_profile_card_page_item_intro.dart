import 'package:flutter/material.dart';

class UserProfileCardPageItemIntro extends StatelessWidget {
  final String intro;

  const UserProfileCardPageItemIntro({super.key, required this.intro});

  @override
  Widget build(BuildContext context) {
    return Text(
      intro,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    );
  }
}
