import 'dart:developer';

import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:Kiffy/domain/explore/widget/explore_wished_list_item.dart';
import 'package:Kiffy/domain/explore/widget/explore_wished_list_more.dart';
import 'package:Kiffy/infra/user_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExplorePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              /**********************************************
               *                  Logo
               **********************************************/
              Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/kiffy_logo_purple.png",
                  width: 50,
                ),
              ),
              Container(
                height: 100,
                child: ListView(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
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
                              offset: Offset(0, 5),
                              blurRadius: 4,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          "assets/images/example_for_dev.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25, bottom: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kiffy",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white, fontSize: 35),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
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
                      ),
                    ],
                  ),
                ),
              ),
              GlobalBottomNavigation()
            ],
          ),
        ),
      ),
    );
  }
}
