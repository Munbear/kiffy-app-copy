import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/common/profile_picture_container.dart';
import 'package:Kiffy/domain/common/profile_text_infro_container.dart';
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

import '../../../infra/explore_client.dart';
import '../../common/custom_bottom_nav_bar.dart';
import '../../common/page_controller_button.dart';
import '../../common/profile_foto_indicator.dart';
import '../../profile/provider/add_profile_input_provider.dart';

class MyPage extends ConsumerStatefulWidget {
  static String get routeLocation => "/myPage";
  static String get routeName => "myPage";

  const MyPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyPage> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final myProfile = ref.read(myProfileInfo);
    final currentImageIndex = ref.watch(currentPictureIndex);

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 14),
            Stack(
              alignment: Alignment.center,
              children: [
                // 유저 사진
                ProfilePictureContainer(
                  userProfilePictures: myProfile!.medias,
                  pageController: pageController,
                  height: 390,
                ),

                // 유저 이름, 나
                ProfileTextInfoContainer(
                  userName: myProfile.name,
                  userAge: myProfile.birthDate,
                ),

                Positioned(
                  top: 15,
                  child: ProfileFotoIndicator(mediasLength: myProfile.medias.length, endIndex: currentImageIndex.toDouble()),
                ),

                // 프로필 카드 버튼
                PageControllerButton(
                  prevButton: () => ref.read(exploreProvider).prevImage(currentImageIndex, pageController),
                  nextButton: () => ref.read(exploreProvider).nextImage(currentImageIndex, pageController, myProfile.medias.length),
                ),
                // Container(
                //   color: Colors.red,
                //   width: 300,
                //   height: 300,
                //   child: PageControllerButton(
                //     prevButton: () => ref.read(exploreProvider).prevImage(currentImageIndex, pageController),
                //     nextButton: () => ref.read(exploreProvider).nextImage(currentImageIndex, pageController, myProfile.medias.length),
                //   ),
                // ),

                // 사진 인디케이터
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
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
