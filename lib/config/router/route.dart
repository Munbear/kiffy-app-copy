import 'package:Kiffy/domain/check_list/page/liked_list_page.dart';
import 'package:Kiffy/domain/explore/page/explore_page.dart';
import 'package:Kiffy/domain/main_page/page/main_screen.dart';
import 'package:Kiffy/domain/matching_detail/page/matching_detail_page.dart';
import 'package:Kiffy/domain/my_page/page/my_page.dart';
import 'package:Kiffy/domain/profile/page/add_profiile_auth_phone_number.dart';
import 'package:Kiffy/domain/profile/page/add_profile_complete_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_contact_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_image_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_input_auth_code_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_intro_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_user_page.dart';
import 'package:Kiffy/domain/setting_page/page/setting_page.dart';
import 'package:Kiffy/domain/sign/page/sign_page.dart';
import 'package:Kiffy/domain/matching/page/matching_page.dart';
import 'package:Kiffy/domain/unmatch_user_profile/page/unmatch_user_profile_page.dart';
import 'package:Kiffy/domain/withdraw/page/withdraw.dart';
import 'package:Kiffy/domain/withdraw/page/withdraw_fianl.dart';
import 'package:Kiffy/domain/withdraw/page/withdraw_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/reset_profile/reset_profile.dart';

// 라우팅 변경
final routerProvider = Provider<GoRouter>(
  (ref) {
    final router = RouterNotifier(ref);

    return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
      routes: router._routes,
      initialLocation: "/profile/add_profile/input_auth_code",
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
        //   // 메인 페이지
        //   path: "/mainPage",
        //   name: "mainPage",
        //   pageBuilder: (context, _) => emptyTransitionPage(MainScreen()),
        // ),
        GoRoute(
          // 마이페이지 탭
          path: "/mypage",
          name: "mypage",
          pageBuilder: (context, _) => emptyTransitionPage(MyPage()),
        ),
        GoRoute(
          // 설정 화면
          path: "/setting",
          name: "setting",
          pageBuilder: (context, _) => emptyTransitionPage(SettingPage()),
        ),
        GoRoute(
          // 프로필 수정
          path: "/resetProfile",
          name: "resetProfile",
          pageBuilder: (context, _) => emptyTransitionPage(const ResetProfile()),
        ),
        GoRoute(
          // 회원 탈퇴 화면
          path: "/withdraw",
          name: "withdraw",
          pageBuilder: (context, _) => emptyTransitionPage(WithdrawPage()),
        ),
        GoRoute(
          // 탐색 탭
          path: "/explore",
          name: "explore",
          pageBuilder: (context, _) => emptyTransitionPage(ExplorePage()),
        ),
        GoRoute(
          // 매칭 탭 화면
          path: "/matching",
          name: "matching",
          pageBuilder: (context, _) => emptyTransitionPage(MatchingPage()),
        ),
        GoRoute(
          // 매칭 디테일 화면
          path: "/matchingDetail",
          name: "matchingDetail",
          pageBuilder: (context, _) => emptyTransitionPage(const MatchingDetailPage()),
        ),
        GoRoute(
          // 좋아요 보낸 사람 리스트
          path: "/likedListPage",
          name: "likedListPage",
          pageBuilder: (context, _) => emptyTransitionPage(const LikedListPage()),
        ),
        GoRoute(
          // 좋아요 받은 유저 상세 프로필
          path: "/unmatchUserProfile",
          name: "unmatchUserProfile",
          pageBuilder: (context, _) => emptyTransitionPage(const UnmatchUserProfile()),
        ),
        GoRoute(
          // 회원 탈퇴 이유 텍스트
          path: "/withdrawText",
          name: "withdrawText",
          pageBuilder: (context, _) => emptyTransitionPage(const WithdrawText()),
        ),
        GoRoute(
          // 회원 탈퇴 최종
          path: "/withdrawFinal",
          name: "withdrawFinal",
          pageBuilder: (context, _) => emptyTransitionPage(const WithdrawFinal()),
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
        GoRoute(
          // 전화번호 입력 페이지
          path: "/profile/add_profile/auth_phone_number",
          name: "profile/add_profile/auth_phone_number",
          pageBuilder: (context, _) => emptyTransitionPage(const AddProfilePhoneNumberPage()),
        ),
        GoRoute(
          // 코드 입력 페이지
          path: "/profile/add_profile/input_auth_code",
          name: "profile/add_profile/input_auth_code",
          pageBuilder: (context, _) => emptyTransitionPage(const AddProfileInputAuthCodePage()),
        ),
      ];
}
