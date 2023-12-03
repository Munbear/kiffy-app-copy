import 'package:Kiffy/constant/main_tab_status.dart';
import 'package:Kiffy/screen_module/main_screen_module/provider/main_screen_provider.dart';
import 'package:Kiffy/screen_module/main_screen_module/widget/cutom_bottom_nav_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreenBottomNavBarSection extends ConsumerStatefulWidget {
  const MainScreenBottomNavBarSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainScreenBottomNavBarSectionState();
}

class _MainScreenBottomNavBarSectionState
    extends ConsumerState<MainScreenBottomNavBarSection> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (a) {
        ref.read(mainScreenProviderV2.notifier).update((state) => state = a);
        print("@@@@@@");
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: MainTabStatus.values.map((tab) {
        return BottomNavigationBarItem(
          icon: CustomBottomNavBAr(
            iconPath: tab.tabIcon,
          ),
          label: describeEnum(tab),
        );
      }).toList(),
    );
  }
}
