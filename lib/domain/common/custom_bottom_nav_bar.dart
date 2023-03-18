import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/router/route.dart';
import '../main_page/widget/bottom_tap_item.dart';
import 'custom_bottom_nav_bar_item.dart';

// 아이콘 및 라우트path
class GlobalNavigationPaths {
  String iconPath;
  String routePath;
  String curRoutePath;

  GlobalNavigationPaths({
    required this.iconPath,
    required this.routePath,
    required this.curRoutePath,
  });
}

// class GlobalBottomNavigationItemProps {
//   String iconPath;
//   String routePath;
//   String curRoutePath;

//   GlobalBottomNavigationItemProps({
//     required this.iconPath,
//     required this.routePath,
//     required this.curRoutePath,
//   });
// }

class CustomBottomNavBar extends HookConsumerWidget {
  final String currentPath;

  const CustomBottomNavBar({
    super.key,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var curRoute = ref.watch(routerProvider);

    var items = useState([
      GlobalNavigationPaths(
        iconPath: "assets/icons/explore_icon.png",
        routePath: "/explore",
        curRoutePath: curRoute.location,
      ),
      GlobalNavigationPaths(
        iconPath: "assets/icons/match_icon.png",
        routePath: "/matching",
        curRoutePath: curRoute.location,
      ),
      GlobalNavigationPaths(
        iconPath: "assets/icons/mypage_icon.png",
        routePath: "/mypage",
        curRoutePath: curRoute.location,
      ),
    ]);

    return Container(
      height: 115,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 20,
            offset: const Offset(8, 0),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: items.value.map((path) {
            return BottomNavigationBarItem(
              icon: BottomTapItem(
                iconPath: path.iconPath,
                isFocus: path.routePath == currentPath,
                // isFocus: items.value.contains(currentPage),
                onRouting: () => ref.read(routerProvider).replace(path.routePath),
              ),
              label: "test",
            );
          }).toList(),
        ),
      ),
    );
  }
}
