import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInputContactId extends ConsumerWidget {
  final String? contactId;
  final Gender? gender;
  final ValueChanged<String> onChanged;

  const ProfileInputContactId({
    super.key,
    this.gender,
    required this.contactId,
    required this.onChanged,
  });

  Widget contactIdTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        tr("text.profile.contact.contact_id"),
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget validationText(WidgetRef ref) {
    return Align(
      alignment: Alignment.topLeft,
      child: ProfileInputValidationText(
        normalText: gender == Gender.MALE
            ? tr("text.profile.input_profile.contact")
            : tr("text.profile.input_profile.contact.female"),
        violatedText: tr("text.profile.contact.contact_id.validation"),
        check: () =>
            ref.read(profileInputValidatorProvider).verifyContactId(contactId),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        contactIdTitle(),
        Space(height: 8),
        KiffyTextField(
          hintText: "",
          onChanged: (v) => onChanged(v),
          value: contactId,
        ),
        Space(height: 2),
        validationText(ref),
      ],
    );
  }
}
