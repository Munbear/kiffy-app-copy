import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class UserProfileCardPageIndicator extends StatelessWidget {
  final int totalPage;
  final double page;

  const UserProfileCardPageIndicator(
      {super.key, required this.totalPage, required this.page});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 100,
        height: 3,
        color: Colors.white.withOpacity(0.5),
        alignment: Alignment.centerLeft,
        child: Container(
          width: 100 / totalPage,
          height: 3,
          color: Colors.white,
        ).animate().slideX(begin: 0.0, end: page.toDouble()),
      ),
    );
  }
}
