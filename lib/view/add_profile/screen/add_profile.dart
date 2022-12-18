import 'package:flutter/material.dart';
import 'package:Kiffy/view/add_profile/widget/add_photos.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../service/process_guide_text.dart';
import '../widget/add_introduction.dart';
import '../widget/add_user_info.dart';

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
    final process = useState(ProfileEditProcess.name);
    final processContent = useState<ProcessGuideText>(ProcessGuideText.of(process.value));
    final currentPageIndex = useState<int>(0);
    final PageController _pageController = PageController(initialPage: currentPageIndex.value);

    final formKey = GlobalKey<FormState>();

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
          child: PageView(
            physics: const NeverScrollableScrollPhysics(), // 스크롤 막음
            controller: _pageController,
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
      ),
    );
  }
}
