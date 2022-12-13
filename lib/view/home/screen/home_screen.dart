import 'package:Kiffy/global/model/gender_type.dart';
import 'package:Kiffy/view/home/widget/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../global/model/media_type.dart';

// 변경 : provider 용 statefulWidget 변경
class HomeScreen extends HookConsumerWidget {
  static String get routeName => 'home';

  static String get routeLocation => '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Stack(
              children: [
                PageView(
                  controller: PageController(viewportFraction: 0.9),
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 0,
                              blurRadius: 5.0,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: UserProfileView(
                          userProfile: UserProfile(
                            id: "abc",
                            name: "NaMa",
                            intro: "Hello, world!",
                            gender: Gender.female,
                            birthDate: DateTime.parse("1998-09-06T00:00:00Z"),
                            medias: [
                              UserProfileMedia(
                                id: "abcdefg",
                                type: MediaType.image,
                                url: "http://storage-dev.kiffy.club/public/01GM38YDFF6FGHP7EN04F2HNYM/640x.png",
                              ),
                              UserProfileMedia(
                                id: "abcdefg",
                                type: MediaType.image,
                                url: "https://media-cldnry.s-nbcnews.com/image/upload/newscms/2021_07/2233721/171120-smile-stock-njs-333p.jpg",
                              ),
                              UserProfileMedia(
                                id: "abcdefg",
                                type: MediaType.image,
                                url: "https://img.freepik.com/free-photo/handsome-man-smiling-happy-face-portrait-close-up_53876-145493.jpg?w=2000",
                              ),
                            ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(bottom: 50, right: 20),
                  child: SvgPicture.asset("assets/images/like_icon.svg"),
                )
              ],
            ),
          ),
          Container(
            color: Colors.red,
            child: SizedBox(
              height: 60,
              child: Container(
                color: Colors.purple,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
