import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/add_profile/add_profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/section/add_profile/add_option_profile_client_section.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_option_profile_server_page.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_birthday.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_contact.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_images.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_phone.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_user.dart';
import 'package:Kiffy/screen_module/profile/widget/progress_gauge_bar.dart';
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
  final PageController _pageController = PageController(initialPage: 6);

  @override
  void initState() {
    super.initState();
  }

  // 다음 페이지
  void nextStep() {
    _pageController
        .nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    )
        .then(
      (value) {
        ref.read(progressGauge.notifier).update((state) => state + 0.16);
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 프로그레서 게이지
          const ProgressGaugeBar(),
          // if (_pageController.page == 5.0 || _pageController.page == 6)
          GestureDetector(
            onTap: () {
              print("다음 옵션 화면으로 이동");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(top: 4),
              alignment: Alignment.topRight,
              child: const Text("Skipping"),
            ),
          ),

          const Space(height: 16),

          /// 페이지
          Expanded(
            child: PageView(
              controller: _pageController,
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                /// 전화 번호 인증 #0
                AddProfileInputPhone(
                  onNext: (phoneNumber) {
                    ref.read(profileInputValueProvider.notifier).setPhoneNumber(
                        phoneNumber.countryDialCode, phoneNumber.phoneNumber);
                    nextStep();
                  },
                ),

                /// 이미지 등록 #1
                AddProfileInputImages(
                  onNext: (medias) {
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setMedias(medias);
                    nextStep();
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
                        nextStep();
                        break;
                      case Gender.FEMALE:
                        _pageController.animateToPage(4,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
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
                    nextStep();
                  },
                ),

                /// 생년 월일 입력 #4
                AddProfileInputBirthday(
                  onNext: (birthday) {
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setBirthday(birthday);
                    nextStep();
                  },
                ),

                // 프로필 옵션 정보 입력 페이지  #5
                const AddOptionProfileServerPage(),

                /// 프로필 옵션 정보 입력 2 #6
                const AddOptionProfileClientSection()

                /// 로딩 화면 및 정보 저장 :: 프로필 옵션 스크린 다음 노출
                // AddProfileLoading(
                //   onNext: () {
                //     //TODO 프로필 정보 선택 화면으로 이동
                //     context.pushNamed(AddOptionProfileScreen.routeName);
                //   },
                // ),

                /// 회원 가입 완료 :: 프로필 옵션 스크린 다음 노출
                /// AddProfileCompleteSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
