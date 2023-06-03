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
  int imageIndex = 0;
  int fatchNum = 0;

  void nextImage() {
    if (imageIndex < widget.userProfile.medias.length - 1) {
      imageIndex++;
      controller.animateToPage(imageIndex, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void prevImage() {
    if (imageIndex > 0) {
      imageIndex--;
      controller.animateToPage(imageIndex, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
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
          Container(
            height: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  offset: const Offset(0, 5),
                  blurRadius: 4,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: PageView(
              controller: controller,
              onPageChanged: (int page) {
                setState(() => imageIndex = page);
              },
              children: widget.userProfile.medias.map(
                (foto) {
                  return Image.network(
                    foto.url,
                    fit: BoxFit.cover,
                  );
                },
              ).toList(),
            ),
          ),

          // 인디케이터
          Positioned(
            top: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 100,
                height: 3,
                color: Colors.white.withOpacity(0.5),
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 100 / widget.userProfile.medias.length,
                  height: 3,
                  color: Colors.white,
                ).animate().slideX(begin: 0.0, end: imageIndex.toDouble()),
              ),
            ),
          ),
          // Container(
          //     width: 100 / (widget.userProfile.medias.length),
          //     height: 3,
          //     decoration: BoxDecoration(
          //       color: Colors.red,
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //   ),

          // 온라인 여부, 유저 닉네임, 유저 나이
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

          // 다음 이전 사진
          Positioned(
            child: Row(
              children: [
                // 이전 사진으로
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                    ),
                    onTap: () => prevImage(),
                  ),
                ),
                // 다음 사진으로
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                    ),
                    onTap: () => nextImage(),
                  ),
                ),
              ],
            ),
          ),

          // 위시 수락 및 거절 위치
          Positioned(
            right: 25,
            bottom: 20,
            child: Column(
              children: [
                // 위시 거절하기
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            // 위시 거절 하기
                            ref.read(wishClientProvider).rejectWish(userId: widget.userProfile.id);
                            ref.read(wishCount.notifier).update((state) => state + 1);
                            // 카드 넘기기
                            widget.controller.swipeTop();
                          },
                          child: const Icon(Icons.close, color: Colors.white, size: 40),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // 위지 보내기
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            // 위시 수락 하기
                            ref.read(wishClientProvider).approveWish(userId: widget.userProfile.id);

                            ref.read(wishCount.notifier).update((state) => state + 1);

                            // 카드 넘기기
                            widget.controller.swipeTop();
                          },
                          child: Container(margin: const EdgeInsets.only(top: 13), child: Image.asset("assets/icons/heart_icon.png")),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
