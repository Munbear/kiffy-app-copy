import 'package:Kiffy/screen_module/common/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class MatchedUserDetailInfoContainer extends ConsumerWidget {
  const MatchedUserDetailInfoContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myGender = ref.read(myProvider).info!.profile!.gender;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // // 연락처 타이틀
        if (myGender == GenderEnumView.FEMALE)
          const Text(
            "✉️ His ID for contact",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),

        // // SNS 연락처 아이디 (여성 유저한테만 보임 )
        // if (myProfileState.gender == Gender.FEMALE)
        //   const ContactInfoContainer(),

        // // 코칭 메세지 텍스트
        // Text(
        //   myProfileState.gender == Gender.FEMALE
        //       ? "✔️ Send it yo him like this!"
        //       : "✔️ Wait for her contact!",
        //   style:
        //       const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        // ),
        // const SizedBox(height: 8),

        // Padding(
        //   padding: const EdgeInsets.only(left: 28),
        //   child: Text(
        //     myProfileState.gender == Gender.FEMALE
        //         ?
        //         // 여성 유저한테 보여질 텍스트
        //         "If you send him like this, he'll recognize you"
        //         :
        //         // 남성 유저한테 보여질 텍스트
        //         "She'll get a message like this.",
        //     style: const TextStyle(
        //         fontSize: 13, fontWeight: FontWeight.w400),
        //   ),
        // ),
        // const SizedBox(height: 10),

        // // 코칭 이모지
        // GestureDetector(
        //   onTap: () {
        //     Clipboard.setData(ClipboardData(text: myProfileState.name))
        //         .then((value) {
        //       return ScaffoldMessenger.of(context).showSnackBar(
        //           const SnackBar(content: Text("it has been copied")));
        //     });
        //   },
        //   child: Container(
        //     margin: const EdgeInsets.only(left: 24),
        //     padding:
        //         const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        //     decoration: BoxDecoration(
        //       // color: Colors.red,
        //       color: const Color(0xffEEEEEE),
        //       borderRadius: BorderRadius.circular(50),
        //     ),
        //     child: Text(
        //       userDetailInfo?.name != null
        //           ? "Hey I'm ${myProfileState.name}"
        //           : "",
        //       style: const TextStyle(fontSize: 18),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 3),

        // // 여성 유저한테만 보여짐
        // if (myProfileState.gender == Gender.FEMALE)
        //   const Padding(
        //     padding: EdgeInsets.only(left: 34),
        //     child: Text(
        //       "* Click to copy!",
        //       style: TextStyle(
        //         fontSize: 12,
        //         color: Color(0xff0031AA),
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}
