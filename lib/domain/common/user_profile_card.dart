import 'package:Kiffy/domain/common/page_controller_button.dart';
import 'package:Kiffy/domain/common/profile_foto_indicator.dart';
import 'package:Kiffy/domain/common/profile_picture_container.dart';
import 'package:Kiffy/domain/common/reject_circle_button.dart';
import 'package:Kiffy/domain/common/wish_circle_button.dart';
import 'package:Kiffy/infra/explore_client.dart';
import 'package:Kiffy/infra/wish_client.dart';
import 'package:Kiffy/model/explore_user_profiles_view/explore_user_profiles_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:Kiffy/util/BirthDateUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfileCard extends ConsumerStatefulWidget {
  final UserProfileView userProfile;
  final CardSwiperController controller;

  UserProfileCard({
    super.key,
    required this.userProfile,
    required this.controller,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserProfileCardState();
}

class _UserProfileCardState extends ConsumerState<UserProfileCard> {
  PageController controller = PageController(initialPage: 0);

  void nextImage(currentIndex) {
    if (currentIndex < widget.userProfile.medias.length - 1) {
      currentIndex++;
      controller.animateToPage(currentIndex, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void prevImage(currentIndex) {
    if (currentIndex > 0) {
      currentIndex--;
      controller.animateToPage(currentIndex, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentImageIndex = ref.watch(currentPictureIndex);

    return Container(
      padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 유저 사진
          ProfilePictureContainer(
            userProfilePictures: widget.userProfile.medias,
            pageController: controller,
          ),

          // 프로필 사진 인디케이터
          Positioned(
            top: 15,
            child: ProfileFotoIndicator(mediasLength: widget.userProfile.medias.length, endIndex: currentImageIndex.toDouble()),
          ),

          // 온라인 여부, 유저 닉네임, 유저 나이
          if (currentImageIndex != (widget.userProfile.medias.length - 1))
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 25, bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/svg/online_state_circle.svg"),
                        const SizedBox(width: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.userProfile.name,
                                style: const TextStyle(color: Colors.white, fontSize: 28),
                              ),
                              const TextSpan(text: "    "),
                              TextSpan(
                                text: BirthDateUtil.getAge(BirthDateUtil.parseBirthDate(widget.userProfile.birthDate)).toString(),
                                style: const TextStyle(color: Colors.grey, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
            prevButton: () => prevImage(currentImageIndex),
            nextButton: () => nextImage(currentImageIndex),
          )),

          // 위시 수락 및 거절 위치
          Positioned(
            right: 25,
            bottom: 20,
            child: Column(
              children: [
                // 위시 거절하
                RejectCircleButton(onClick: () {
                  ref.read(wishClientProvider).rejectWish(userId: widget.userProfile.id);
                  ref.read(wishCount.notifier).update((state) => state + 1);
                  // 카드 넘기기
                  widget.controller.swipeTop();
                }),
                const SizedBox(height: 12),
                // 위지 보내기
                WishCircleButton(
                  onClick: () {
                    // 위시 수락 하기
                    ref.read(wishClientProvider).approveWish(userId: widget.userProfile.id);
                    // 위시 카운터
                    ref.read(wishCount.notifier).update((state) => state + 1);
                    // 카드 넘기기
                    widget.controller.swipeTop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
