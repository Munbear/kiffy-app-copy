import 'package:Kiffy/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(routes: <GoRoute>[
  GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) => HomeScreen())
]);
