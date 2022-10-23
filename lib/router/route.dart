import 'package:Kiffy/screens/home_screen.dart';
import 'package:Kiffy/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/intro_screen.dart';

// 라우팅 변경
final routerProvider = Provider<GoRouter>(
  (ref) {
    final router = RouterNotifier(ref);

    return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
      routes: router._routes,
      initialLocation: '/intro',
    );
  },
);

// 라우팅 변경
class RouterNotifier extends ChangeNotifier {
  RouterNotifier(ProviderRef<GoRouter> ref);

  List<GoRoute> get _routes => [
        GoRoute(
          name: 'intro',
          path: '/intro',
          builder: (context, _) => const IntroScreen(),
        ),
        GoRoute(
          name: 'sign',
          path: '/sign',
          builder: (context, _) => const SignScreen(),
        ),
        GoRoute(
          name: 'main',
          path: '/',
          builder: (context, _) => const HomeScreen(),
        ),
      ];
}
