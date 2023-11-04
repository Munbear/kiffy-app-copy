import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInputBirthday extends ConsumerWidget {
  final DateTime? birthday;
  final ValueChanged<DateTime> onChanged;

  const ProfileInputBirthday({
    super.key,
    required this.birthday,
    required this.onChanged,
  });

  Widget birthdayTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(tr("text.profile.birthday"), style: TextStyle(fontSize: 20)),
          Space(
            width: 4,
          ),
          Text("Example : ${DateFormat("yyyyMMdd").format(DateTime.now())}",
              style: TextStyle(fontSize: 12, color: Color(0xff6c6c6c))),
        ],
      ),
    );
  }

  Widget validationText(WidgetRef ref) {
    return Align(
      alignment: Alignment.topLeft,
      child: ProfileInputValidationText(
        normalText: tr("text.profile.input_profile.immutable"),
        violatedText: tr("text.profile.birthday.rule"),
        check: () =>
            ref.read(profileInputValidatorProvider).verifyBirthday(birthday),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        birthdayTitle(),
        Space(height: 8),
        KiffyTextField(
            hintText: "YYYYMMDD",
            onChanged: (v) {
              try {
                var birthDateTime = DateTime.tryParse(v);
                if (v.length == 8 && birthDateTime != null) {
                  onChanged(birthDateTime);
                }
              } catch (_) {
                // ignore
              }
            }),
        Space(height: 2),
        validationText(ref),
      ],
    );
  }
}
