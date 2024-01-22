import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page_controller_button.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page_default.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page_indicator.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page_intro.dart';
import 'package:Kiffy/util/BirthDateUtil.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class UserProfileCardPage extends StatefulWidget {
  final UserProfileView userProfile;
  final bool isMyScreen;

  const UserProfileCardPage({
    super.key,
    required this.userProfile,
    this.isMyScreen = false,
  });

  @override
  State<UserProfileCardPage> createState() => _UserProfileCardPageState();
}

class _UserProfileCardPageState extends State<UserProfileCardPage> {
  double page = 0;
  PageController pageController = PageController(initialPage: 0);
  late final ZodiacTypeEnumView? zodiac;
  late final MBTITypeEnumView? mbti;
  late final String? weight;
  late final String? height;
  late final List<String>? tags;
  late final List<ProfileTagViewTagTypesInner>? tagTypes;

  @override
  void initState() {
    zodiac = widget.userProfile.zodiac;
    mbti = widget.userProfile.mbti;
    weight = widget.userProfile.weight;
    height = widget.userProfile.height;
    tags = widget.userProfile.tags?.tagTypes
        .map((e) => e.tags)
        .map((e) => e?.map((e) => e.i18nKey))
        .expand((element) => element!)
        .toList();
    tagTypes = widget.userProfile.tags?.tagTypes.toList();

    super.initState();
  }

  @override
  void didUpdateWidget(_) {
    super.didUpdateWidget(_);
    pageController.jumpToPage(0);
    page = 0;
  }

  List<Widget> userProfilePageItems() {
    return [
      ...widget.userProfile.medias
          .mapIndexed(
            (index, media) => UserProfileCardPageDefault(
              profileImageUrl: media.url,
              name: widget.userProfile.name,
              age: BirthDateUtil.getAge(widget.userProfile.birthDate),
              zodiac: zodiac,
              mbti: mbti,
              weight: weight,
              height: height,
              tags: tags,
              tagTypes: tagTypes,
              isMyScreen: widget.isMyScreen,
            ),
          )
          .toList(),
      UserProfileCardPageIntro(
        profileImageUrl: widget.userProfile.medias.last.url,
        intro: widget.userProfile.intro,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var pageItems = [...userProfilePageItems()];

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: pageItems,
          ),

          // 프로그레스 바
          SizedBox(
            height: 30,
            child: Center(
              child: UserProfileCardPageIndicator(
                page: page,
                totalPage: pageItems.length,
              ),
            ),
          ),
          // 터치 영역
          PageControllerButton(
            prevButton: () async {
              await pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              setState(() {
                page = pageController.page ?? 0.0;
              });
            },
            nextButton: () async {
              await pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              setState(() {
                page = pageController.page ?? 0.0;
              });
            },
          ),
        ],
      ),
    );
  }
}
