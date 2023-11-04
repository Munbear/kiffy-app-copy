import 'package:flutter/material.dart';

class KiffyTextFieldMultiline extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const KiffyTextFieldMultiline({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (t) => onChanged(t),
      minLines: 5,
      maxLines: 5,
      style: const TextStyle(
        fontSize: 20,
        color: Color(0xFF6C6C6C),
      ),
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffcecece), width: 2.0),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff0031AA), width: 3.0),
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
