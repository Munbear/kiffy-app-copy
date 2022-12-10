import 'dart:convert';

import 'api_client.dart';

final UserApi = UserClient();

class UserClient extends ApiBaseClient {

  Future<UserStatusResponse> getUserStatus() async {
    final response = await get(Uri.parse("$baseUrl/product/api/view/user/v1/my/status"));
    return UserStatusResponse.fromJson(jsonDecode(response.body));
  }


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