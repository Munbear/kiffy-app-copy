// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../main_page/widget/bottom_tap_item.dart';

// class CustomBottomNavigationBar extends HookConsumerWidget {
//   const CustomBottomNavigationBar({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       height: 115,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.14),
//             blurRadius: 20,
//             offset: const Offset(8, 0),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
//         child: BottomNavigationBar(
//           currentIndex: pageIndex.value,
//           onTap: (index) {
//             pageIndex.value = index;
//           },
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           items: [
//             BottomNavigationBarItem(
//               icon: BottomTapItem(
//                 iconPath: "assets/icons/explore_icon.png",
//                 isFocus: pageIndex.value == 0,
//               ),
//               label: "explore",
//             ),
//             BottomNavigationBarItem(
//               icon: BottomTapItem(
//                 iconPath: "assets/icons/match_icon.png",
//                 isFocus: pageIndex.value == 1,
//               ),
//               label: "matching",
//             ),
//             BottomNavigationBarItem(
//               icon: BottomTapItem(
//                 iconPath: "assets/icons/mypage_icon.png",
//                 isFocus: pageIndex.value == 2,
//               ),
//               label: "myPages",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
