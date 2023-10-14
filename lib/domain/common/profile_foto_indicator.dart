import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileFotoIndicator extends ConsumerWidget {
  final int mediasLength;
  final double endIndex;

  const ProfileFotoIndicator({
    super.key,
    required this.mediasLength,
    required this.endIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 100,
        height: 3,
        color: Colors.white.withOpacity(0.5),
        alignment: Alignment.centerLeft,
        child: Container(
          width: 100 / mediasLength,
          height: 3,
          color: Colors.white,
        ).animate().slideX(begin: 0.0, end: endIndex),
      ),
    );
  }
}
