import 'package:Kiffy/view/add_profile/screen/add_profile.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileProvider = StateNotifierProvider<ProfileGuideText, String>((ref) {
  return ProfileGuideText(ref);
});

class ProfileGuideText extends StateNotifier<String> {
  ProfileGuideText(this.ref) : super("");

  final Ref ref;

  // 가이드 텍스트 변경 함수
  void processNextStep(ValueNotifier step) {
    switch (step.value) {
      case ProfileEditProcess.name:
        step.value = ProfileEditProcess.birthday;
        break;
      case ProfileEditProcess.birthday:
        step.value = ProfileEditProcess.gender;
        break;
    }
  }

  // 텍스트 상태 관리

  // 다음 페이지 이동 함수
  // 텍스트 상태 저장 함수

  //
}
