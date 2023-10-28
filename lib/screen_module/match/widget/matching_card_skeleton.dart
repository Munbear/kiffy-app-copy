import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MatchingCardSkeleton extends StatelessWidget {
  const MatchingCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 18,
        mainAxisSpacing: 6,
        children: List.generate(
          6,
          (index) {
            return Container(
                    height: 205,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ))
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOutQuad,
                );
          },
        ),
      ),
    );
  }
}
