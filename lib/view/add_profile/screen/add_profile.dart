import 'package:Kiffy/view/add_profile/service/profile_guide_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:Kiffy/view/add_profile/widget/add_photos.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../service/process_guide_text.dart';
import '../widget/add_introduction.dart';
import '../widget/add_user_info.dart';
import '../widget/confirm_button.dart';

enum ProfileEditProcess {
  name,
  birthday,
  gender,
  media,
  intro,
}

class AddProfile extends HookConsumerWidget {
  static String get routeName => 'setting';
  static String get routeLocation => '/setting';

  const AddProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final process = useState(ProfileEditProcess.name);
    final processContent = useState<ProcessGuideText>(ProcessGuideText.of(process.value));
    // 현제 페이지 번호
    final currentPage = useState<int>(0);

    // 페이지 이동 컨트롤러
    final PageController pageController = PageController(initialPage: currentPage.value);

    // 다음 페이지로 이동
    void moveNextStep(ValueNotifier index) {
      if (index.value == 0) pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      if (index.value == 1) pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }

    useValueChanged(process.value, (_, __) {
      processContent.value = ProcessGuideText.of(process.value);
      return process.value;
    });

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          // 텍스트 값 관리
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      process: process,
                      processContent: processContent,
                      saveValue: formKey,
                    ),

                    // 사진 선택 화면
                    AddPhotos(
                      process: process,
                      processContent: processContent,
                      saveValue: formKey,
                    ),

                    // 자기소개 작성 화면
                    AddIntroduction(processContent: processContent, saveValue: formKey)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: InkWell(
                  onTap: () {
                    ref.read(profileProvider.notifier).processNextStep(process);
                    moveNextStep(currentPage);
                  },
                  child: const ConfirmButton(text: "확인"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
