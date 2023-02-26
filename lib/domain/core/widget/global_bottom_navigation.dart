import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/core/widget/global_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GlobalNavigationPaths {
  String iconPath;
  String routePath;

  GlobalNavigationPaths({
    required this.iconPath,
    required this.routePath,
  });
}

class CustomBottomNavigationBar extends HookConsumerWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var curRoute = ref.watch(routerProvider);
    var items = useState([
      GlobalNavigationPaths(iconPath: "assets/icons/explore_icon.png", routePath: "/explore"),
      GlobalNavigationPaths(iconPath: "assets/icons/match_icon.png", routePath: "/matching"),
      GlobalNavigationPaths(iconPath: "assets/icons/mypage_icon.png", routePath: "/mypage"),
    ]);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 40, right: 40, top: 5, bottom: 25),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 5)]),
      child: Row(
        children: items.value
            .map(
              (paths) => GlobalBottomNavigationItem(
                props: GlobalBottomNavigationItemProps(iconPath: paths.iconPath, routePath: paths.routePath, curRoutePath: curRoute.location),
              ),
            )
            .toList(),
      ),
    );
  }
}
