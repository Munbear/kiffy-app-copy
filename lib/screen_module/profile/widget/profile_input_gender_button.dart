import 'package:Kiffy/domain/core/enum/gender_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInputGenderButton extends StatelessWidget {
  final Gender? selectedGender;
  final ValueChanged<Gender> onChanged;

  const ProfileInputGenderButton({super.key, this.selectedGender, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Gender.values.map(
        (gender) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              // 성별 선택
              child: ElevatedButton.icon(
                onPressed: () => onChanged(gender),
                label: Text(
                  Gender.genderToString(gender),
                  style: TextStyle(
                    color: selectedGender == gender ? const Color(0xFF0031AA) : const Color(0xff494949),
                  ),
                ),
                icon: Image.asset(
                  gender == Gender.MALE ? "assets/icons/man_icon.png" : "assets/icons/woman_icon.png",
                  width: 18,
                  color: selectedGender == gender ? const Color(0xFF0031AA) : const Color(0xff494949),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  shadowColor: const Color(0x00000000),
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xff494949),
                  textStyle: const TextStyle(fontSize: 18),
                  side: BorderSide(
                    color: selectedGender == gender ? const Color(0xFF0031AA) : const Color(0xffDCDCDC),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}