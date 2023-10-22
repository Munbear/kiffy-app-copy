import 'package:Kiffy/domain/common/page_controller_button.dart';
import 'package:Kiffy/domain/common/profile_foto_indicator.dart';
import 'package:Kiffy/domain/common/profile_picture_container.dart';
import 'package:Kiffy/infra/explore_client.dart';
import 'package:Kiffy/infra/match_client.dart';
import 'package:Kiffy/util/BirthDateUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MathcingUserProfileCard extends ConsumerStatefulWidget {
  const MathcingUserProfileCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MathcingUserProfileCardState();
}

class _MathcingUserProfileCardState
    extends ConsumerState<MathcingUserProfileCard> {
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
          children: [
            // 프로필 사진
            ProfilePictureContainer(
              height: MediaQuery.of(context).size.height,
              userProfilePictures: userDetailInfo!.medias.toList(),
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

            // 유저 나이 및 지역
            if (currentImageIndex != (userDetailInfo.medias.length - 1))
              Positioned(
                left: 28,
                bottom: 29,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userDetailInfo.name,
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      BirthDateUtil.getAge(BirthDateUtil.parseBirthDate(userDetailInfo.birthDate.toIso8601String()))
                          .toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),

            //자기 소개
            if (currentImageIndex == (userDetailInfo.medias.length - 1))
              Positioned(
                left: 28,
                bottom: 29,
                child: Text(
                  userDetailInfo.intro,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

            // 이미지 컨트롤
            Positioned(
              child: PageControllerButton(
                prevButton: () => ref
                    .read(exploreProvider)
                    .prevImage(currentImageIndex, pageController),
                nextButton: () => ref.read(exploreProvider).nextImage(
                    currentImageIndex,
                    pageController,
                    userDetailInfo.medias.length
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
