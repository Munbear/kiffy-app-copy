import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(240, 240, 240, 1),
      highlightColor: Colors.white,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
      ),
    );
  }
}
