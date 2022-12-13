import 'package:Kiffy/view/add_profile/widget/add_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/add_introduction.dart';
import '../widget/confirm_button.dart';
import '../widget/introduce_text_form.dart';
import '../widget/process_guide_box.dart';
import '../widget/selected_gender.dart';

import '../widget/setting_birth.dart';
import '../widget/setting_nick_name.dart';
import '../widget/add_user_info.dart';

enum ProfileEditProcess {
  name,
  birthday,
  gender;
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
    }
  }
}

class AddProfile extends HookConsumerWidget {
  static String get routeName => 'setting';
  static String get routeLocation => '/setting';

  const AddProfile({super.key});

  void processNextStep(ValueNotifier step) {
    switch (step.value) {
      case ProfileEditProcess.name:
        step.value = ProfileEditProcess.birthday;
        break;
      case ProfileEditProcess.birthday:
        step.value = ProfileEditProcess.gender;
        break;
      case ProfileEditProcess.gender:
        step.value = ProfileEditProcess.gender;
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final process = useState(ProfileEditProcess.name);
    final processContent = useState<ProfileEditProcessContent>(ProfileEditProcessContent.of(process.value));

    useValueChanged(process.value, (_, __) {
      processContent.value = ProfileEditProcessContent.of(process.value);
      return process.value;
    });

    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: [
            // 닉넴임, 생년월일, 성별 선택 화면
            AddUserInfo(process: process, processContent: processContent, showNext: processNextStep),

            // 사진 선택 화면
            AddPhotos(process: process, processContent: processContent, showNext: processNextStep),

            // 자기소개 작성 화면
            AddIntroduction(processContent: processContent)
          ],
        ),
      ),
    );
  }
}
