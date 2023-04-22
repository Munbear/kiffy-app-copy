import 'dart:developer';

import 'package:Kiffy/domain/common/main_app_bar.dart';
import 'package:Kiffy/domain/common/preview_liked_list.dart';
import 'package:Kiffy/domain/common/user_profile_card.dart';
import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:Kiffy/domain/explore/widget/explore_wished_list_item.dart';
import 'package:Kiffy/domain/explore/widget/explore_wished_list_more.dart';
import 'package:Kiffy/infra/explore_client.dart';
import 'package:Kiffy/infra/user_client.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/custom_app_bar_image_title.dart';
import '../../common/custom_bottom_nav_bar.dart';

class ExplorePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect(() {
    //   var res = getTest().then((value) {
    //     log("=========================");
    //     log("호출호출호출");
    //     // log(value.toString());
    //     log("=========================");
    //   });
    // }, []);

    final userProfiles = useState<List<UserProfileView>>([]);
    final hasNext = useState<bool>(false);
    final next = useState<String?>(null);

    getApiAndSetState() async {
      final response = await getExploreUserProfiles();
      print(response.list);
      userProfiles.value = [... response.list];
    }

    useEffect(() {
      getApiAndSetState();
    }, []);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Image.asset(
          width: 70,
          height: 55,
          "assets/images/kiffy_logo_purple.png",
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            /******************************************
             *         좋아요 보낸 유저 리스트 
             * *************************************** */
            PreviewLikedList(),

            /**************************************
             *        유저 프로필 카드  
             * *********************************** */
            userProfiles.value.isNotEmpty ? UserProfileCard(userProfile: userProfiles.value[0]) : SizedBox(),
            // 커스텀 바텀 네비게이션
            // CustomBottomNavigationBar()
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/explore"),
    );
  }
}
