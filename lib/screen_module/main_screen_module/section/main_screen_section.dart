import 'package:Kiffy/screen/explore/explore_screen.dart';
import 'package:Kiffy/screen/match/matching_screen.dart';
import 'package:Kiffy/screen/my/my_screen.dart';
import 'package:Kiffy/screen_module/main_screen_module/provider/main_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreenSection extends ConsumerStatefulWidget {
  const MainScreenSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainScreenSectionState();
}

class _MainScreenSectionState extends ConsumerState<MainScreenSection> {
  late final List<Widget> screens;
  final exploreNavigatorKey = GlobalKey<NavigatorState>();
  final matchingNavigatorKey = GlobalKey<NavigatorState>();
  final myScreenNavigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    screens = [
      // 탐색 탭
      Navigator(
        key: exploreNavigatorKey,
        pages: const [
          MaterialPage(child: ExploreScreen()),
        ],
        onPopPage: (route, result) {
          return true;
        },
      ),

      // 매칭 탭
      Navigator(
        key: matchingNavigatorKey,
        pages: const [
          MaterialPage(child: MatchingScreen()),
        ],
        onPopPage: (route, result) {
          return true;
        },
      ),

      // 마이 탭
      // MyScreen()
      Navigator(
        key: myScreenNavigatorKey,
        pages: const [
          MaterialPage(child: MyScreen()),
        ],
        onPopPage: (route, result) {
          return true;
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(mainPageController);
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: screens,
    );
  }
}
