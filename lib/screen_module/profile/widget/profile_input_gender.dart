import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/screen_module/common/input/widget/kiffy_input_button.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInputGender extends ConsumerWidget {
  final Gender? gender;
  final ValueChanged<Gender> onChanged;

  const ProfileInputGender({
    super.key,
    required this.gender,
    required this.onChanged,
  });

  Widget genderTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(tr("text.profile.gender"), style: TextStyle(fontSize: 20)),
    );
  }

  Widget validationText(WidgetRef ref) {
    return Align(
      alignment: Alignment.topLeft,
      child: ProfileInputValidationText(
        normalText: tr("text.profile.input_profile.immutable"),
        violatedText: tr("text.profile.gender.rule"),
        check: () =>
            ref.read(profileInputValidatorProvider).verifyGender(gender),
      ),
    );
  }

  String iconAsset(Gender gender) {
    switch (gender) {
      case Gender.MALE:
        return "assets/icons/man_icon.png";
      default:
        return "assets/icons/woman_icon.png";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        genderTitle(),
        Space(height: 8),
        Row(
          children: [
            Expanded(
                child: KiffyInputButton(
              isSelected: gender == Gender.MALE,
              iconAsset: iconAsset(Gender.MALE),
              text: Gender.genderToString(Gender.MALE),
              onPressed: () => onChanged(Gender.MALE),
            )),
            Space(width: 10),
            Expanded(
                child: KiffyInputButton(
              isSelected: gender == Gender.FEMALE,
              iconAsset: iconAsset(Gender.FEMALE),
              text: Gender.genderToString(Gender.FEMALE),
              onPressed: () => onChanged(Gender.FEMALE),
            )),
          ],
        ),
        Space(height: 2),
        validationText(ref),
      ],
    );
  }
}
