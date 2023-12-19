import 'package:Kiffy/common/custom_chip.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/option_tag/option_profile_tag_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class AddOptionProfileLanguageSection extends ConsumerStatefulWidget {
  final ProfileTagViewTagTypesInner items;

  const AddOptionProfileLanguageSection({
    super.key,
    required this.items,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OptionProfileLanguageSectionState();
}

class _OptionProfileLanguageSectionState
    extends ConsumerState<AddOptionProfileLanguageSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "What language do you speak?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Space(height: 10),
        Wrap(
          direction: Axis.vertical,
          children: widget.items.tags!.map(
            (e) {
              return CustomChip(
                text: e.i18nKey.tr(),
              );
            },
          ).toList(),
        ),
        const Space(height: 16),
        const Divider(),
      ],
    );
  }
}
