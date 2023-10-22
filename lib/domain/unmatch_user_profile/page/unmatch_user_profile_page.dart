import 'package:Kiffy/domain/common/custom_app_bar_image_title.dart';
import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/domain/common/page_controller_button.dart';
import 'package:Kiffy/domain/common/profile_foto_indicator.dart';
import 'package:Kiffy/domain/common/profile_text_infro_container.dart';
import 'package:Kiffy/domain/common/reject_circle_button.dart';
import 'package:Kiffy/domain/common/wish_circle_button.dart';
import 'package:Kiffy/infra/wish_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infra/explore_client.dart';
import '../../common/profile_picture_container.dart';
import '../../matching/page/matching_page.dart';

class UnMatchUserProfile extends ConsumerStatefulWidget {
  static String get routeLocation => "/unmatchUserProfile";
  static String get routeName => "unmatchUserProfile";

  final String userName;
  final String userAge;
  final String userId;
  final String userIntro;

  const UnMatchUserProfile({
    super.key,
    required this.userName,
    required this.userAge,
    required this.userId,
    required this.userIntro,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UnMatchUserProfileState();
}

class _UnMatchUserProfileState extends ConsumerState<UnMatchUserProfile> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final userImages = ref.read(mediaDetailProvider);

    final currentImageIndex = ref.watch(currentPictureIndex);

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    // 유저 사진
                    ProfilePictureContainer(
                      userProfilePictures: userImages.toList(),
                      pageController: pageController,
                      height: MediaQuery.of(context).size.height,
                    ),

                    // 프로필 사진 인디케이터
                    Positioned(
                      top: 15,
                      child: ProfileFotoIndicator(
                          mediasLength: userImages.length,
                          endIndex: currentImageIndex.toDouble()),
                    ),

                    // 유저 닉네임, 유저 나이
                    if (currentImageIndex != (userImages.length - 1))
                      ProfileTextInfoContainer(
                        userName: widget.userName,
                        userAge: widget.userAge,
                      ),

                    // 자기소개
                    if (currentImageIndex == (userImages.length - 1))
                      Positioned(
                        left: 25,
                        bottom: 25,
                        child: Text(
                          widget.userIntro,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),

                    // 이미지 페이지 컨트롤
                    Positioned(
                      child: PageControllerButton(
                          prevButton: () => ref.read(exploreProvider).prevImage(
                              currentImageIndex,
                              pageController), //prevImage(currentImageIndex),
                          nextButton: () => ref.read(exploreProvider).nextImage(
                              currentImageIndex,
                              pageController,
                              userImages.length) //nextImage(currentImageIndex),
                          ),
                    ),

                    // 버튼 위치
                    Positioned(
                      right: 20,
                      bottom: 38,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // 거절 버튼
                          RejectCircleButton(
                            onClick: () async {
                              // 위시 거절
                              ref
                                  .read(wishClientProvider)
                                  .rejectWish(userId: widget.userId);
                              // 돌아가기
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(height: 16),
                          // 수락 버튼
                          WishCircleButton(
                            onClick: () async {
                              // 위시 수락
                              ref
                                  .read(wishClientProvider)
                                  .approveWish(userId: widget.userId);
                              // 돌아 가기
                              Navigator.pop(context);
                              // print("수락수락");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          CustomBottomNavBar(currentPath: MatchingPage.routeLocation),
    );
  }
}
