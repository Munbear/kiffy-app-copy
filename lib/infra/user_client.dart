import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/user_status_view/user_status_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Future<UserStatusView> getUserStatus() async {
//   var ref;
//   Dio dio = ref.read(dioProvider);
//   final response = await dio.get("/api/view/user/v1/my/status");

//   return UserStatusView.fromJson(response.data);
// }

// Future<UserProfileView> getMyProfile() async {
//   final res = await ApiClient().dio.get("/api/view/user/v1/my/profile");

// }

final userStatusResponse =
    Provider<UserStatusResponse>((ref) => UserStatusResponse(ref));

class UserStatusResponse {
  Ref ref;
  Dio dio;

  UserStatusResponse(this.ref) : dio = ref.read(dioProvider);

  cgetUserStatus() async {
    final response = await dio.get("/api/view/user/v1/my/status");

    ref
        .read(userStatusView.notifier)
        .update((state) => state = UserStatusView.fromJson(response.data));
  }
}

final userStatusView = StateProvider<UserStatusView?>((ref) => null);
