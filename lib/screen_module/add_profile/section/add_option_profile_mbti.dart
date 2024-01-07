import 'package:Kiffy/common/custom_chip.dart';
import 'package:Kiffy/constant/mbti_type.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/common/provider/option_profile_tag_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOptionProfileMbti extends ConsumerWidget {
  final bool hasDivider;

  const AddOptionProfileMbti({
    super.key,
    required this.hasDivider,
  });

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
                          .update((state) => state = e);
                    },
                    child: CustomChip(
                      text: e.text,
                      isChecked: selectedMbti == e,
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        if (hasDivider)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            child: const Divider(),
          ),
      ],
    );
  }
}
