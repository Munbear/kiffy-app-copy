import 'package:Kiffy/screen_module/profile/section/add_profile/add_basic_profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressGaugeBar extends ConsumerWidget {
  const ProgressGaugeBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final persent = ref.watch(progressGauge);
    return LinearPercentIndicator(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      animation: true,
      animationDuration: 300,
      lineHeight: 12.0,
      percent: persent,
      barRadius: const Radius.circular(20),
      backgroundColor: Colors.grey[200],
      linearGradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xffBA00FF),
          Color(0xff0031AA),
        ],
      ),
    );
  }
}
