import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileInputNextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileInputNextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        textStyle: const TextStyle(fontSize: 20, color: Colors.white),
        backgroundColor: const Color(0xFF0031AA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(tr("text.next")),
    );
  }
}
