import 'package:Kiffy/global/layout/bottom_nav.dart';
import 'package:Kiffy/view/add_profile/screen/setting_profile_screen.dart';
import 'package:Kiffy/view/chat/screen/chat_screen.dart';
import 'package:Kiffy/view/couter_screen.dart';
import 'package:Kiffy/view/helper_screen.dart';
import 'package:Kiffy/view/home/screen/home_screen.dart';
import 'package:Kiffy/view/intro/screen/intro_screen.dart';
import 'package:Kiffy/view/mypage/screen/mypage_screen.dart';
import 'package:Kiffy/view/sign/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 라우팅 변경
final routerProvider = Provider<GoRouter>(
  (ref) {
    final router = RouterNotifier(ref);

    return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
      routes: router._routes,
      initialLocation: HelperScreen.routeLocation,
    );
  },
);

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(ProviderRef<GoRouter> ref);

  List<RouteBase> get _routes => [
        GoRoute(
          name: CounterScreen.routeName,
          path: CounterScreen.routeLocation,
          builder: (context, _) => CounterScreen(),
        ),
        GoRoute(
          name: HelperScreen.routeName,
          path: HelperScreen.routeLocation,
          builder: (context, _) => HelperScreen(),
        ),
        GoRoute(
          name: IntroScreen.routeName,
          path: IntroScreen.routeLocation,
          builder: (context, _) => const IntroScreen(),
        ),
        GoRoute(
          name: SignScreen.routeName,
          path: SignScreen.routeLocation,
          builder: (context, _) => const SignScreen(),
        ),
        GoRoute(
          name: SettingProfileScreen.routeName,
          path: SettingProfileScreen.routeLocation,
          builder: (context, _) => SettingProfileScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              body: child,
              bottomNavigationBar: KiffyBottomNavigationBar(),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              name: HomeScreen.routeName,
              path: HomeScreen.routeLocation,
              builder: (context, _) => const HomeScreen(),
            ),
            GoRoute(
              name: MyPageScreen.routeName,
              path: MyPageScreen.routeLocation,
              builder: (context, _) => MyPageScreen(),
            ),
            GoRoute(
              name: ChatScreen.routeName,
              path: ChatScreen.routeLocation,
              builder: (context, _) => ChatScreen(),
            ),
          ],
        )
      ];
}
