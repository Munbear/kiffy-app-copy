import 'package:flutter/material.dart';

class ProfileInputTextFormField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? hintText;

  const ProfileInputTextFormField({super.key, required this.onChanged, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (t) => onChanged(t),
      style: const TextStyle(
      fontSize: 20, color: Color(0xFF6C6C6C)),
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xffcecece), width: 2.0),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xff0031AA), width: 3.0),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15)),
        ),
        contentPadding: EdgeInsets.all(18),
      ),
    );
  }
}
