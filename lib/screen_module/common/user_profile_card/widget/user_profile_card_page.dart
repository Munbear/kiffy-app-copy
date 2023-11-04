import 'package:Kiffy/domain/common/page_controller_button.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page_default.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page_indicator.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page_intro.dart';
import 'package:Kiffy/util/BirthDateUtil.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class UserProfileCardPage extends StatefulWidget {
  final UserProfileView userProfile;

  const UserProfileCardPage({super.key, required this.userProfile});

  @override
  State<UserProfileCardPage> createState() => _UserProfileCardPageState();
}

class _UserProfileCardPageState extends State<UserProfileCardPage> {
  double page = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(_) {
    super.didUpdateWidget(_);
    pageController.jumpToPage(0);
    page = 0;
  }

  List<Widget> UserProfilePageItems() {
    return [
      ...widget.userProfile.medias
          .mapIndexed((index, media) => UserProfileCardPageDefault(
                profileImageUrl: media.url,
                name: widget.userProfile.name,
                age: BirthDateUtil.getAge(widget.userProfile.birthDate),
              ))
          .toList(),
      UserProfileCardPageIntro(
        profileImageUrl: widget.userProfile.medias.last.url,
        intro: widget.userProfile.intro,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var pageItems = [...UserProfilePageItems()];

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            offset: const Offset(0, 3),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: pageItems,
          ),
          SizedBox(
            height: 30,
            child: Center(
              child: UserProfileCardPageIndicator(
                page: page,
                totalPage: pageItems.length,
              ),
            ),
          ),
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
