import 'package:Kiffy/domain/test/page/test_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 라우팅 변경
final routerProvider = Provider<GoRouter>(
  (ref) {
    final router = RouterNotifier(ref);

    return GoRouter(
        debugLogDiagnostics: true, refreshListenable: router, routes: router._routes, initialLocation: "/test");
  },
);

// GoRoute(
// name: IntroScreen.routeName,
// path: IntroScreen.routeLocation,
// builder: (context, _) => const IntroScreen(),
// ),

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(ProviderRef<GoRouter> ref);

  List<RouteBase> get _routes => [
        GoRoute(
          path: "/test",
          name: "test",
          builder: (context, _) => TestPage(),
        ),
        GoRoute(
          path: "/mypage",
          name: "mypage",
          builder: (context, _) => TestPage(),
        ),
        GoRoute(
          path: "/explore",
          name: "explore",
          builder: (context, _) => TestPage(),
        ),
        GoRoute(
          path: "/match",
          name: "match",
          builder: (context, _) => TestPage(),
        ),
      ];
}
