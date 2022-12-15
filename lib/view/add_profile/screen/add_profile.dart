import 'package:Kiffy/view/add_profile/service/process_step.dart';
import 'package:Kiffy/view/add_profile/widget/add_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/add_introduction.dart';
import '../widget/add_user_info.dart';

enum ProfileEditProcess {
  name,
  birthday,
  gender,
  media,
  intro,
}

class ProfileEditProcessContent {
  late String title;
  late String guideText;

  ProfileEditProcessContent({required this.title, required this.guideText});

  factory ProfileEditProcessContent.of(ProfileEditProcess process) {
    switch (process) {
      case ProfileEditProcess.name:
        return ProfileEditProcessContent(title: "name", guideText: "이름을 입력해주세요");
      case ProfileEditProcess.gender:
        return ProfileEditProcessContent(title: "gender", guideText: "성별을 입력해주세요");
      case ProfileEditProcess.birthday:
        return ProfileEditProcessContent(title: "birthday", guideText: "생일을 입력해주세요");
      case ProfileEditProcess.media:
        return ProfileEditProcessContent(title: "Photos", guideText: "사진을 선택해주세요");
      case ProfileEditProcess.intro:
        return ProfileEditProcessContent(title: "Introduction", guideText: "자기소개서를 작성해 주세요");
    }
  }
}

class AddProfile extends HookConsumerWidget {
  static String get routeName => 'setting';
  static String get routeLocation => '/setting';

  const AddProfile({super.key});

  // processNextStep => processShowGuideText
  void processNextStep(ValueNotifier step) {
    switch (step.value) {
      case ProfileEditProcess.name:
        step.value = ProfileEditProcess.birthday;
        break;
      case ProfileEditProcess.birthday:
        step.value = ProfileEditProcess.gender;
        break;
      case ProfileEditProcess.gender:
        step.value = ProfileEditProcess.media;
        break;
      case ProfileEditProcess.media:
        step.value = ProfileEditProcess.intro;
        break;
    }
  }

  void moveNextStep() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final process = useState(ProfileEditProcess.name);
    final processContent = useState<ProfileEditProcessContent>(ProfileEditProcessContent.of(process.value));
    final currentPageIndex = useState<int>(0);
    final PageController _pageController = PageController(initialPage: 0);

    final formKey = GlobalKey<FormState>();

    useValueChanged(process.value, (_, __) {
      processContent.value = ProfileEditProcessContent.of(process.value);
      return process.value;
    });

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(), // 스크롤 막음
            controller: _pageController,
            onPageChanged: ((pageIndex) => moveNextStep()),
            children: [
              // 닉넴임, 생년월일, 성별 선택 화면
              AddUserInfo(
                process: process,
                processContent: processContent,
                saveValue: formKey,
                showNext: processNextStep,
              ),

              // 사진 선택 화면
              AddPhotos(
                process: process,
                processContent: processContent,
                saveValue: formKey,
                showNext: processNextStep,
              ),

              // 자기소개 작성 화면
              AddIntroduction(processContent: processContent, saveValue: formKey)
            ],
          ),
        ),
      ),
    );
  }
}
