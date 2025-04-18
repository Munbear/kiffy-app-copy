import 'package:Kiffy/common/widget/custom_chip.dart';
import 'package:Kiffy/screen_module/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/common/provider/option_profile_tag_provider.dart';
import 'package:Kiffy/screen_module/add_profile/provider/profile_input_validator_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class OptionProfileSeverForm extends ConsumerStatefulWidget {
  final ValueChanged<int> onTap;
  final String title;
  final ProfileTagViewTagTypesInner items;
  final bool hasDivider;
  final bool isMultiSelecte;
  final List<int>? initOptionProfileValue;
  final int? initPersonalityValue;

  const OptionProfileSeverForm({
    super.key,
    required this.onTap,
    required this.title,
    required this.items,
    required this.hasDivider,
    required this.isMultiSelecte,
    this.initOptionProfileValue,
    this.initPersonalityValue,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OptionProfileSeverFormState();
}

class _OptionProfileSeverFormState
    extends ConsumerState<OptionProfileSeverForm> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(multiSelecteState.notifier).update(
            (state) => state = widget.initOptionProfileValue ?? [],
          );
      if (widget.initPersonalityValue != null) {
        ref
            .read(singleSelecteState.notifier)
            .update((state) => state = widget.initPersonalityValue);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Space(height: 10),
        Wrap(
          direction: Axis.vertical,
          children: widget.items.tags != null
              ? widget.items.tags!.map(
                  (e) {
                    return Consumer(
                      builder: (context, ref, child) {
                        List<int> selectedItems = ref.watch(multiSelecteState);
                        int? seletedItem = ref.watch(singleSelecteState);
                        return GestureDetector(
                          onTap: () => widget.onTap(e.id),
                          child: CustomChip(
                            isChecked: widget.isMultiSelecte
                                ? selectedItems.contains(e.id)
                                : seletedItem == e.id,
                            text: e.i18nKey.tr(),
                          ),
                        );
                      },
                    );
                  },
                ).toList()
              : [],
        ),
        if (widget.hasDivider)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: const Divider(),
          ),
      ],
    );
  }
}
