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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  // 유저 프로필 사진
                  Container(
                    height: 390,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    // margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox.expand(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const Image(fit: BoxFit.cover, image: AssetImage("assets/images/test_image.png")),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 37, bottom: 27),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dowon",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "25",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              "Jakarta",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const MyPageButton(
                    text: "프로필 수정하기",
                    iconPath: "assets/images/modify_x3.png",
                  ),
                  const SizedBox(width: 22),
                  MyPageButton(
                    text: "연락처 추가하기",
                    iconPath: "assets/images/setting_x3.png",
                  ),
                ],
              ),
              const Spacer(),
              // GlobalBottomNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}
