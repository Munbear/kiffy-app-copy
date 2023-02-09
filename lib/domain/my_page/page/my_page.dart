import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:Kiffy/domain/my_page/widget/my_page_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPage extends HookConsumerWidget {
  final innerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(90),
  );
  final gradientBoxDecoration = BoxDecoration(
    border: Border.all(color: Colors.transparent, width: 2),
    borderRadius: BorderRadius.circular(90),
    gradient: const LinearGradient(colors: [Color(0xffBA00FF), Color(0xff0031AA)]),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset("assets/images/kiffy_logo_purple.png", width: 50),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // 유저 프로필 사진
                Container(
                  height: 320,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox.expand(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: const Image(fit: BoxFit.cover, image: AssetImage("assets/images/test_image.png")),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Dowon",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "25",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            MyPageButton(text: "프로필 수정하기"),
            const SizedBox(height: 8),
            MyPageButton(text: "연락처 추가하기"),
            const SizedBox(height: 8),
            MyPageButton(text: "설정"),
            const Spacer(),
            GlobalBottomNavigation(),
          ],
        ),
      ),
    );
  }
}
