import 'package:Kiffy/common/custom_chip.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class OptionProfileSeverForm extends StatelessWidget {
  // final VoidCallback onTap;
  final String title;
  final ProfileTagViewTagTypesInner items;
  final bool hasDivider;

  const OptionProfileSeverForm({
    super.key,
    // required this.onTap,
    required this.title,
    required this.items,
    required this.hasDivider,
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
          children: items.tags!.map(
            (e) {
              return GestureDetector(
                onTap: () {
                  print(e.i18nKey.tr());
                },
                child: CustomChip(
                  text: e.i18nKey.tr(),
                ),
              );
            },
          ).toList(),
        ),
        if (hasDivider)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: const Divider(),
          ),
      ],
    );
  }
}
