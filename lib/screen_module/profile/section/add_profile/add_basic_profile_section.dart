import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/screen/profile/add_option_profile_screen.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/add_profile/add_profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_birthday.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_contact.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_images.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_phone.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_user.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

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
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 프로그레서 게이지
          Consumer(
            builder: (context, ref, widget) {
              final persent = ref.watch(progressGauge);
              return LinearPercentIndicator(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                animation: true,
                animationDuration: 300,
                lineHeight: 12.0,
                percent: persent,
                barRadius: const Radius.circular(20),
                backgroundColor: Colors.grey[200],
                linearGradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffBA00FF),
                    Color(0xff0031AA),
                  ],
                ),
              );
            },
          ),
          const Space(height: 16),

          /// 페이지
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                /// 전화 번호 인증
                AddProfileInputPhone(
                  onNext: (phoneNumber) {
                    ref.read(profileInputValueProvider.notifier).setPhoneNumber(
                        phoneNumber.countryDialCode, phoneNumber.phoneNumber);
                    nextStep();
                  },
                ),

                /// 이미지 등록
                AddProfileInputImages(
                  onNext: (medias) {
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setMedias(medias);
                    nextStep();
                  },
                ),

                /// 기본 정보 입력
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

                /// sns 정보 입력
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

                /// 생년 월일 입력
                AddProfileInputBirthday(
                  onNext: (birthday) {
                    ref
                        .read(profileInputValueProvider.notifier)
                        .setBirthday(birthday);
                    context.pushNamed(AddOptionProfileScreen.routeName);
                  },
                ),

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
