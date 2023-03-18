// import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
// import 'package:Kiffy/domain/main_page/widget/bottom_tap_item.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

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

// class CustomBottomNavBarItem extends HookConsumerWidget {
//   GlobalBottomNavigationItemProps props;

//   CustomBottomNavBarItem({
//     super.key,
//     required this.props,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var isActive = props.curRoutePath == props.routePath;
//     return BottomNavigationBarItem(
//         icon: BottomTapItem(
//       iconPath: props.iconPath,
//     ));
//   }
// }
