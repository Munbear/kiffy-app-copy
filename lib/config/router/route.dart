import 'package:Kiffy/domain/explore/page/explore_page.dart';
import 'package:Kiffy/domain/my_page/page/my_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_complete_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_contact_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_image_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_intro_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_user_page.dart';
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
      initialLocation: "/explore",
    );
  },
);

CustomTransitionPage emptyTransitionPage(Widget child) => CustomTransitionPage(
    child: child,
    transitionDuration: const Duration(milliseconds: 0),
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        ));

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(ProviderRef<GoRouter> ref);

  List<RouteBase> get _routes => [
        GoRoute(
          path: "/test",
          name: "test",
          pageBuilder: (context, _) => emptyTransitionPage(TestPage()),
        ),
        GoRoute(
          path: "/mypage",
          name: "mypage",
          pageBuilder: (context, _) => emptyTransitionPage(MyPage()),
        ),
        GoRoute(
          path: "/explore",
          name: "explore",
          pageBuilder: (context, _) => emptyTransitionPage(ExplorePage()),
        ),
        GoRoute(
          path: "/match",
          name: "match",
          pageBuilder: (context, _) => emptyTransitionPage(TestPage()),
        ),
        GoRoute(
          path: "/sign",
          name: "sign",
          pageBuilder: (context, _) => emptyTransitionPage(SignPage()),
        ),
        GoRoute(
          path: "/profile/add_profile/user",
          name: "profile_add_profile_user",
          pageBuilder: (context, _) => emptyTransitionPage(AddProfileUserPage()),
        ),
        GoRoute(
          path: "/profile/add_profile/contact",
          name: "profile_add_profile_contact",
          pageBuilder: (context, _) => emptyTransitionPage(AddProfileContactPage()),
        ),
        GoRoute(
          path: "/profile/add_profile/intro",
          name: "profile_add_profile_intro",
          pageBuilder: (context, _) => emptyTransitionPage(AddProfileIntroPage()),
        ),
        GoRoute(
          path: "/profile/add_profile/image",
          name: "profile_add_profile_image",
          pageBuilder: (context, _) => emptyTransitionPage(AddProfileImagePage()),
        ),
        GoRoute(
          path: "/profile/add_profile/complete",
          name: "profile_add_profile_complete",
          pageBuilder: (context, _) => emptyTransitionPage(AddProfileCompletePage()),
        ),
      ];
}
