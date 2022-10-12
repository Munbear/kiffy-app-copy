import 'package:Kiffy/view/home_screen.dart';
import 'package:Kiffy/view/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 라우팅 변경
final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: router,
    routes: router._routes,
  );
});

// 라우팅 변경
class RouterNotifier extends ChangeNotifier {
  RouterNotifier(ProviderRef<GoRouter> ref);

  List<GoRoute> get _routes => [
        GoRoute(
          name: 'main',
          path: '/',
          builder: (context, _) => HomeScreen(),
        ),
        GoRoute(
          name: 'sign',
          path: '/sign',
          builder: (context, _) => SignScreen(),
        ),
      ];
}


// 기존 라우팅 
// final GoRouter routes = GoRouter(routes: <GoRoute>[
//   GoRoute(
//     path: "/",
//     builder: (BuildContext context, GoRouterState state) => HomeScreen(),
//   ),
//   GoRoute(
//     path: "/sign",
//     builder: (BuildContext context, GoRouterState state) => SignScreen(),
//   )
// ]);
