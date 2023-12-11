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

    // return Container(
    //   padding: const EdgeInsets.all(30),
    //   child: ref.read(profileInputProcessWidgets)[process],
    // );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView(
              children: [
                AddProfileInputPhone(
                  onNext: (phoneNumber) {
                    ref.read(profileInputValueProvider.notifier).setPhoneNumber(
                        phoneNumber.countryDialCode, phoneNumber.phoneNumber);
                    ref.read(profileInputProcessProvider.notifier).state += 1;
                  },
                ),
                // 이미지 등록
                AddProfileInputImages(
                  onNext: (medias) {
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setMedias(medias);
                    ref.read(profileInputProcessProvider.notifier).state += 1;
                  },
                ),
                // 기본 정보 입력
                AddProfileInputUser(
                  onNext: (name, gender) {
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setNickName(name);
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setGender(gender);

                    switch (gender) {
                      case Gender.MALE:
                        ref.read(profileInputProcessProvider.notifier).state +=
                            1;
                        break;
                      case Gender.FEMALE:
                        ref.read(profileInputProcessProvider.notifier).state +=
                            2;
                        break;
                    }
                  },
                ),
                // sns 정보 입력
                AddProfileInputContact(
                  onNext: (contactType, contactId) {
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setContactType(contactType);
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setContactId(contactId);
                    ref.read(profileInputProcessProvider.notifier).state += 1;
                  },
                ),
                // 생년 월일 입력
                AddProfileInputBirthday(
                  onNext: (birthday) {
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setBirthday(birthday);
                    ref.read(profileInputProcessProvider.notifier).state += 1;
                  },
                ),
                // 로딩 화면
                AddProfileLoading(
                  onNext: () =>
                      ref.read(profileInputProcessProvider.notifier).state += 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final profileInputProcessProvider = StateProvider((ref) => 0);
final profileInputProcessWidgets = StateProvider(
  (ref) => [
    // 핸드폰 인증
    AddProfileInputPhone(
      onNext: (phoneNumber) {
        ref.read(profileInputValueProvider.notifier).setPhoneNumber(
            phoneNumber.countryDialCode, phoneNumber.phoneNumber);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    // 이미지 등록
    AddProfileInputImages(
      onNext: (medias) {
        ref.read(profileInputValueProvider.notifier).setMedias(medias);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    // 기본 정보 입력
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
    // sns 정보 입력
    AddProfileInputContact(
      onNext: (contactType, contactId) {
        ref
            .read(profileInputValueProvider.notifier)
            .setContactType(contactType);
        ref.read(profileInputValueProvider.notifier).setContactId(contactId);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    // 생년 월일 입력
    AddProfileInputBirthday(
      onNext: (birthday) {
        ref.read(profileInputValueProvider.notifier).setBirthday(birthday);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    // 로딩 화면
    AddProfileLoading(
      onNext: () => ref.read(profileInputProcessProvider.notifier).state += 1,
    ),
    // 회원 가입 완료
    AddProfileCompleteSection(),
  ],
);
