import 'package:Kiffy/constant/enum/main_tab_status.dart';
import 'package:Kiffy/screen_module/main_screen_module/provider/main_screen_provider.dart';
import 'package:Kiffy/screen_module/main_screen_module/widget/cutom_bottom_nav_bar.dart';
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
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: const Offset(0, 8),
          blurRadius: 8,
        ),
      ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: (index) {
            ref.read(mainPageController).jumpToPage(index);
            ref.read(currentPage.notifier).update((state) => state = index);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: MainTabStatus.values.map(
            (tab) {
              final currentPageIndex = ref.watch(currentPage);
              return BottomNavigationBarItem(
                icon: CustomBottomNavBar(
                  iconPath: tab.tabIcon,
                  isFocus: tab.index == currentPageIndex,
                ),
                label: tab.value,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
