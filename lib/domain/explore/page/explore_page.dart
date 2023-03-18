import 'dart:developer';

import 'package:Kiffy/domain/common/main_app_bar.dart';
import 'package:Kiffy/domain/common/preview_liked_list.dart';
import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:Kiffy/domain/explore/widget/explore_wished_list_item.dart';
import 'package:Kiffy/domain/explore/widget/explore_wished_list_more.dart';
import 'package:Kiffy/infra/user_client.dart';
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      clipBehavior: Clip.hardEdge,
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
                      child: Image.asset(
                        "assets/images/test_image.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Stack(
                      children: [
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.only(left: 25, bottom: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset("assets/svg/online_state_circle.svg"),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Kiffy",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white, fontSize: 35),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 24, top: 4),
                                  child: Text(
                                    "24, Jakarta",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                    onTap: () {
                                      print('left');
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                    onTap: () {
                                      print('right');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            margin: EdgeInsets.all(25),
                            child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2.0),
                              ),
                              child: IconButton(
                                padding: const EdgeInsets.only(top: 13),
                                onPressed: () {
                                  print('heart!');
                                },
                                icon: Image.asset(
                                  "assets/icons/heart_icon.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // 커스텀 바텀 네비게이션
            // CustomBottomNavigationBar()
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/explore"),
    );
  }
}
