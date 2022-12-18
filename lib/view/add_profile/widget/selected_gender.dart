import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../global/model/gender_type.dart';
import 'gender_button.dart';

class SelectedGender extends HookConsumerWidget {
  final bool isShowed;

  SelectedGender({super.key, required this.isShowed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentValue = useState<String>("");

    return AnimatedOpacity(
      opacity: isShowed ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Offstage(
        offstage: !isShowed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 25),
          height: isShowed ? 50 : 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: Gender.values.map(
              (item) {
                return InkWell(
                  onTap: () {
                    currentValue.value = item.gender;
                  },
                  child: GenderButton(
                    value: item.gender,
                    isChecked: item.gender == currentValue.value,
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
