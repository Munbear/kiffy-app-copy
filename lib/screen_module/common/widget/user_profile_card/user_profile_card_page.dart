import 'package:Kiffy/domain/common/page_controller_button.dart';
import 'package:Kiffy/screen_module/common/widget/user_profile_card/user_profile_card_page_default.dart';
import 'package:Kiffy/screen_module/common/widget/user_profile_card/user_profile_card_page_intro.dart';
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
  int page = 0;
  int totalPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      totalPage = widget.userProfile.medias.length - 1;
    });
  }

  void movePage(int inc) {
    if (page > 0 && inc > 0) {
      // 다음페이지
      setState(() {
        page -= 1;
      });
    }
    if (page < totalPage - 1 && inc < 0) {
      // 이전페이지
      setState(() {
        page += 1;
      });
    }
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  List<Widget> UserProfilePageItems() {
    return widget.userProfile.medias.mapIndexed((index, media) {
      if (index == 0) {
        return UserProfileCardPageDefault(
          profileImageUrl: media.url,
          name: widget.userProfile.name,
          age: BirthDateUtil.getAge(widget.userProfile.birthDate),
        );
      }

      return UserProfileCardPageIntro(
        profileImageUrl: media.url,
        intro: widget.userProfile.intro,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            offset: const Offset(0, 5),
            blurRadius: 4,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: [...UserProfilePageItems()],
          ),
          PageControllerButton(
            prevButton: () {
              movePage(1);
            },
            nextButton: () {
              movePage(-1);
            },
          ),
        ],
      ),
    );
  }
}
