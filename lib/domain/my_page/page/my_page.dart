import 'package:Kiffy/domain/common/profile_picture_container.dart';
import 'package:Kiffy/domain/common/profile_text_infro_container.dart';
import 'package:Kiffy/domain/my_page/provider/user_profile_info.dart';
import 'package:Kiffy/domain/my_page/widget/my_page_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/explore_client.dart';
import '../../common/custom_bottom_nav_bar.dart';
import '../../common/page_controller_button.dart';
import '../../common/profile_foto_indicator.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const SizedBox(height: 14),
            Stack(
              alignment: Alignment.center,
              children: [
                // 유저 사진
                ProfilePictureContainer(
                  userProfilePictures: myProfile?.medias ?? [],
                  pageController: pageController,
                  height: 390,
                ),

                // 유저 이름, 나이
                if ((myProfile != null) && currentImageIndex != (myProfile.medias.length - 1))
                  ProfileTextInfoContainer(
                    userName: myProfile.name,
                    userAge: myProfile.birthDate,
                  ),

                // 자기소개
                if ((myProfile != null) && currentImageIndex == (myProfile.medias.length - 1))
                  Positioned(
                    left: 25,
                    bottom: 25,
                    child: Text(
                      myProfile.intro,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),

                // 인디케이터
                Positioned(
                  top: 15,
                  child: ProfileFotoIndicator(mediasLength: myProfile!.medias.length, endIndex: currentImageIndex.toDouble()),
                ),

                // 프로필 카드 버튼
                Positioned.fill(
                  child: PageControllerButton(
                    prevButton: () => ref.read(exploreProvider).prevImage(currentImageIndex, pageController),
                    nextButton: () => ref.read(exploreProvider).nextImage(currentImageIndex, pageController, myProfile.medias.length),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const Row(
              children: [
                MyPageButton(
                  text: "Modify Profile",
                  iconPath: "assets/images/modify_x3.png",
                  routePathName: "resetProfile",
                ),
                SizedBox(width: 22),
                MyPageButton(
                  text: "Setting",
                  iconPath: "assets/images/setting_x3.png",
                  routePathName: "setting",
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
