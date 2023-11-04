import 'package:flutter/material.dart';

class ProfileInputValidationText extends StatelessWidget {
  final String normalText;
  final String violatedText;
  final bool Function() check;

  const ProfileInputValidationText({
    super.key,
    required this.normalText,
    required this.violatedText,
    required this.check,
  });

  @override
  Widget build(BuildContext context) {
    return check()
        ? Text(
            normalText,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF0031AA),
            ),
          )
        : Text(
            violatedText,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF0031AA),
            ),
          );
  }
}
