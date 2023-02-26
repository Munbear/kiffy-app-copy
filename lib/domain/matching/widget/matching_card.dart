import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/common/style/border._style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchingCard extends HookConsumerWidget {
  const MatchingCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(routerProvider).pushNamed("matchingDetail");
      },
      child: Container(
        height: 205,
        margin: const EdgeInsets.only(top: 12),
        decoration: BorderGradientBorderRadius10.innerDecoration,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BorderGradientBorderRadius10.outlineGradientBoxDecoration,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/test_image.png"),
                ),
              ),
              Positioned(
                bottom: 14,
                left: 12,
                child: Row(
                  children: [
                    Text(
                      "Kiffy",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      "24",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              // 매칭 된 유저가 끌올 한 횟수
              Positioned(
                top: 12,
                right: 8,
                child: Row(
                  children: [
                    // SvgPicture.asset("assets/svg/remind_icon.svg"),
                    Image(
                      width: 13,
                      height: 13,
                      image: AssetImage("assets/images/remind_image.png"),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      "99",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.add,
                      size: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
