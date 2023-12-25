import 'package:Kiffy/common/custom_chip.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/option_tag/option_profile_tag_provider.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class OptionProfileSeverForm extends StatelessWidget {
  final ValueChanged<int> onTap;
  final String title;
  final ProfileTagViewTagTypesInner items;
  final bool hasDivider;
  final bool isMultiSelecte;

  const OptionProfileSeverForm({
    super.key,
    required this.onTap,
    required this.title,
    required this.items,
    required this.hasDivider,
    required this.isMultiSelecte,
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
              return Consumer(
                builder: (context, ref, child) {
                  List<int> selectedItems = ref.watch(multiSelecteState);
                  int? seletedItem = ref.watch(singleSelecteState);
                  return GestureDetector(
                    onTap: () => onTap(e.id),
                    child: CustomChip(
                      isChecked: isMultiSelecte
                          ? selectedItems.contains(e.id)
                          : seletedItem == e.id,
                      text: e.i18nKey.tr(),
                    ),
                  );
                },
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
