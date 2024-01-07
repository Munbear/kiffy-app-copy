import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/screen_module/add_profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/screen_module/common/provider/option_profile_tag_provider.dart';
import 'package:Kiffy/screen_module/add_profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/add_profile/section/add_option_profile_client_section.dart';
import 'package:Kiffy/screen_module/add_profile/section/add_profile_complete_section.dart';
import 'package:Kiffy/screen_module/add_profile/widget/add_option_profile_server_page.dart';
import 'package:Kiffy/screen_module/add_profile/widget/add_profile_input_birthday.dart';
import 'package:Kiffy/screen_module/add_profile/widget/add_profile_input_contact.dart';
import 'package:Kiffy/screen_module/add_profile/widget/add_profile_input_images.dart';
import 'package:Kiffy/screen_module/add_profile/widget/add_profile_input_phone.dart';
import 'package:Kiffy/screen_module/add_profile/widget/add_profile_input_user.dart';
import 'package:Kiffy/screen_module/add_profile/widget/add_profile_loading.dart';
import 'package:Kiffy/screen_module/add_profile/widget/progress_gauge_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 프로필 등록  프로그레스 바
final progressGauge = StateProvider.autoDispose<double>((ref) => 0.0);

class AddBasicProfileSection extends ConsumerStatefulWidget {
  const AddBasicProfileSection({super.key});

  @override
  ConsumerState<AddBasicProfileSection> createState() =>
      _ProfileInputProcessSectionState();
}

class _ProfileInputProcessSectionState
    extends ConsumerState<AddBasicProfileSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(profilePageController);
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 프로그레서 게이지
          const ProgressGaugeBar(),

          /// 페이지들
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                /// 전화 번호 인증 #0
                AddProfileInputPhone(
                  onNext: (phoneNumber) {
                    ref.read(profileInputValueProvider.notifier).setPhoneNumber(
                        phoneNumber.countryDialCode, phoneNumber.phoneNumber);
                    ref.read(profileInputValidatorProvider).nextStep();
                    // nextStep();
                  },
                ),

                /// 이미지 등록 #1
                AddProfileInputImages(
                  onNext: (medias) {
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setMedias(medias);
                    ref.read(profileInputValidatorProvider).nextStep();
                    // nextStep();
                  },
                ),

                /// 기본 정보 입력 #2
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
                        ref.read(profileInputValidatorProvider).nextStep();
                        break;
                      case Gender.FEMALE:
                        ref
                            .read(profileInputValidatorProvider)
                            .nextStep(isFemale: true);
                        break;
                    }
                  },
                ),

                /// sns 정보 입력 #3
                AddProfileInputContact(
                  onNext: (contactType, contactId) {
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setContactType(contactType);
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setContactId(contactId);
                    ref.read(profileInputValidatorProvider).nextStep();
                    // nextStep();
                  },
                ),

                /// 생년 월일 입력 #4
                AddProfileInputBirthday(
                  onNext: (birthday) {
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setBirthday(birthday);
                    ref.read(profileInputValidatorProvider).nextStep();
                    // nextStep();
                  },
                ),

                // 프로필 옵션 정보 입력 페이지  #5
                AddOptionProfileServerPage(
                  onTap: () {
                    ref.read(profileInputValueProvider.notifier).setTags(
                          ref.read(multiSelecteState),
                          ref.read(singleSelecteState),
                        );
                    ref.read(profileInputValidatorProvider).nextStep();
                  },
                ),

                /// 프로필 옵션 정보 입력 2 #6
                AddOptionProfileClientPage(
                  onTap: () {
                    ref.read(profileInputValueProvider.notifier).setMbti(
                          ref.read(selectedMbitState),
                        );
                    ref.read(profileInputValueProvider.notifier).setZodiac(
                          ref.read(selecteZodiac),
                        );
                    ref
                        .read(profileInputValidatorProvider)
                        .nextStep(isLastPage: true);
                  },
                ),

                /// 로딩 화면 및 정보 저장 :: 프로필 옵션 스크린 다음 노출
                AddProfileLoading(
                  onNext: () {
                    //TODO 프로필 정보 선택 화면으로 이동
                    ref.read(profilePageController).nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                ),

                /// 회원 가입 완료 :: 프로필 옵션 스크린 다음 노출
                const AddProfileCompleteSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
