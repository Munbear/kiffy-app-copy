import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/edit_profile/provider/modify_profile_input_provider.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/modify_profile_input_header.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/profile_contact_type_select.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModifyProfileInputContact extends ConsumerWidget {
  const ModifyProfileInputContact({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ModifyProfileHeaderTitle(text: tr("text.profile.contact.contact_type")),
        Space(height: 8),
        ModifyProfileInputContactTypeSelect(),
        Space(height: 8),
        ModifyProfileInputContactTextField(),
      ],
    );
  }
}

/// ***********************************
///             연락처 타입 입력
/// **********************************
class ModifyProfileInputContactTypeSelect extends ConsumerWidget {
  const ModifyProfileInputContactTypeSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var contactType = ref.watch(
      modifyProfileInputValueProvider.select((value) => value.contactType),
    );

    return ProfileContactTypeSelect(
      selectedContactType: contactType,
      onTap: (contactType) {
        ref
            .read(modifyProfileInputValueProvider.notifier)
            .setContactType(contactType);
      },
    );
  }
}

/// ***********************************
///             연락처 입력
/// **********************************
class ModifyProfileInputContactTextField extends ConsumerWidget {
  const ModifyProfileInputContactTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ModifyProfileText(text: tr("text.profile.contact.contact_id")),
        Space(height: 4),
        KiffyTextField(
          hintText: "",
          value: ref.read(modifyProfileInputValueProvider).contactId,
          onChanged: (t) => ref
              .read(modifyProfileInputValueProvider.notifier)
              .setContactId(t),
        ),
      ],
    );
  }
}
