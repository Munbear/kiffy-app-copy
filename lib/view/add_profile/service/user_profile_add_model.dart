import 'package:flutter/material.dart';

class UserProfileAdd {
// final TextEditingController userNameController = TextEditingController();
// final TextEditingController userBirthdayController = TextEditingController();
// final TextEditingController userIntroductionController = TextEditingController();

  String name;
  String birthDate;
  String gender;
  String intro;
  List<Map<String, dynamic>> medias;

  UserProfileAdd({
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.intro,
    required this.medias,
  });

  UserProfileAdd.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        birthDate = json['birthDate'],
        gender = json['gender'],
        intro = json['intro'],
        medias = json['medias'];
}
