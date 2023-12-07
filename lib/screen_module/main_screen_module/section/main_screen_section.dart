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
      ),

      // 매칭 탭
      const MatchingScreen(),

      // 마이 탭
      Navigator(
        key: myScreenNavigatorKey,
        pages: const [
          MaterialPage(child: MyScreen()),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final currentScreenIndex = ref.watch(mainScreenProvider);
    return IndexedStack(
      index: currentScreenIndex,
      children: screens,
    );
  }
}
