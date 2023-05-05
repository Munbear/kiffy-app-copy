import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:Kiffy/domain/my_page/provider/user_profile_info.dart';
import 'package:Kiffy/domain/my_page/widget/my_page_button.dart';
import 'package:Kiffy/model/media_view/media_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:Kiffy/util/BirthDateUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/custom_bottom_nav_bar.dart';
import '../../profile/provider/add_profile_input_provider.dart';

class MyPage extends ConsumerStatefulWidget {
  static String get routeLocation => "/myPage";
  static String get routeName => "myPage";

  const MyPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyPage> {
  @override
  Widget build(BuildContext context) {
    final myProfile = ref.watch(myProfileProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Image.asset(
          width: 70,
          height: 55,
          "assets/images/kiffy_logo_purple.png",
        ),
      ),
      body: myProfile.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text("Error : $err"),
        data: (myProfile) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 14),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  // 유저 프로필 사진
                  // if (user.value != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 390,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: SizedBox.expand(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(myProfile.medias.first.url, fit: BoxFit.cover),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 37, bottom: 27),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: myProfile.name,
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: " ${BirthDateUtil.getAge(BirthDateUtil.parseBirthDate(myProfile.birthDate)).toString()}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    MyPageButton(
                      text: "Modify Profile",
                      iconPath: "assets/images/modify_x3.png",
                      routePathName: "resetProfile",
                    ),
                    const SizedBox(width: 22),
                    MyPageButton(
                      text: "Setting",
                      iconPath: "assets/images/setting_x3.png",
                      routePathName: "setting",
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
