import 'package:Kiffy/common/custom_chip.dart';
import 'package:Kiffy/constant/mbti_type.dart';
import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/common/provider/option_profile_tag_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class AddOptionProfileMbti extends ConsumerStatefulWidget {
  final bool hasDivider;
  final MBTITypeEnumView? initValue;

  const AddOptionProfileMbti({
    super.key,
    required this.hasDivider,
    this.initValue,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddOptionProfileMbtiState();
}

class _AddOptionProfileMbtiState extends ConsumerState<AddOptionProfileMbti> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (widget.initValue != null) {
          ref
              .read(selectedMbitState.notifier)
              .update((state) => state = MBTI.enumViewToEnum(widget.initValue));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        Gab.height6,
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: MBTI.values.map(
            (e) {
              return Consumer(
                builder: (context, ref, child) {
                  MBTI? selectedMbti = ref.watch(selectedMbitState);
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
        if (widget.hasDivider)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            child: const Divider(),
          ),
      ],
    );
  }
}
