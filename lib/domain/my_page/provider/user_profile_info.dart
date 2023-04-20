import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 유저 프로필 정보
final myProfileProvider = Provider<MyProfileHandler>((ref) => MyProfileHandler(ref));

class MyProfileHandler {
  final Ref ref;
  Dio dio;

  MyProfileHandler(this.ref) : dio = ApiClient().dio;

  Future<UserProfileView> getMyProfile() async {
    final res = await dio.get("/api/view/user/v1/my/profile");

    return UserProfileView.fromJson(res.data);
  }
}
