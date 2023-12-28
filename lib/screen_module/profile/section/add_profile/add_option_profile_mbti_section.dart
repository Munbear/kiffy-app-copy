import 'package:Kiffy/common/custom_chip.dart';
import 'package:Kiffy/constant/mbti_type.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/option_tag/option_profile_tag_provider.dart';
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
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: MBTI.values.map(
            (e) {
              return Consumer(
                builder: (context, ref, child) {
                  final selectedMbti = ref.watch(selectedMbitState);
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(selectedMbitState.notifier)
                          .update((state) => state = e.text);
                    },
                    child: CustomChip(
                      text: e.text,
                      isChecked: selectedMbti == e.text,
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 25),
          child: const Divider(),
        ),
        // const DiagonalWidget(),
        // Row(
        //   children: [
        //     Consumer(
        //       builder: (context, ref, child) {
        //         final isSelectedFirst = ref.watch(selectedMbitFirst);
        //         return MbtiChip(
        //           onTap: (index, value) {
        //             ref
        //                 .read(selectedMbitFirst.notifier)
        //                 .update((state) => state = value);
        //           },
        //           mbtiTypes: mbtis,
        //           isSelected: false,
        //         );
        //       },
        //     ),
        //     const DiagonalWidget(),
        //     // Consumer(
        //     //   builder: (context, ref, child) {
        //     //     return MbtiChip(
        //     //       onTap: (text) {},
        //     //       onSelectSecond: (text) {},
        //     //       textFirst: MBTI.n.text,
        //     //       textSecond: MBTI.s.text,
        //     //       isSelected: false,
        //     //     );
        //     //   },
        //     // ),
        //     // const DiagonalWidget(),
        //     // Consumer(
        //     //   builder: (context, ref, child) {
        //     //     return MbtiChip(
        //     //       onTap: (text) {},
        //     //       onSelectSecond: (text) {},
        //     //       textFirst: MBTI.t.text,
        //     //       textSecond: MBTI.f.text,
        //     //       isSelected: false,
        //     //     );
        //     //   },
        //     // ),
        //     // const DiagonalWidget(),
        //     // Consumer(
        //     //   builder: (context, ref, child) {
        //     //     return MbtiChip(
        //     //       onTap: (text) {},
        //     //       onSelectSecond: (text) {},
        //     //       textFirst: MBTI.j.text,
        //     //       textSecond: MBTI.p.text,
        //     //       isSelected: false,
        //     //     );
        //     //   },
        //     // ),
        //   ],
        // ),
        // Container(
        //   margin: const EdgeInsets.symmetric(vertical: 25),
        //   child: const Divider(),
        // ),
      ],
    );
  }
}
