import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/view/chat/screen/chat_screen.dart';
import 'package:Kiffy/view/home/screen/home_screen.dart';
import 'package:Kiffy/view/mypage/screen/mypage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bottom_nav_icon.dart';

class KiffyBottomNavigationItem {
  late final Icon icon;
  late final String name;
  late final String routeLocation;

  KiffyBottomNavigationItem({required this.icon, required this.name, required this.routeLocation});
}

class KiffyBottomNavigationBar extends HookConsumerWidget {
  KiffyBottomNavigationBar({super.key});

  final barItems = [
    KiffyBottomNavigationItem(
      icon: const Icon(KiffyBottomNavigationIcon.bottom_nav_home_icon),
      routeLocation: HomeScreen.routeLocation,
      name: 'explore',
    ),
    KiffyBottomNavigationItem(
      icon: const Icon(KiffyBottomNavigationIcon.bottom_nav_chat_icon),
      routeLocation: ChatScreen.routeLocation,
      name: 'chat',
    ),
    KiffyBottomNavigationItem(
      icon: const Icon(KiffyBottomNavigationIcon.bottom_nav_mypage_icon),
      name: "mypage",
      routeLocation: MyPageScreen.routeLocation,
    )
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var route = ref.watch(routerProvider);
    var currentIndex = useState(0);

    return BottomNavigationBar(
      onTap: (int index) {
        currentIndex.value = index;
        ref.read(routerProvider).replace(barItems[index].routeLocation);
      },
      currentIndex: currentIndex.value,
      items: barItems.map((item) => BottomNavigationBarItem(icon: item.icon, label: item.name)).toList(),
    );
  }
}
