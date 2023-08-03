import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/user_status_view/user_status_view.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Future<UserStatusView> getUserStatus() async {
//   final response = await ApiClient().dio.get("/api/view/user/v1/my/status");

//   return UserStatusView.fromJson(response.data);
// }

// Future<UserProfileView> getMyProfile() async {
//   final res = await ApiClient().dio.get("/api/view/user/v1/my/profile");

// }

final userStatusResponse = Provider<UserStatusResponse>((ref) => UserStatusResponse(ref));

class UserStatusResponse {
  Ref ref;
  Dio dio;

  UserStatusResponse(this.ref) : dio = ref.read(dioProvider);

  Future<UserStatusView> getUserStatus() async {
    final response = await dio.get("/api/view/user/v1/my/status");

    return UserStatusView.fromJson(response.data);
  }
}
