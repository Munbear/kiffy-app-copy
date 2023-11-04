import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInputNickname extends ConsumerWidget {
  final String nickname;
  final ValueChanged<String> onChanged;

  const ProfileInputNickname({
    super.key,
    required this.nickname,
    required this.onChanged,
  });

  Widget nicknameTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(tr("text.profile.nickname"), style: TextStyle(fontSize: 20)),
    );
  }

  Widget validationText(WidgetRef ref) {
    return Align(
      alignment: Alignment.topLeft,
      child: ProfileInputValidationText(
        normalText: tr("text.profile.input_profile.immutable"),
        violatedText: tr("text.profile.nickname.rule"),
        check: () =>
            ref.read(profileInputValidatorProvider).verifyNickname(nickname),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          nicknameTitle(),
          Space(height: 8),
          KiffyTextField(
            hintText: tr("text.profile.input_profile.nickname.placeholder"),
            onChanged: (nickname) => onChanged(nickname),
          ),
          Space(height: 2),
          validationText(ref),
        ],
      ),
    );
  }
}
