import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileInputNextButton extends StatelessWidget {
  final VoidCallback onPressed;
  String? text;
  Color? color;

  ProfileInputNextButton(
      {super.key, required this.onPressed, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          textStyle: const TextStyle(fontSize: 20, color: Colors.white),
          backgroundColor: color != null ? color : Color(0xFF0031AA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text != null ? text! : tr("text.next")),
      ),
    );
  }
}
