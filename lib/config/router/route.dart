import 'package:Kiffy/domain/explore/page/explore_page.dart';
import 'package:Kiffy/domain/main_page/page/main_screen.dart';
import 'package:Kiffy/domain/my_page/page/my_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_complete_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_contact_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_image_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_intro_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_user_page.dart';
import 'package:Kiffy/domain/sign/page/sign_page.dart';
import 'package:Kiffy/domain/matching/page/matching_page.dart';
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
      initialLocation: "/mainPage",
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
        // GoRoute(
        //   path: "/test",
        //   name: "test",
        //   pageBuilder: (context, _) => emptyTransitionPage(TestPage()),
        // ),
        GoRoute(
          // 메인 페이지
          path: "/mainPage",
          name: "mainPage",
          pageBuilder: (context, _) => emptyTransitionPage(MainScreen()),
        ),
        GoRoute(
          // 마이페이지 탭
          path: "/mypage",
          name: "mypage",
          pageBuilder: (context, _) => emptyTransitionPage(MyPage()),
        ),
        GoRoute(
          // 탐색 탭
          path: "/explore",
          name: "explore",
          pageBuilder: (context, _) => emptyTransitionPage(ExplorePage()),
        ),
        GoRoute(
          // 매칭 탭
          path: "/match",
          name: "match",
          pageBuilder: (context, _) => emptyTransitionPage(const MatchingPage()),
        ),
        GoRoute(
          // 회원 가입 및 로그인 페이지
          path: "/sign",
          name: "sign",
          pageBuilder: (context, _) => emptyTransitionPage(SignPage()),
        ),
        GoRoute(
          // 유저 프로필 닉네입, 나이, 등록 페이지
          path: "/profile/add_profile/user",
          name: "profile_add_profile_user",
          pageBuilder: (context, _) => emptyTransitionPage(AddProfileUserPage()),
        ),
        GoRoute(
          // 프로필 연락처 추가 화면
          path: "/profile/add_profile/contact",
          name: "profile_add_profile_contact",
          pageBuilder: (context, _) => emptyTransitionPage(AddProfileContactPage()),
        ),
        GoRoute(
          // 프로필 등록 자기소개 페이지
          path: "/profile/add_profile/intro",
          name: "profile_add_profile_intro",
          pageBuilder: (context, _) => emptyTransitionPage(AddProfileIntroPage()),
        ),
        GoRoute(
          // 프로필 이미지 등록 페이지
          path: "/profile/add_profile/image",
          name: "profile_add_profile_image",
          pageBuilder: (context, _) => emptyTransitionPage(AddProfileImagePage()),
        ),
        GoRoute(
          // 프로필 등록 완료 페이지
          path: "/profile/add_profile/complete",
          name: "profile_add_profile_complete",
          pageBuilder: (context, _) => emptyTransitionPage(AddProfileCompletePage()),
        ),
      ];
}
