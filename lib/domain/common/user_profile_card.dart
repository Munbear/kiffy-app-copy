import 'package:Kiffy/domain/common/page_controller_button.dart';
import 'package:Kiffy/domain/common/profile_foto_indicator.dart';
import 'package:Kiffy/domain/common/profile_picture_container.dart';
import 'package:Kiffy/domain/common/profile_text_infro_container.dart';
import 'package:Kiffy/domain/common/reject_circle_button.dart';
import 'package:Kiffy/domain/common/wish_circle_button.dart';
import 'package:Kiffy/infra/explore_client.dart';
import 'package:Kiffy/infra/wish_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class UserProfileCard extends StatefulWidget {
  final UserProfileView userProfile;
  final CardSwiperController controller;
  final Function(String) onWishReject;
  final Function(String) onWishApprove;

  const UserProfileCard({
    super.key,
    required this.userProfile,
    required this.controller,
    required this.onWishReject,
    required this.onWishApprove,
  });

  @override
  State<UserProfileCard> createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  PageController pageController = PageController(initialPage: 0);
  int currentImageIndex = 0;

  // 다음 카드
  void nextImage(
      int currentIndex, PageController pageController, int mediasLength) {
    if (currentIndex < mediasLength - 1) {
      currentIndex++;
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  // 이전 카드
  void prevImage(int currentIndex, PageController pageController) {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 유저 사진
          ProfilePictureContainer(
            userProfilePictures: widget.userProfile.medias.toList(),
            pageController: pageController,
            height: MediaQuery.of(context).size.height,
          ),

          // 프로필 사진 인디케이터
          Positioned(
            top: 15,
            child: ProfileFotoIndicator(
                mediasLength: widget.userProfile.medias.length,
                endIndex: currentImageIndex.toDouble()),
          ),

          // 온라인 여부, 유저 닉네임, 유저 나이
          if (currentImageIndex != (widget.userProfile.medias.length - 1))
            ProfileTextInfoContainer(
              userName: widget.userProfile.name,
              userAge: widget.userProfile.birthDate.toIso8601String(),
            ),

          // 자기소개
          if (currentImageIndex == (widget.userProfile.medias.length - 1))
            Positioned(
              left: 25,
              bottom: 25,
              child: Text(
                widget.userProfile.intro,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),

          // 다음 이전 사진
          Positioned(
            child: PageControllerButton(
                prevButton: () => prevImage(currentImageIndex,
                    pageController), //prevImage(currentImageIndex),
                nextButton: () => nextImage(
                      currentImageIndex,
                      pageController,
                      widget.userProfile.medias.length,
                    ) //nextImage(currentImageIndex),
                ),
          ),

          // 위시 수락 및 거절 위치
          Positioned(
            right: 25,
            bottom: 20,
            child: Column(
              children: [
                // 위시 거절하
                RejectCircleButton(onClick: () => widget.onWishReject),
                const SizedBox(height: 12),
                // 위지 보내기
                WishCircleButton(
                  onClick: () => widget.onWishApprove,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
