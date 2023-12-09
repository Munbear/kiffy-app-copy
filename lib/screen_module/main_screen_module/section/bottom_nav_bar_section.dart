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
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 20,
            offset: const Offset(8, 0),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          onTap: (a) {
            ref
                .read(currentScreenIndexProvider.notifier)
                .update((state) => state = a);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: MainTabStatus.values.map(
            (tab) {
              final currentTabIndex = ref.watch(currentScreenIndexProvider);
              return BottomNavigationBarItem(
                icon: CustomBottomNavBar(
                  iconPath: tab.tabIcon,
                  isFocus: tab.index == currentTabIndex,
                ),
                label: describeEnum(tab),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
