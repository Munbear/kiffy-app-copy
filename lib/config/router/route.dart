import 'package:Kiffy/domain/check_list/page/liked_list_page.dart';
import 'package:Kiffy/domain/my_page/page/my_page.dart';
import 'package:Kiffy/domain/setting_page/page/setting_page.dart';
import 'package:Kiffy/domain/withdraw/page/withdraw.dart';
import 'package:Kiffy/domain/withdraw/page/withdraw_fianl.dart';
import 'package:Kiffy/domain/withdraw/page/withdraw_text.dart';
import 'package:Kiffy/screen/explore/explore_screen.dart';
import 'package:Kiffy/screen/profile/add_profile_complete_screen.dart';
import 'package:Kiffy/screen/profile/add_profile_contact_screen.dart';
import 'package:Kiffy/screen/profile/add_profile_image_screen.dart';
import 'package:Kiffy/screen/profile/add_profile_intro_screen.dart';
import 'package:Kiffy/screen/profile/add_profile_user_screen.dart';
import 'package:Kiffy/screen/sign/init_screen.dart';
import 'package:Kiffy/screen/sign/sign_in_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/reset_profile/reset_profile.dart';

// 라우팅 변경
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      debugLogDiagnostics: true,
      routerNeglect: true,
      routes: _routes,
      initialLocation: InitScreen.routeLoaction,
    );
  },
);

List<RouteBase> get _routes => [
      GoRoute(
          path: InitScreen.routeLoaction,
          name: InitScreen.routeName,
          builder: (context, _) => const InitScreen()),
      GoRoute(
        // 마이페이지 탭
        path: MyPage.routeLocation,
        name: MyPage.routeName,
        builder: (context, _) => const MyPage(),
      ),
      GoRoute(
        // 설정 화면
        path: SettingPage.routeLocation,
        name: SettingPage.routeName,
        builder: (context, _) => const SettingPage(),
      ),
      GoRoute(
        // 프로필 수정
        path: ResetProfile.routeLocation,
        name: ResetProfile.routeNmae,
        builder: (context, _) => const ResetProfile(),
      ),
      GoRoute(
        // 회원 탈퇴 화면
        path: WithdrawPage.routeLocation,
        name: WithdrawPage.routeName,
        builder: (context, _) => const WithdrawPage(),
      ),
      GoRoute(
        // 탐색 탭
        path: ExploreScreen.routeLocation,
        name: ExploreScreen.routeName,
        builder: (context, _) => const ExploreScreen(),
      ),
      // GoRoute(
      //   // 매칭 탭 화면
      //   path: MatchingPage.routeLocation,
      //   name: MatchingPage.routeName,
      //   builder: (context, _) => const MatchingPage(),
      // ),
      // GoRoute(
      //   // 매칭 디테일 화면
      //   path: MatchingDetailPage.routeLocation,
      //   name: MatchingDetailPage.routeName,
      //   builder: (context, state) => const MatchingDetailPage(),
      // ),
      GoRoute(
        // 좋아요 보낸 사람 리스트
        path: LikedListPage.routeLocation,
        name: LikedListPage.routeName,
        builder: (context, _) => const LikedListPage(),
      ),
      // GoRoute(
      //   // 좋아요 받은 유저 상세 프로필
      //   path: UnMatchUserProfile.routeLocation,
      //   name: UnMatchUserProfile.routeName,
      //   builder: (context, state) {
      //     return UnMatchUserProfile(
      //       userName: state.queryParams["userName"] ?? "",
      //       userAge: state.queryParams["userAge"] ?? "",
      //       userId: state.queryParams["userId"] ?? "",
      //       userIntro: state.queryParams["userIntro"] ?? "",
      //     );
      //   },
      // ),
      GoRoute(
        // 회원 탈퇴 이유 텍스트
        path: WithdrawText.routeLocation,
        name: WithdrawText.routeName,
        builder: (context, _) => const WithdrawText(),
      ),
      GoRoute(
        // 회원 탈퇴 최종
        path: WithdrawFinal.routeLocation,
        name: WithdrawFinal.routeName,
        builder: (context, _) => const WithdrawFinal(),
      ),
      GoRoute(
        // 회원 가입 및 로그인 페이지
        path: SignInScreen.routeLoaction,
        name: SignInScreen.routeName,
        builder: (context, _) => const SignInScreen(),
      ),
      GoRoute(
        // 유저 프로필 닉네임, 성별, 나이, 입력 페이지
        path: AddProfileUserScreen.routeLocation,
        name: AddProfileUserScreen.routeName,
        builder: (context, _) => const AddProfileUserScreen(),
      ),
      GoRoute(
        // 프로필 연락처 추가 화면
        path: AddProfileContactScreen.routeLocation,
        name: AddProfileContactScreen.routeName,
        builder: (context, _) => const AddProfileContactScreen(),
      ),
      GoRoute(
        // 프로필 등록 자기소개 페이지
        path: AddProfileIntroScreen.routeLocation,
        name: AddProfileIntroScreen.routeName,
        builder: (context, _) => const AddProfileIntroScreen(),
      ),
      GoRoute(
        // 프로필 이미지 등록 페이지
        path: AddProfileImageScreen.routeLocation,
        name: AddProfileImageScreen.routeName,
        builder: (context, _) => const AddProfileImageScreen(),
      ),
      GoRoute(
        // 프로필 등록 완료 페이지
        path: AddProfileCompleteScreen.routeLocation,
        name: AddProfileCompleteScreen.routeName,
        builder: (context, _) => const AddProfileCompleteScreen(),
      ),
    ];
