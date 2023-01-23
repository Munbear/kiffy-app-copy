import 'package:Kiffy/domain/profile/page/add_profile_page.dart';
import 'package:Kiffy/domain/sign/page/sign_page.dart';
import 'package:Kiffy/domain/test/page/test_page.dart';
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
      initialLocation: "/profile/add_profile",
    );
  },
);

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
        GoRoute(
          path: "/sign",
          name: "sign",
          builder: (context, _) => SignPage(),
        ),
        GoRoute(
          path: "/profile/add_profile",
          name: "profile_add_profile",
          builder: (context, _) => AddProfilePage(),
        ),
      ];
}
