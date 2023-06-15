import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 유저 프로필 정보
final userInfoProvider = Provider<MyProfileHandler>((ref) => MyProfileHandler(ref));

// 내 프로필 핸들러
class MyProfileHandler {
  final Ref ref;
  Dio dio;

  MyProfileHandler(this.ref) : dio = ApiClient().dio;

  // 수정 필요
  getMyProfile() async {
    final res = await dio.get("/api/view/user/v1/my/profile");

    return ref.read(myProfileInfo.notifier).update((state) => state = UserProfileView.fromJson(res.data));
  }
}

final myProfileInfo = StateProvider<UserProfileView?>((ref) => null);

// ::수정 필요
// 내 프로필 불러오기
final myProfileProvider = FutureProvider((ref) async {
  final res = await ApiClient().dio.get("/api/view/user/v1/my/profile");

  return UserProfileView.fromJson(res.data);
});
