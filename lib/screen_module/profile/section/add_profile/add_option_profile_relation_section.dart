import 'package:Kiffy/common/custom_chip.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/option_tag/option_profile_tag_provider.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOptionProfileRelationSection extends ConsumerStatefulWidget {
  const AddOptionProfileRelationSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OptionProfileRelationSectionState();
}

class _OptionProfileRelationSectionState
    extends ConsumerState<AddOptionProfileRelationSection> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(optionProfileTagProvider);
    if (items.value != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "What kind of relationship are you looking for?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Space(height: 10),
          Wrap(
            direction: Axis.vertical,
            children: items.value![1].tags!.map(
              (e) {
                return CustomChip(text: e.i18nKey.tr());
              },
            ).toList(),
          ),
          const Space(height: 16),
          const Divider(),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
