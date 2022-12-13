import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/model/gender_type.dart';
import 'gender_button.dart';

class SelectedGender extends ConsumerStatefulWidget {
  final bool isShowed;

  SelectedGender({super.key, required this.isShowed});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectedGenderState();
}

class _SelectedGenderState extends ConsumerState<SelectedGender> {
  bool isChecked = false;
  String? currentValue;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isShowed ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Offstage(
        offstage: !widget.isShowed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 25),
          height: widget.isShowed ? 50 : 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Gender.values.map(
              (item) {
                return InkWell(
                  onTap: () => setState(() {
                    currentValue = item.gender;
                  }),
                  child: GenderButton(
                    value: item.gender,
                    isChecked: item.gender == currentValue,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
