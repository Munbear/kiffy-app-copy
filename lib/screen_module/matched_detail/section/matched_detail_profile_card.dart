import 'package:Kiffy/domain/common/profile_foto_indicator.dart';
import 'package:Kiffy/screen_module/common/provider/my_provider.dart';
import 'package:Kiffy/util/BirthDateUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:openapi/openapi.dart';
import 'package:built_collection/src/list.dart';

class MatchedDetailProfileCard extends ConsumerStatefulWidget {
  final BuiltList<MediaView> medias;
  final String name;
  final DateTime age;
  final String intro;

  const MatchedDetailProfileCard({
    super.key,
    required this.medias,
    required this.name,
    required this.age,
    required this.intro,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MatchedDetailProfileCardState();
}

class _MatchedDetailProfileCardState
    extends ConsumerState<MatchedDetailProfileCard> {
  PageController pageController = PageController(initialPage: 0);
  int currentImageIndex = 0;

  // 다음 카드
  void nextImage(
      int currentIndex, PageController pageController, int mediasLength) {
    if (currentIndex < mediasLength - 1) {
      currentIndex++;
      // 페이지 이동
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // 이전 카드
  void prevImage(int currentIndex, PageController pageController) {
    if (currentIndex > 0) {
      currentIndex--;

      // 페이지 이동
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final myInfo = ref.read(myProvider);

    return SizedBox(
      height: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// 이미지
            PageView(
              controller: pageController,
              children: widget.medias.map((e) {
                return Image.network(
                  e.url,
                  fit: BoxFit.cover,
                );
              }).toList(),
            ),

            // 이름
            Positioned(
              bottom: 50,
              left: 24,
              child: Text(
                widget.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // 나이
            Positioned(
              bottom: 20,
              left: 24,
              child: Text(
                BirthDateUtil.getAge(
                  BirthDateUtil.parseBirthDate(widget.age.toIso8601String()),
                ).toString(),
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            // 사진 인디케이터
            Positioned(
              top: 15,
              child: ProfileFotoIndicator(
                  mediasLength: widget.medias.length,
                  endIndex: currentImageIndex.toDouble()),
            ),

            // 터치 영역
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                // 이전 사진 보기
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      prevImage(
                        currentImageIndex,
                        pageController,
                      );
                    },
                    child: Container(color: Colors.red.withOpacity(0.3)),
                  ),
                ),
                // 다음 사진 보기
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      nextImage(
                        currentImageIndex,
                        pageController,
                        widget.medias.length,
                      );
                    },
                    child: Container(color: Colors.blue.withOpacity(0.3)),
                  ),
                ),
              ],
            ),

            if (myInfo.info!.profile!.gender == GenderEnumView.MALE)
              Positioned(
                bottom: 31,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            //TODO
                            print("노크");
                          },
                          child: Image.asset(
                            "assets/images/knock_image.png",
                            width: 31,
                            height: 31,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
