import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MathcingUserProfileCard extends ConsumerStatefulWidget {
  const MathcingUserProfileCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MathcingUserProfileCardState();
}

class _MathcingUserProfileCardState extends ConsumerState<MathcingUserProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        height: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 프로필 사진
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/example_for_dev.png"),
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
                    "Kiffy",
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
                    "24",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "Jakarta",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),

            // 남성 유저한테만 보여짐 여성 유저만 안보여짐
            Positioned(
              right: 18,
              bottom: 38,
              child: GestureDetector(
                onTap: () {
                  print("끌올 끌올");
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Center(
                    child: Image(
                      image: AssetImage("assets/images/remind_image.png"),
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
