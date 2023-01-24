

import 'package:Kiffy/infra/api_client.dart';

Future<UserStatusResponse> getUserStatus() async {
  final response = await ApiClient().dio.get("/product/api/view/user/v1/my/status");
  return UserStatusResponse.fromJson(response.data);
}

enum UserStatus {
  JOINER,
  APPROVED;

  static UserStatus fromString(String status) {
    switch (status) {
      case "JOINER":
        return UserStatus.JOINER;
      case "APPROVED":
        return UserStatus.APPROVED;
      default:
        return UserStatus.JOINER;
    }
  }
}


class UserStatusResponse {
  late String id;
  late UserStatus status;

  UserStatusResponse.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        status = UserStatus.fromString(json["status"]);
}