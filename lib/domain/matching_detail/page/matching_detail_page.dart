import 'package:Kiffy/domain/common/custom_app_bar_image_title.dart';
import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/domain/core/enum/gender_type.dart';
import 'package:Kiffy/domain/matching/page/matching_page.dart';
import 'package:Kiffy/domain/matching_detail/widget/matching_user_profile_card.dart';
import 'package:Kiffy/domain/my_page/provider/user_profile_info.dart';
import 'package:Kiffy/infra/match_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/coaching_emoticon_provider.dart';

class MatchingDetailPage extends ConsumerStatefulWidget {
  static String get routeLocation => "/matchingDetail";
  static String get routeName => "matchingDetail";

  const MatchingDetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MatchingDetailPageState();
}

class _MatchingDetailPageState extends ConsumerState<MatchingDetailPage> {
  @override
  Widget build(BuildContext context) {
    final userDetailInfo = ref.read(matchedUserDetailProvider);
    final myProfileState = ref.read(myProfileInfo);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const CustomAppBarImageTitle(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 매칭 유저 디테일 프로필 카드
                  const MathcingUserProfileCard(),
                  const SizedBox(height: 8),

                  // 연락처 타이틀
                  if (myProfileState!.gender == Gender.FEMALE)
                    const Text(
                      "✉️ His ID for contact",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),

                  // SNS 연락처 아이디 (여성 유저한테만 보임 )
                  if (myProfileState.gender == Gender.FEMALE)
                    Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      margin: const EdgeInsets.only(left: 28, top: 10, right: 60, bottom: 30),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xff6c6c6c)),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          // 여상 유저한테만 보여짐
                          Image(image: AssetImage("assets/images/line_image.png"), width: 29, height: 29),
                          SizedBox(width: 8),

                          // 여성 유저한테만 보여짐
                          Text(
                            "라인 아이디",
                            style: TextStyle(fontSize: 16, color: Color(0xff6c6c6c)),
                          )
                        ],
                      ),
                    ),
                  // const SizedBox(height: 30),

                  // 코칭 메세지 텍스트
                  Text(
                    myProfileState.gender == Gender.FEMALE ? "✔️ Send it yo him like this!" : "✔️ Wait for her contact!",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),

                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text(
                      myProfileState.gender == Gender.FEMALE
                          ?
                          // 여성 유저한테 보여질 텍스트
                          "If you send him like this, he'll recognize you"
                          :
                          // 남성 유저한테 보여질 텍스트
                          "She'll get a message like this.",
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // 코칭 이모지
                  // matchEmogi.when(
                  //     loading: () => const Center(child: CircularProgressIndicator()),
                  //     error: (err, stack) => Text("Error: $err"),
                  //     data: (data) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           print("* Click to Copy!");
                  //         },
                  //         child: Container(
                  //           margin: const EdgeInsets.only(left: 24),
                  //           padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  //           decoration: BoxDecoration(
                  //             // color: Colors.red,
                  //             color: const Color(0xffEEEEEE),
                  //             borderRadius: BorderRadius.circular(50),
                  //           ),
                  //           child: Text(
                  //             "Hello 😊😘👻🐭",
                  //             style: TextStyle(
                  //               fontSize: 18,
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     }),
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
                        userDetailInfo?.name != null ? "Hey I'm ${userDetailInfo?.name}" : "",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),

                  // 여성 유저한테만 보여짐
                  if (myProfileState.gender == Gender.FEMALE)
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

                  // 매칭 취소 하기
                  if (myProfileState.gender == Gender.FEMALE)
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentPath: MatchingPage.routeLocation),
    );
  }
}
