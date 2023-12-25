import 'package:Kiffy/common/custom_chip.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/option_tag/option_profile_tag_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OptionProfileSelector extends StatelessWidget {
  final String title;
  final List<dynamic> itemList;
  final bool showDivider;

  const OptionProfileSelector({
    super.key,
    required this.title,
    required this.itemList,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Space(height: 10),
        Wrap(
          direction: Axis.vertical,
          children: itemList.map(
            (e) {
              return Consumer(
                builder: (context, ref, child) {
                  final selectedZodiac = ref.watch(selecteZodiac);
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(selecteZodiac.notifier)
                          .update((state) => state = e.value);
                    },
                    child: CustomChip(
                      isChecked: selectedZodiac == e.value,
                      text: e.text,
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        if (showDivider)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            child: const Divider(),
          ),
      ],
    );
  }
}
