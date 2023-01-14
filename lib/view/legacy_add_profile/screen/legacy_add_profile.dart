import 'package:Kiffy/view/legacy_add_profile/service/profile_guide_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:Kiffy/view/legacy_add_profile/widget/add_photos.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../service/process_guide_text.dart';
import '../widget/add_intro.dart';
import '../widget/add_user_info.dart';
import '../widget/confirm_button.dart';

enum ProfileEditProcess {
  name,
  birthday,
  gender,
  media,
  intro,
}

class LegacyAddProfile extends HookConsumerWidget {
  static String get routeName => 'me_profile_add';
  static String get routeLocation => '/me/profile/add';

  const LegacyAddProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final process = useState(ProfileEditProcess.name);
    final processContent = useState<ProcessGuideText>(ProcessGuideText.of(process.value));
    // 현제 페이지 번호
    final currentPage = useState<int>(0);

    // 페이지 이동 컨트롤러
    final PageController pageController = PageController(initialPage: currentPage.value);

    useValueChanged(process.value, (_, __) {
      processContent.value = ProcessGuideText.of(process.value);
      return process.value;
    });

    final globalKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(), // 스크롤 막음
                  controller: pageController,
                  onPageChanged: ((index) => currentPage.value = index),
                  children: [
                    // 닉넴임, 생년월일, 성별 선택 화면

                    AddUserInfo(
                      globalKey: globalKey,
                      process: process,
                      processContent: processContent,
                    ),

                    // 사진 선택 화면
                    AddPhotos(
                      process: process,
                      processContent: processContent,
                    ),

                    // 자기소개 작성 화면
                    AddIntro(processContent: processContent)
                  ],
                ),
              ),
              // 버튼
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: InkWell(
                  onTap: () {
                    print(globalKey.currentState!.validate());

                    // ref.read(profileProvider.notifier).processNextStep(process, currentPage, pageController);
                  },
                  child: const ConfirmButton(text: "Berikutnya"),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
