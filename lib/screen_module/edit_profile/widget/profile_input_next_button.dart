import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileInputNextButton extends StatefulWidget {
  final VoidCallback onPressed;
  String? text;
  Color? color;

  ProfileInputNextButton(
      {super.key, required this.onPressed, this.text, this.color});

  @override
  State<ProfileInputNextButton> createState() => _ProfileInputNextButtonState();
}

class _ProfileInputNextButtonState extends State<ProfileInputNextButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (!isLoading) {
            setState(() => isLoading = true);
            widget.onPressed();
          }
          setState(() => isLoading = false);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          textStyle: const TextStyle(fontSize: 20, color: Colors.white),
          backgroundColor: widget.color ?? const Color(0xFF0031AA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              )
            : Text(
                widget.text != null ? widget.text! : tr("text.next"),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
