import 'package:Kiffy/view/add_profile/screen/add_profile.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileProvider = StateNotifierProvider<GetProfile, String>((ref) {
  return GetProfile(ref);
});

class GetProfile extends StateNotifier<String> {
  GetProfile(this.ref) : super("");

  final Ref ref;

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
}
