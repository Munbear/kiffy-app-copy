import 'dart:developer';

import 'package:Kiffy/domain/common/lock_bulr.dart';
import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:Kiffy/domain/explore/widget/explore_wished_list_item.dart';
import 'package:Kiffy/domain/explore/widget/explore_wished_list_more.dart';
import 'package:Kiffy/domain/matching/widget/matching_card.dart';
import 'package:Kiffy/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/user_client.dart';

class MatchingPage extends HookConsumerWidget {
  MatchingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect(() {
    //   var res = getTest().then((value) {
    //     log("=========================");
    //     log(value.toString());
    //     log("=========================");
    //   });
    // }, []);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Image.asset(
          width: 70,
          height: 55,
          "assets/images/kiffy_logo_purple.png",
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /**********************************************
                               liked preview 
              **********************************************/
            Stack(
              children: [
                SizedBox(
                  height: 94,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ExploreWishedListItem(),
                      ExploreWishedListItem(),
                      ExploreWishedListItem(),
                      ExploreWishedListItem(),
                      ExploreWishedListItem(),
                      ExploreWishedListMore(),
                    ],
                  ),
                ),

                // 유저 성별에 따라사 보여지는 텍스트가 달라짐
                LockBulr(mainText: "It's still being implemented.", subText: "It's still being implemented.")
              ],
            ),
            //***********************************
            //        매칭 된 리스트
            //***********************************/
            Padding(
              // padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              padding: EdgeInsets.only(left: 24, top: 12),
              child: Text(
                "Matches",
                style: TextStyle(
                  color: Color(0xff494949),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.612,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 6,
                  childAspectRatio: 0.75,
                  children: [
                    MatchingCard(),
                    MatchingCard(),
                    MatchingCard(),
                    MatchingCard(),
                    MatchingCard(),
                    MatchingCard(),
                  ],
                ),
              ),
            ),

            const Spacer(),
            // 커스텀 바텀 네비게이션 바
            const CustomBottomNavigationBar()
          ],
        ),
      ),
    );
  }
}
