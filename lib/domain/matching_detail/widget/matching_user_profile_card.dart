import 'package:Kiffy/infra/match_client.dart';
import 'package:Kiffy/util/BirthDateUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MathcingUserProfileCard extends ConsumerStatefulWidget {
  const MathcingUserProfileCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MathcingUserProfileCardState();
}

class _MathcingUserProfileCardState extends ConsumerState<MathcingUserProfileCard> {
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
    final userDetailInfo = ref.read(matchedUserDetailProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        height: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            // 프로필 사진
            Container(
              height: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: PageView(
                controller: controller,
                onPageChanged: (int page) {
                  setState(() => imageIndex = page);
                },
                children: userDetailInfo!.medias.map((foto) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      foto.url,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
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
                    width: 100 / userDetailInfo.medias.length,
                    height: 3,
                    color: Colors.white,
                  ).animate().slideX(begin: 0.0, end: imageIndex.toDouble()),
                ),
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
                    style: TextStyle(
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
                  // Text(
                  //   "Jakarta",
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w300,
                  //   ),
                  // ),
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
                      onTap: () => nextImage(userDetailInfo.medias.length),
                    ),
                  ),
                ],
              ),
            ),

            // 남성 유저한테만 보여짐 여성 유저만 안보여짐
            // 끌올 기능
            // Positioned(
            //   right: 18,
            //   bottom: 38,
            //   child: GestureDetector(
            //     onTap: () {
            //       print("끌올 끌올");
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.all(10),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(50),
            //         border: Border.all(color: Colors.white),
            //       ),
            //       child: const Center(
            //         child: Image(
            //           image: AssetImage("assets/images/remind_image.png"),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
