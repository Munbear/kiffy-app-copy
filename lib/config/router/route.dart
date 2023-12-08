import 'package:Kiffy/screen/main_screen/main_screen.dart';
import 'package:Kiffy/screen/matching_detail/matched_detail_screen.dart';
import 'package:Kiffy/screen/my/my_screen.dart';
import 'package:Kiffy/screen/my/setting/withdraw_screen.dart';
import 'package:Kiffy/screen/my/setting_screen.dart';
import 'package:Kiffy/screen/profile/add_profile_complete_screen.dart';
import 'package:Kiffy/screen/profile/add_profile_screen.dart';
import 'package:Kiffy/screen/profile/modify_profile_screen.dart';
import 'package:Kiffy/screen/sign/init_screen.dart';
import 'package:Kiffy/screen/sign/sign_in_screen.dart';
import 'package:Kiffy/screen/wish/other_wish_user_detail_screen.dart';
import 'package:Kiffy/screen/wish/other_wish_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

final GlobalKey<NavigatorState> _rootNavKey = GlobalKey<NavigatorState>();

// 라우팅 변경
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: _rootNavKey,
      debugLogDiagnostics: true,
      routerNeglect: true,
      initialLocation: InitScreen.routeLoaction,
      routes: _routes,
    );
  },
);

List<RouteBase> get _routes => [
      // init screen
      GoRoute(
        path: InitScreen.routeLoaction,
        name: InitScreen.routeName,
        builder: (context, _) => const InitScreen(),
      ),
      // 회원 가입 및 로그인 페이지
      GoRoute(
        path: SignInScreen.routeLoaction,
        name: SignInScreen.routeName,
        builder: (context, _) => const SignInScreen(),
      ),
      // 유저 프로필 닉네임, 성별, 나이, 입력 페이지
      GoRoute(
        path: AddProfileScreen.routeLocation,
        name: AddProfileScreen.routeName,
        builder: (context, _) => const AddProfileScreen(),
      ),
      // 프로필 등록 완료 페이지
      GoRoute(
        path: AddProfileCompleteScreen.routeLocation,
        name: AddProfileCompleteScreen.routeName,
        builder: (context, _) => const AddProfileCompleteScreen(),
      ),
      // 회원 탈퇴 화면
      GoRoute(
        path: WithdrawalScreen.routeLocation,
        name: WithdrawalScreen.routeName,
        builder: (context, _) => const WithdrawalScreen(),
      ),
      // 설정 화면
      GoRoute(
        path: SettingScreen.routeLocation,
        name: SettingScreen.routeName,
        builder: (context, _) => const SettingScreen(),
      ),
      // 프로필 수정 화면
      GoRoute(
        path: ModifyScreen.routeLocation,
        name: ModifyScreen.routeName,
        builder: (context, _) => const ModifyScreen(),
      ),
      // 매칭 디테일 화면
      GoRoute(
        path: MatchedDetailScreen.routeLocation,
        name: MatchedDetailScreen.routeName,
        builder: (context, state) {
          MatchedUserView matchedUser = state.extra as MatchedUserView;
          return MatchedDetailScreen(matchedUser: matchedUser);
        },
      ),
      // 메인 화면
      GoRoute(
        path: MainScreen.routeLocation,
        name: MainScreen.routeName,
        builder: (context, _) => const MainScreen(),
      ),
      // 좋아요 보낸 사람 리스트
      GoRoute(
        path: OtherWishUserScreen.routeLocation,
        name: OtherWishUserScreen.routeName,
        builder: (context, _) => const OtherWishUserScreen(),
      ),
      // 위시 받은 유저 상세 화면
      GoRoute(
        path: OtherWishUserDetailScreen.routeLocation,
        name: OtherWishUserDetailScreen.routeName,
        builder: (context, state) => OtherWishUserDetailScreen(
          wishId: state.params["wishId"],
        ),
      ),
    ];
