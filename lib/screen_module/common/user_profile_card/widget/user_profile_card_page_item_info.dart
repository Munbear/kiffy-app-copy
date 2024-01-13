import 'package:Kiffy/constant/option_profile_type.dart';
import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/option_profile_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class UserProfileCardPageItemInfo extends StatelessWidget {
  final String name;
  final int age;
  final ZodiacTypeEnumView? zodiac;
  final MBTITypeEnumView? mbti;
  final String? weight;
  final String? height;
  final List<String>? tags;
  final List<ProfileTagViewTagTypesInner>? tagTypes;

  const UserProfileCardPageItemInfo(
      {super.key,
      required this.name,
      required this.age,
      this.zodiac,
      this.mbti,
      this.height,
      this.weight,
      this.tags,
      this.tagTypes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 3,
              ),
            ],
          ),
        ),
        Text(
          "$age",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 3,
              ),
            ],
          ),
        ),
        Gab.height8,
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            spacing: 6,
            runSpacing: 2,
            children: [
              if (tagTypes != null)
                ...tagTypes!.map(
                  (e) {
                    TagTypeEnumView? type = e.tagType;
                    return Builder(
                      builder: (context) {
                        String text =
                            e.tags!.map((e) => e.i18nKey).firstOrNull ?? "";
                        switch (type) {
                          case TagTypeEnumView.DESIRE_RELATIONSHIP_TYPE:
                            return OptionProfilChip(
                              iconPath:
                                  OptionProfileType.relationship.imagePath,
                              label: text.tr(),
                            );
                          case TagTypeEnumView.PERSONALITY_TYPE:
                            return OptionProfilChip(
                              iconPath: OptionProfileType.personality.imagePath,
                              label: text.tr(),
                            );
                          case TagTypeEnumView.FAVORITE_COFFEE_TYPE:
                            return OptionProfilChip(
                              iconPath: OptionProfileType.coffee.imagePath,
                              label: text.tr(),
                            );
                          case TagTypeEnumView.LANGUAGE_TYPE:
                            return OptionProfilChip(
                              iconPath: OptionProfileType.language.imagePath,
                              label: text.tr(),
                            );
                          default:
                            return const SizedBox();
                        }
                      },
                    );
                  },
                ),
              OptionProfilChip(
                iconPath: OptionProfileType.physical.imagePath,
                label: "$height/$weight",
              ),
              if (mbti != null)
                OptionProfilChip(
                  iconPath: OptionProfileType.mbti.imagePath,
                  label: "$mbti",
                ),
              if (zodiac != null)
                OptionProfilChip(
                  iconPath: OptionProfileType.zodiac.imagePath,
                  label: "$zodiac",
                ),
            ],
          ),
        ),
      ],
    );
  }
}
