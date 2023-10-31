import 'package:Kiffy/domain/common/custom_app_bar_image_title.dart';
import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/domain/core/enum/gender_type.dart';
import 'package:Kiffy/domain/matching_detail/widget/contact_info_container.dart';
import 'package:Kiffy/screen_module/matched_detail/section/matched_detail_profile_card.dart';
import 'package:Kiffy/domain/my_page/provider/user_profile_info.dart';
import 'package:Kiffy/infra/match_client.dart';
import 'package:Kiffy/screen_module/common/provider/my_provider.dart';
import 'package:Kiffy/screen_module/matched_detail/widget/matched_user_detail_info_container.dart';
import 'package:built_collection/src/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class MatchedDetailScreen extends StatelessWidget {
  static String get routeLocation => "/matchingDetail";
  static String get routeName => "matchingDetail";

  final MatchedUserView userProfile;
  const MatchedDetailScreen({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.only(left: 16, top: 14, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 매칭 유저 디테일 프로필 카드
              MatchedDetailProfileCard(
                medias: userProfile.userProfile.medias,
                name: userProfile.userProfile.name,
                age: userProfile.userProfile.birthDate,
                intro: userProfile.userProfile.intro,
              ),
              const SizedBox(height: 8),

              const MatchedUserDetailInfoContainer(),
              // // // 연락처 타이틀
              // if (my == Gender.FEMALE)
              // const Text(
              //   "✉️ His ID for contact",
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              // ),

              // // // SNS 연락처 아이디 (여성 유저한테만 보임 )
              // // if (myProfileState.gender == Gender.FEMALE)
              // //   const ContactInfoContainer(),

              // // // 코칭 메세지 텍스트
              // // Text(
              // //   myProfileState.gender == Gender.FEMALE
              // //       ? "✔️ Send it yo him like this!"
              // //       : "✔️ Wait for her contact!",
              // //   style:
              // //       const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              // // ),
              // // const SizedBox(height: 8),

              // // Padding(
              // //   padding: const EdgeInsets.only(left: 28),
              // //   child: Text(
              // //     myProfileState.gender == Gender.FEMALE
              // //         ?
              // //         // 여성 유저한테 보여질 텍스트
              // //         "If you send him like this, he'll recognize you"
              // //         :
              // //         // 남성 유저한테 보여질 텍스트
              // //         "She'll get a message like this.",
              // //     style: const TextStyle(
              // //         fontSize: 13, fontWeight: FontWeight.w400),
              // //   ),
              // // ),
              // // const SizedBox(height: 10),

              // // // 코칭 이모지
              // // GestureDetector(
              // //   onTap: () {
              // //     Clipboard.setData(ClipboardData(text: myProfileState.name))
              // //         .then((value) {
              // //       return ScaffoldMessenger.of(context).showSnackBar(
              // //           const SnackBar(content: Text("it has been copied")));
              // //     });
              // //   },
              // //   child: Container(
              // //     margin: const EdgeInsets.only(left: 24),
              // //     padding:
              // //         const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              // //     decoration: BoxDecoration(
              // //       // color: Colors.red,
              // //       color: const Color(0xffEEEEEE),
              // //       borderRadius: BorderRadius.circular(50),
              // //     ),
              // //     child: Text(
              // //       userDetailInfo?.name != null
              // //           ? "Hey I'm ${myProfileState.name}"
              // //           : "",
              // //       style: const TextStyle(fontSize: 18),
              // //     ),
              // //   ),
              // // ),
              // // const SizedBox(height: 3),

              // // // 여성 유저한테만 보여짐
              // // if (myProfileState.gender == Gender.FEMALE)
              // //   const Padding(
              // //     padding: EdgeInsets.only(left: 34),
              // //     child: Text(
              // //       "* Click to copy!",
              // //       style: TextStyle(
              // //         fontSize: 12,
              // //         color: Color(0xff0031AA),
              // //       ),
              // //     ),
              // //   ),
              // const SizedBox(height: 30),

              // // 매칭 취소 하기
              // if (myProfileState.gender == Gender.FEMALE)
              //   SizedBox(
              //     width: MediaQuery.of(context).size.width,
              //     child: ElevatedButton(
              //       onPressed: () {
              //         print("cancel matching!!!");
              //       },
              //       style: ElevatedButton.styleFrom(
              //         padding: const EdgeInsets.symmetric(vertical: 16),
              //         shape: RoundedRectangleBorder(
              //           side: const BorderSide(color: Color(0xffFF3A3A)),
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         backgroundColor: Colors.white,
              //         elevation: 0,
              //       ),
              //       child: const Text(
              //         "Cancel Matching",
              //         style: TextStyle(
              //             fontSize: 20,
              //             color: Color(0xffFF3A3A),
              //             fontWeight: FontWeight.w400),
              //       ),
              //     ),
              //   ),
              // const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
