import 'package:flutter/material.dart';

// border Radius 10
class BorderGradientBorderRadius10 {
  static BoxDecoration innerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.18),
        blurRadius: 3,
        offset: const Offset(0, 3),
      )
    ],
  );

  static BoxDecoration outlineGradientBoxDecoration = BoxDecoration(
    border: Border.all(color: Colors.transparent),
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffBA00FF),
        Color(0xff0031AA),
      ],
    ),
  );
}

class BorderGradientCircleShape {
  static BoxDecoration innerDecoration = BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
  );

  static BoxDecoration outlineGradientBoxDecoration = BoxDecoration(
    border: Border.all(color: Colors.transparent, width: 2),
    shape: BoxShape.circle,
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffBA00FF),
        Color(0xff0031AA),
      ],
    ),
  );
}

class BorderGradientBorderRadius50 {
  static BoxDecoration innerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(50),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.18),
        blurRadius: 3,
        offset: const Offset(0, 3),
      )
    ],
  );

  static BoxDecoration outlineGradientBoxDecoration = BoxDecoration(
    border: Border.all(color: Colors.transparent),
    borderRadius: BorderRadius.circular(50),
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffBA00FF),
        Color(0xff0031AA),
      ],
    ),
  );

  static BoxDecoration outlineGreyBoxDecoration = BoxDecoration(
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(50),
  );
}
