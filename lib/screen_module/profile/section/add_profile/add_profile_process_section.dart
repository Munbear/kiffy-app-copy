import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/screen_module/profile/provider/add_profile/add_profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/section/add_profile/add_profile_complete_section.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_birthday.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_contact.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_images.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_phone.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_user.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProfileProcessSection extends ConsumerStatefulWidget {
  const AddProfileProcessSection({super.key});

  @override
  ConsumerState<AddProfileProcessSection> createState() =>
      _ProfileInputProcessSectionState();
}

class _ProfileInputProcessSectionState
    extends ConsumerState<AddProfileProcessSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var process = ref.watch(profileInputProcessProvider);

    return Container(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: ref.read(profileInputProcessWidgets)[process],
      ),
    );
  }
}

final profileInputProcessProvider = StateProvider((ref) => 0);
final profileInputProcessWidgets = StateProvider(
  (ref) => [
    AddProfileInputPhone(
      onNext: (phoneNumber) {
        ref.read(profileInputValueProvider.notifier).setPhoneNumber(
            phoneNumber.countryDialCode, phoneNumber.phoneNumber);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    AddProfileInputImages(
      onNext: (medias) {
        ref.read(profileInputValueProvider.notifier).setMedias(medias);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    AddProfileInputUser(
      onNext: (name, gender) {
        ref.read(profileInputValueProvider.notifier).setNickName(name);
        ref.read(profileInputValueProvider.notifier).setGender(gender);

        switch (gender) {
          case Gender.MALE:
            ref.read(profileInputProcessProvider.notifier).state += 1;
            break;
          case Gender.FEMALE:
            ref.read(profileInputProcessProvider.notifier).state += 2;
            break;
        }
      },
    ),
    AddProfileInputContact(
      onNext: (contactType, contactId) {
        ref
            .read(profileInputValueProvider.notifier)
            .setContactType(contactType);
        ref.read(profileInputValueProvider.notifier).setContactId(contactId);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    AddProfileInputBirthday(
      onNext: (birthday) {
        ref.read(profileInputValueProvider.notifier).setBirthday(birthday);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    AddProfileLoading(
      onNext: () => ref.read(profileInputProcessProvider.notifier).state += 1,
    ),
    AddProfileCompleteSection(),
  ],
);
