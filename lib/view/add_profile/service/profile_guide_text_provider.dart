import 'package:Kiffy/view/add_profile/screen/add_profile.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileProvider = StateNotifierProvider<ProfileGuideText, String>((ref) {
  return ProfileGuideText(ref);
});

class ProfileGuideText extends StateNotifier<String> {
  ProfileGuideText(this.ref) : super("");

  final Ref ref;

  final globalKey = GlobalKey<FormState>;

  // 가이드 텍스트 변경 함수
  void processNextStep(ValueNotifier step, ValueNotifier index, pageController) {
    switch (step.value) {
      case ProfileEditProcess.name:
        step.value = ProfileEditProcess.birthday;
        break;
      case ProfileEditProcess.birthday:
        step.value = ProfileEditProcess.gender;
        break;
      case ProfileEditProcess.gender:
        pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        step.value = ProfileEditProcess.media;
        break;
      case ProfileEditProcess.media:
        pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        break;
    }
  }

  //
}
