import 'package:Kiffy/domain/common/custom_app_bar_image_title.dart';
import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../matching/page/matching_page.dart';

class UnMatchUserProfile extends ConsumerStatefulWidget {
  static String get routeLocation => "/unmatchUserProfile";
  static String get routeName => "unmatchUserProfile";

  const UnMatchUserProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UnMatchUserProfileState();
}

class _UnMatchUserProfileState extends ConsumerState<UnMatchUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const CustomAppBarImageTitle(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // 프로필 이미지
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      "assets/images/dummy_image.jpg",
                    ),
                  ),
                  // 유저 이름, 나이, 지역
                  Positioned(
                    bottom: 35,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // 온라인 상태 분기 처리
                            SvgPicture.asset("assets/svg/online_state_circle.svg"),
                            const SizedBox(width: 10),
                            Text(
                              "Kiffy",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.white, fontSize: 35),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 24, top: 4),
                          child: Text(
                            "24, Jakarta",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 4),
                      const Text(
                        "🕐 Respond within ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "25:25:11",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff0031AA),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 33, top: 4),
                    child: Text(
                      "If you don't respond, his heart will disappear.",
                      style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentPath: MatchingPage.routeLocation),
    );
  }
}
