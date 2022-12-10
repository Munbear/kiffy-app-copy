import 'package:Kiffy/view/helper_screen.dart';
import 'package:Kiffy/view/screens/home_screen.dart';
import 'package:Kiffy/view/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:Kiffy/view/screens/intro_screen.dart';
import 'package:Kiffy/view/screens/setting_profile_screen.dart';

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

  List<GoRoute> get _routes => [
        GoRoute(name: HelperScreen.routeName, path: HelperScreen.routeLocation, builder: (context, _) => const HelperScreen()),
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
          builder: (context, _) => const SettingProfileScreen(),
        ),
        GoRoute(
          name: HomeScreen.routeName,
          path: HomeScreen.routeLocation,
          builder: (context, _) => const HomeScreen(),
        ),
      ];
}
