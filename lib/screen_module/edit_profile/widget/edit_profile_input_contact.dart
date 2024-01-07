import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/edit_profile/provider/edit_profile_provider.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/edit_profile_input_header.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/profile_contact_type_select.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileInputContact extends ConsumerWidget {
  const EditProfileInputContact({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditProfileHeaderTitle(text: tr("text.profile.contact.contact_type")),
        Space(height: 8),
        EditProfileInputContactTypeSelect(),
        Space(height: 8),
        EditProfileInputContactTextField(),
      ],
    );
  }
}

/// ***********************************
///             연락처 타입 입력
/// **********************************
class EditProfileInputContactTypeSelect extends ConsumerWidget {
  const EditProfileInputContactTypeSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var contactType = ref.watch(
      editProfileProvider.select((value) => value.contactType),
    );

    return ProfileContactTypeSelect(
      selectedContactType: contactType,
      onTap: (contactType) {
        ref.read(editProfileProvider.notifier).setContactType(contactType);
      },
    );
  }
}

/// ***********************************
///             연락처 입력
/// **********************************
class EditProfileInputContactTextField extends ConsumerWidget {
  const EditProfileInputContactTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditProfileText(text: tr("text.profile.contact.contact_id")),
        Space(height: 4),
        KiffyTextField(
          hintText: "",
          value: ref.read(editProfileProvider).contactId,
          onChanged: (t) =>
              ref.read(editProfileProvider.notifier).setContactId(t),
        ),
      ],
    );
  }
}
