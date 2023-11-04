import 'package:flutter/material.dart';

class KiffyInputStyle {
  static InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      enabledBorder: enabledBorder(),
      focusedBorder: focusedBorder(),
      contentPadding: const EdgeInsets.all(18),
    );
  }

  static OutlineInputBorder enabledBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffcecece), width: 2.0),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
          topRight: Radius.circular(15)),
    );
  }

  static OutlineInputBorder focusedBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff0031AA), width: 3.0),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
          topRight: Radius.circular(15)),
    );
  }

  static BoxDecoration boxDecorationRounded({required bool isBordered}) {
    return BoxDecoration(
      border: isBordered
          ? Border.all(color: const Color(0xFFCECECE), width: 2.0)
          : null,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    );
  }
}
