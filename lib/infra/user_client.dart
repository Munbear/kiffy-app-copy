import 'dart:convert';
import 'dart:developer';

import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/infra/api_client.dart';

import '../domain/core/model/Gender.dart';

Future<UserStatusResponse> getUserStatus() async {
  final response = await ApiClient().dio.get("/api/view/user/v1/my/status");
  return UserStatusResponse.fromJson(response.data);
}

Future<UserProfileUpload> postUserProfile(
  String name,
  Gender gender,
  String birthDate,
  String intro,
  List<AddProfileMedia> medias,
) async {
  var requests = jsonEncode({
    "name": name,
    "gender": gender.name.toString(),
    "birthDate": birthDate,
    "intro": intro,
    "medias": medias,
  });

// 여기서 문제
  final profileUpload = await ApiClient().dio.post("/api/view/user/v1/my/profile", data: requests);
  return UserProfileUpload.fromJson(profileUpload.data);
}

Future<UserProfileUpload> getTest() async {
  final res = await ApiClient().dio.get("/api/view/user/v1/my/profile");

  log(res.data["medias"].toString());
  log((res.data["medias"] is String).toString());

  return UserProfileUpload.fromJson(res.data);
}

enum UserStatus {
  JOINER,
  APPROVED,
  PENDING,
  REJECTED;

  static UserStatus fromString(String status) {
    switch (status) {
      case "JOINER":
        return UserStatus.JOINER;
      case "APPROVED":
        return UserStatus.APPROVED;
      case "PENDING":
        return UserStatus.PENDING;
      case "REJECTED":
        return UserStatus.REJECTED;
      default:
        return UserStatus.JOINER;
    }
  }
}

enum MediaType {
  image,
  video;

  static MediaType fromString(String media) {
    switch (media) {
      case "IMAGE":
        return MediaType.image;
      case "VIDEO":
        return MediaType.video;
      default:
        return MediaType.image;
    }
  }
}

// 응답
class UserProfileUpload {
  late String id;
  late String name;
  late Gender gender;
  late DateTime birthDate;
  late String intro;
  late List<UserProfileMediaView> medias;
  late UserStatus status;

  UserProfileUpload({
    required this.id,
    required this.status,
    required this.name,
    required this.intro,
    required this.gender,
    required this.birthDate,
    required this.medias,
  });

  static UserProfileUpload fromJson(Map<String, dynamic> json) {
    return UserProfileUpload(
        id: json["id"],
        status: UserStatus.fromString(json["status"]),
        name: json["name"],
        intro: json["intro"],
        gender: Gender.of(json["gender"]),
        birthDate: DateTime.parse(json["birthDate"]),
        medias: (json["medias"] as List).map((i) => UserProfileMediaView(id: "", type: MediaType.image)).toList());
  }
}

// media type
class UserProfileMediaView {
  final String id;
  final MediaType type;

  UserProfileMediaView({
    required this.id,
    required this.type,
  });
}

class UserStatusResponse {
  late String id;
  late String email;
  late UserStatus status;

  UserStatusResponse.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        status = UserStatus.fromString(json["status"]);
}
