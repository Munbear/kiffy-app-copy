import 'package:Kiffy/screen_module/add_profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/add_profile/section/add_basic_profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressGaugeBar extends ConsumerWidget {
  const ProgressGaugeBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final persent = ref.watch(progressGauge);
    final persent2 = ref.watch(progressGaug2);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final progressWidth = maxWidth * (persent2 / 100);
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.bounceInOut,
                  width: progressWidth,
                  height: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffBA00FF),
                        Color(0xff0031AA),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12)),
                    height: 12,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
    // return LinearPercentIndicator(
    //   padding: const EdgeInsets.symmetric(horizontal: 24),
    //   animation: true,
    //   animationDuration: 300,
    //   lineHeight: 12.0,
    //   percent: persent,
    //   barRadius: const Radius.circular(20),
    //   backgroundColor: Colors.grey[200],
    //   linearGradient: const LinearGradient(
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     colors: [
    //       Color(0xffBA00FF),
    //       Color(0xff0031AA),
    //     ],
    //   ),
    // );
  }
}
