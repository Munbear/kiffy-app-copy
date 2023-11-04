import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/common/style/widget/border._style.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInputContactType extends ConsumerWidget {
  final ContactType? contactType;
  final ValueChanged<ContactType> onChanged;

  const ProfileInputContactType(
      {super.key, required this.onChanged, required this.contactType});

  Widget contactTypeTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        tr("text.profile.contact.contact_type"),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget validationText(WidgetRef ref) {
    return Align(
      alignment: Alignment.topLeft,
      child: ProfileInputValidationText(
        normalText: "",
        violatedText: tr("text.profile.contact.contact_type.validation"),
        check: () => ref
            .read(profileInputValidatorProvider)
            .verifyContactType(contactType),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        contactTypeTitle(),
        Space(height: 8),
        snsButtons(),
        Space(height: 6),
        validationText(ref),
      ],
    );
  }

  Widget snsButtons() {
    return Row(
      children: ContactType.values.map((ct) {
        return GestureDetector(
          onTap: () {
            onChanged(ct);
          },
          child: Container(
            height: 55,
            width: 55,
            margin: const EdgeInsets.only(right: 10),
            decoration: ct == contactType
                ? BorderGradientCircleShape.outlineGradientBoxDecoration
                : null,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BorderGradientCircleShape.innerDecoration,
              child: Stack(
                children: [
                  // icon Image
                  ContactType.contactAppIcon(ct),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: contactType == ct
                          ? null
                          : Colors.white.withOpacity(0.7),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
