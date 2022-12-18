import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../global/model/gender_type.dart';
import '../../home/widget/user_profile.dart';

final testProfileProvider = StateNotifierProvider<TestUserProfile, String>((ref) {
  return TestUserProfile(ref);
});

class TestUserProfile extends StateNotifier<String> {
  TestUserProfile(this.ref) : super("");

  final Ref ref;
  late String id;
  late String name;
  late String intro;
  late Gender gender;
  late DateTime birthDate;
  late List<UserProfileMedia> medias;
}
