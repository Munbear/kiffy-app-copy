import 'package:Kiffy/domain/common/custom_app_bar_image_title.dart';
import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/domain/common/reject_circle_button.dart';
import 'package:Kiffy/domain/common/wish_circle_button.dart';
import 'package:Kiffy/infra/wish_client.dart';
import 'package:Kiffy/model/media_view/media_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../util/BirthDateUtil.dart';
import '../../matching/page/matching_page.dart';

class UnMatchUserProfile extends ConsumerStatefulWidget {
  static String get routeLocation => "/unmatchUserProfile";
  static String get routeName => "unmatchUserProfile";

  final String userName;
  final String userAge;
  final String userId;

  const UnMatchUserProfile({
    super.key,
    required this.userName,
    required this.userAge,
    required this.userId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UnMatchUserProfileState();
}

class _UnMatchUserProfileState extends ConsumerState<UnMatchUserProfile> {
  PageController controller = PageController(initialPage: 0);
  int imageIndex = 0;
  void nextImage(imageLength) {
    if (imageIndex < imageLength - 1) {
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
    final userImages = ref.read(mediaDetailProvider);

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
                        children: userImages.map(
                          (foto) {
                            return Image.network(
                              foto.url,
                              fit: BoxFit.cover,
                            );
                          },
                        ).toList(),
                      ),
                    ),

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
                            width: 100 / userImages.length,
                            height: 3,
                            color: Colors.white,
                          ).animate().slideX(begin: 0.0, end: imageIndex.toDouble()),
                        ),
                      ),
                    ),

                    // 유저 이름, 나이, 지역
                    Positioned(
                      bottom: 35,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // 온라인 상태 분기 처리
                              SvgPicture.asset("assets/svg/online_state_circle.svg"),
                              const SizedBox(width: 10),
                              // 유저 이름
                              Text(
                                widget.userName,
                                textAlign: TextAlign.left,
                                style: const TextStyle(color: Colors.white, fontSize: 35),
                              ),
                            ],
                          ),
                          // 유저 위치
                          Padding(
                            padding: const EdgeInsets.only(left: 24, top: 4),
                            child: Text(
                              BirthDateUtil.getAge(BirthDateUtil.parseBirthDate(widget.userAge)).toString(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),

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
                              onTap: () => nextImage(userImages.length),
                            ),
                          ),
                        ],
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
                              ref.read(wishClientProvider).rejectWish(userId: widget.userId);
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(height: 16),
                          // 수락 버튼
                          WishCircleButton(
                            onClick: () async {
                              ref.read(wishClientProvider).approveWish(userId: widget.userId);
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
      bottomNavigationBar: CustomBottomNavBar(currentPath: MatchingPage.routeLocation),
    );
  }
}
