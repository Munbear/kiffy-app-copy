import 'package:Kiffy/domain/common/page_controller_button.dart';
import 'package:Kiffy/domain/common/profile_foto_indicator.dart';
import 'package:Kiffy/domain/common/profile_picture_container.dart';
import 'package:Kiffy/infra/explore_client.dart';
import 'package:Kiffy/infra/match_client.dart';
import 'package:Kiffy/util/BirthDateUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MathcingUserProfileCard extends ConsumerStatefulWidget {
  const MathcingUserProfileCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MathcingUserProfileCardState();
}

class _MathcingUserProfileCardState extends ConsumerState<MathcingUserProfileCard> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final userDetailInfo = ref.read(matchedUserDetailProvider);
    final currentImageIndex = ref.watch(currentPictureIndex);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        height: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          // fit: StackFit.expand,
          children: [
            // 프로필 사진
            ProfilePictureContainer(
              height: MediaQuery.of(context).size.height,
              userProfilePictures: userDetailInfo!.medias,
              pageController: pageController,
            ),

            // 인디케이터
            Positioned(
              top: 15,
              child: ProfileFotoIndicator(
                mediasLength: userDetailInfo.medias.length,
                endIndex: currentImageIndex.toDouble(),
              ),
            ),

            Positioned(
              left: 28,
              bottom: 59,
              child: Row(
                children: [
                  // 온라인 상태
                  SvgPicture.asset("assets/svg/online_circle.svg"),
                  const SizedBox(width: 14),
                  // 유저 닉네임
                  Text(
                    userDetailInfo.name,
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),

            // 유저 나이 및 지역
            Positioned(
              left: 54,
              bottom: 29,
              child: Row(
                children: [
                  Text(
                    BirthDateUtil.getAge(BirthDateUtil.parseBirthDate(userDetailInfo.birthDate)).toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),

            // 이미지 컨트롤
            Positioned(
              child: PageControllerButton(
                prevButton: () => ref.read(exploreProvider).prevImage(currentImageIndex, pageController),
                nextButton: () => ref.read(exploreProvider).nextImage(currentImageIndex, pageController, userDetailInfo.medias.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
