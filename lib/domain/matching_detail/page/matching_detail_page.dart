import 'package:Kiffy/domain/common/custom_app_bar.dart';
import 'package:Kiffy/domain/common/custom_app_bar_image_title.dart';
import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:Kiffy/domain/matching_detail/widget/matching_user_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/retry.dart';

class MatchingDetailPage extends HookConsumerWidget {
  const MatchingDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const CustomAppBarImageTitle(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.759,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 매칭 유저 디테일 프로필 카드
                      const MathcingUserProfileCard(),
                      const SizedBox(height: 8),

                      // male 유저 아이디
                      const Text(
                        "✉️ His ID for contact",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        margin: const EdgeInsets.only(left: 28, top: 10, right: 60),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xff6c6c6c)),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/images/line_image.png"), width: 29, height: 29),
                            const SizedBox(width: 8),
                            Text(
                              "Kiffy123",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff6c6c6c),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // 코칭 메세지 텍스트
                      const Text(
                        "✔️ Send it yo him like this!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),

                      const Padding(
                        padding: EdgeInsets.only(left: 28),
                        child: Text(
                          "If you send him like this, he'll recognize you",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // 코칭 메세지 예시
                      GestureDetector(
                        onTap: () {
                          print("* Click to Copy!");
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 24),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            color: const Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Hello 😊😘👻🐭",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Padding(
                        padding: EdgeInsets.only(left: 34),
                        child: Text(
                          "* Click to copy!",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff0031AA),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // 유저 성별에 따라서 보여짐
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            print("cancel matching!!!");
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xffFF3A3A)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.white,
                            elevation: 0,
                          ),
                          child: const Text(
                            "Cancel Matching",
                            style: TextStyle(fontSize: 20, color: Color(0xffFF3A3A), fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),

            // 하단 배치를 위한 나머지 위젯
            const Spacer(),
            // 커스텀 바텀 네비게이션 바
            const CustomBottomNavigationBar()
          ],
        ),
      ),
    );
  }
}
