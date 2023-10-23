import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/common/border._style.dart';
import 'package:Kiffy/domain/matching_detail/page/matching_detail_page.dart';
import 'package:Kiffy/infra/match_client.dart';
import 'package:Kiffy/model/matched_user_profiles_view/matched_user_profiles_view.dart';
import 'package:Kiffy/util/BirthDateUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class MatchingCard extends ConsumerWidget {
  final MatchedUserView userProfile;

  const MatchingCard({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        // TODO
        // 매칭된 유저 상세 화면으로
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
              // 유저 사진
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  userProfile.userProfile.medias.first.url,
                  // userProfile.medias.first.url,
                  fit: BoxFit.cover,
                ),
              ),

              // 유저 닉네임
              Positioned(
                bottom: 14,
                left: 12,
                child: Row(
                  children: [
                    Text(
                      userProfile.userProfile.name,
                      // userProfile.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      BirthDateUtil.getAge(
                        BirthDateUtil.parseBirthDate(
                            userProfile.userProfile.birthDate.toIso8601String()
                            // userProfile.birthDate.toIso8601String(),
                            ),
                      ).toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
