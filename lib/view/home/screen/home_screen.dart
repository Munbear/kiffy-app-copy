import 'package:Kiffy/view/home/widget/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 변경 : provider 용 statefulWidget 변경
class HomeScreen extends HookConsumerWidget {
  static String get routeName => 'home';

  static String get routeLocation => '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Stack(
              children: [
                PageView(
                  controller: PageController(viewportFraction: 0.9),
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: UserProfileView(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: UserProfileView(),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(bottom: 50, right: 20),
                  child: SvgPicture.asset("assets/images/like_icon.svg"),
                )
              ],
            ),
          ),
          Container(
            color: Colors.red,
            child: SizedBox(
              height: 60,
              child: Container(
                color: Colors.purple,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
