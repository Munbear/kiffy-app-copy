import 'package:Kiffy/domain/common/border._style.dart';
import 'package:Kiffy/util/BirthDateUtil.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class MatchingUserCard extends StatelessWidget {
  final MatchedUserView userProfile;
  final VoidCallback onTap;

  const MatchingUserCard({
    super.key,
    required this.onTap,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
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
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      BirthDateUtil.getAge(
                        BirthDateUtil.parseBirthDate(userProfile
                            .userProfile.birthDate
                            .toIso8601String()),
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
