import 'dart:convert';
import 'dart:developer';

import 'package:Kiffy/domain/core/model/gender_type.dart';
import 'package:Kiffy/domain/core/model/user_status.dart';
import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_media/user_profile_create_and_edit_command_profile_media.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:Kiffy/model/user_status_view/user_status_view.dart';

Future<UserStatusView> getUserStatus() async {
  final response = await ApiClient().dio.get("/api/view/user/v1/my/status");

  return UserStatusView.fromJson(response.data);
}

// Future<UserProfileView> postUserProfile(
//   String name,
//   Gender gender,
//   String birthDate,
//   String intro,
//   UserProfileCreateAndEditCommandProfileMedia medias,
// ) async {
//   var requests = jsonEncode({
//     "name": name,
//     "gender": gender.name.toString(),
//     "birthDate": birthDate,
//     "intro": intro,
//     "medias": medias,
//   });

// // 여기서 문제
//   final profileUpload = await ApiClient().dio.put("/api/view/user/v1/my/profile", data: requests);
//   return UserProfileView.fromJson(profileUpload.data);
// }

// Future<UserProfileView> getTest() async {
//   final res = await ApiClient().dio.get("/api/view/user/v1/my/profile");

//   log(res.data["medias"].toString());
//   log((res.data["medias"] is String).toString());

//   return UserProfileView.fromJson(res.data);
// }

// enum UserStatus {
//   JOINER,
//   APPROVED,
//   PENDING,
//   REJECTED;

//   static UserStatus fromString(String status) {
//     switch (status) {
//       case "JOINER":
//         return UserStatus.JOINER;
//       case "APPROVED":
//         return UserStatus.APPROVED;
//       case "PENDING":
//         return UserStatus.PENDING;
//       case "REJECTED":
//         return UserStatus.REJECTED;
//       default:
//         return UserStatus.JOINER;
//     }
//   }
// }

// 응답
// class UserProfileUpload {
//   late String id;
//   late String name;
//   late Gender gender;
//   late DateTime birthDate;
//   late String intro;
//   late List<UserStatusView> medias;
//   late UserStatus status;

//   UserProfileUpload({
//     required this.id,
//     required this.status,
//     required this.name,
//     required this.intro,
//     required this.gender,
//     required this.birthDate,
//     required this.medias,
//   });

//   static UserProfileUpload fromJson(Map<String, dynamic> json) {
//     return UserProfileUpload(
//         id: json["id"],
//         status: UserStatus.fromString(json["status"]),
//         name: json["name"],
//         intro: json["intro"],
//         gender: Gender.of(json["gender"]),
//         birthDate: DateTime.parse(json["birthDate"]),
//         medias: (json["medias"] as List).map((i) => UserProfileMediaView(id: "", type: MediaType.image)).toList());
//   }
// }

// media type
// class UserProfileMediaView {
//   final String id;
//   final MediaType type;

//   UserProfileMediaView({
//     required this.id,
//     required this.type,
//   });
// }

// class UserStatusResponse {
//   late String id;
//   late String email;
//   late UserStatus status;

//   UserStatusResponse.fromJson(Map<String, dynamic> json)
//       : id = json["id"],
//         email = json["email"],
//         status = UserStatus.fromString(json["status"]);
// }
