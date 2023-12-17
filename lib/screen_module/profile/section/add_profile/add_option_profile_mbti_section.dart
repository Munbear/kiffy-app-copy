import 'package:Kiffy/constant/mbti_type.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/diagonal_painter.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/mbti_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOptionProfileMbtiSection extends ConsumerWidget {
  const AddOptionProfileMbtiSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "What is your MBTI",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Space(height: 6),
        Row(
          children: [
            MbtiChip(
              onSelectFirst: () {},
              onSelectSecond: () {},
              textFirst: MBTI.e.text,
              textSecond: MBTI.i.text,
            ),
            const DiagonalWidget(),
            MbtiChip(
              onSelectFirst: () {},
              onSelectSecond: () {},
              textFirst: MBTI.s.text,
              textSecond: MBTI.n.text,
            ),
            const DiagonalWidget(),
            MbtiChip(
              onSelectFirst: () {},
              onSelectSecond: () {},
              textFirst: MBTI.f.text,
              textSecond: MBTI.t.text,
            ),
            const DiagonalWidget(),
            MbtiChip(
              onSelectFirst: () {},
              onSelectSecond: () {},
              textFirst: MBTI.p.text,
              textSecond: MBTI.j.text,
            ),
          ],
        ),
        const Space(height: 16),
        const Divider(),
        const Space(height: 25),
      ],
    );
  }
}
