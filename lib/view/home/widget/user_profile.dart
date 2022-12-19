import 'package:Kiffy/global/model/gender_type.dart';
import 'package:Kiffy/global/model/media_type.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 유저 프로필 사진
class UserProfileMedia {
  String id;
  MediaType type;
  String url;

  UserProfileMedia({
    required this.id,
    required this.type,
    required this.url,
  });
}

// 유저 정보
class UserProfile {
  String id;
  String name;
  String intro;
  Gender gender;
  DateTime birthDate;
  List<UserProfileMedia> medias;

  UserProfile({
    required this.id,
    required this.name,
    required this.intro,
    required this.gender,
    required this.birthDate,
    required this.medias,
  });
}

class UserProfileView extends HookConsumerWidget {
  const UserProfileView({super.key, required this.userProfile});

  final UserProfile userProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      children: [
        [
          Container(
            child: SizedBox.expand(
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Image.network(
                      userProfile.medias[0].url,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "${userProfile.name} - ${(DateTime.now().difference(userProfile.birthDate).inDays / 365).floor()}",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        userProfile.medias.getRange(1, userProfile.medias.length).map(
              (media) => Container(
                child: SizedBox.expand(
                  child: Stack(
                    children: [
                      SizedBox.expand(
                        child: Image.network(
                          media.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "${userProfile.name} - ${(DateTime.now().difference(userProfile.birthDate).inDays / 365).floor()}",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
        [
          Container(
            child: Column(
              children: [
                Text("${userProfile.gender}"),
                Text("${userProfile.intro}"),
              ],
            ),
          )
        ]
      ].expand((element) => element).toList(),
    );
  }
}
