// import 'package:Kiffy/config/router/route.dart';
// import 'package:Kiffy/domain/core/widget/global_bottom_navigation_item.dart';
// import 'package:Kiffy/domain/explore/page/explore_page.dart';
// import 'package:Kiffy/domain/main_page/widget/bottom_tap_item.dart';
// import 'package:Kiffy/domain/matching/page/matching_page.dart';
// import 'package:Kiffy/domain/my_page/page/my_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../common/custom_bottom_nav_bar.dart';
// import '../../common/custom_bottom_navigation.dart';
// import '../../core/widget/global_bottom_navigation.dart';

// class MainScreen extends HookConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var curRoute = ref.watch(routerProvider);
//     var pageIndex = useState(0);

//     List<Widget> tapPageWidgets = <Widget>[
//       // 탐색 탭
//       ExplorePage(),
//       // 매칭 탭
//       MatchingPage(),
//       // 마이페이지
//       MyPage(),
//     ];

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         elevation: 0.5,
//         backgroundColor: Colors.white,
//         title: Image.asset(
//           width: 70,
//           height: 55,
//           "assets/images/kiffy_logo_purple.png",
//         ),
//       ),
//       body: tapPageWidgets.elementAt(pageIndex.value),
//       bottomNavigationBar: CustomBottomNavBar(),
//     );
//   }
// }
