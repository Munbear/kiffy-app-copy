// import 'package:Kiffy/global/model/gender_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../global/model/gender_type.dart';

class AddProfileInputGenderProps {
  ValueChanged<Gender> onChanged;

  AddProfileInputGenderProps({
    required this.onChanged,
  });
}

class AddProfileInputGender extends HookConsumerWidget {
  AddProfileInputGenderProps props;

  AddProfileInputGender({
    super.key,
    required this.props,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedGender = useState(Gender.female);

    return Container(
      child: Row(
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  selectedGender.value = Gender.female;
                  this.props.onChanged(Gender.female);
                },
                child: Container(
                  width: 140,
                  height: 44,
                  decoration: BoxDecoration(
                    color: selectedGender.value == Gender.female ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: selectedGender == Gender.female ? const Color(0xff0031AA) : const Color(0xffbdbdbd), width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.female),
                      const SizedBox(width: 6),
                      Text(
                        "여성",
                        style: TextStyle(
                          fontSize: 18,
                          color: selectedGender == Gender.female ? const Color(0xff0031AA) : const Color(0xffBDBDBD),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  selectedGender.value = Gender.male;
                  this.props.onChanged(Gender.male);
                },
                child: Container(
                  width: 140,
                  height: 44,
                  decoration: BoxDecoration(
                    color: selectedGender.value == Gender.male ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: selectedGender == Gender.male ? const Color(0xff0031AA) : const Color(0xffbdbdbd), width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.female),
                      const SizedBox(width: 6),
                      Text(
                        "남성",
                        style: TextStyle(
                          fontSize: 18,
                          color: selectedGender == Gender.male ? const Color(0xff0031AA) : const Color(0xffBDBDBD),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
