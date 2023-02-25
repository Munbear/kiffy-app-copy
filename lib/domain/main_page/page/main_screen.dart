import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/core/widget/global_bottom_navigation_item.dart';
import 'package:Kiffy/domain/explore/page/explore_page.dart';
import 'package:Kiffy/domain/main_page/widget/bottom_tap_item.dart';
import 'package:Kiffy/domain/matching/page/matching_page.dart';
import 'package:Kiffy/domain/my_page/page/my_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var curRoute = ref.watch(routerProvider);
    var pageIndex = useState(0);

    List<Widget> tapPageWidgets = <Widget>[
      ExplorePage(),
      const MatchingPage(),
      MyPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset("assets/images/kiffy_logo_purple.png", width: 70),
      ),
      body: tapPageWidgets.elementAt(pageIndex.value),
      // bottomNavigationBar: Container(
      //   height: 115,
      //   decoration: BoxDecoration(
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.14),
      //         blurRadius: 20,
      //         offset: const Offset(8, 0),
      //       ),
      //     ],
      //   ),
      //   child: ClipRRect(
      //     borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      //     child: BottomNavigationBar(
      //       currentIndex: pageIndex.value,
      //       onTap: (index) {
      //         pageIndex.value = index;
      //       },
      //       // backgroundColor: Colors.blue,
      //       showSelectedLabels: false,
      //       showUnselectedLabels: false,
      //       items: [
      //         BottomNavigationBarItem(
      //           icon: BottomTapItem(
      //             iconPath: "assets/icons/explore_icon.png",
      //             isFocus: pageIndex.value == 0,
      //           ),
      //           label: "explore",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: BottomTapItem(
      //             iconPath: "assets/icons/match_icon.png",
      //             isFocus: pageIndex.value == 1,
      //           ),
      //           label: "matching",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: BottomTapItem(
      //             iconPath: "assets/icons/mypage_icon.png",
      //             isFocus: pageIndex.value == 2,
      //           ),
      //           label: "myPages",
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
