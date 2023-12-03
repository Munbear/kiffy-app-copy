import 'package:Kiffy/screen/explore/explore_screen.dart';
import 'package:Kiffy/screen/main_screen/main_screen.dart';
import 'package:Kiffy/screen/match/matching_screen.dart';
import 'package:Kiffy/screen/matching_detail/matched_detail_screen.dart';
import 'package:Kiffy/screen/modify/modify_screen.dart';
import 'package:Kiffy/screen/my/my_screen.dart';
import 'package:Kiffy/screen/my/setting/withdraw_screen.dart';
import 'package:Kiffy/screen/my/setting_screen.dart';
import 'package:Kiffy/screen/profile/add_profile_complete_screen.dart';
import 'package:Kiffy/screen/profile/add_profile_screen.dart';
import 'package:Kiffy/screen/sign/init_screen.dart';
import 'package:Kiffy/screen/sign/sign_in_screen.dart';
import 'package:Kiffy/screen/wish/other_wish_user_detail_screen.dart';
import 'package:Kiffy/screen/wish/other_wish_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> exploreNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> matchNavKey = GlobalKey<NavigatorState>();

// 라우팅 변경
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: rootNavKey,
      debugLogDiagnostics: true,
      routerNeglect: true,
      initialLocation: InitScreen.routeLoaction,
      routes: _routes,
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
        path: MyScreen.routeLocation,
        name: MyScreen.routeName,
        builder: (context, _) => const MyScreen(),
      ),
      GoRoute(
        // 설정 화면K
        path: SettingScreen.routeLocation,
        name: SettingScreen.routeName,
        builder: (context, _) => const SettingScreen(),
      ),
      GoRoute(
        // 프로필 수정
        path: ModifyScreen.routeLocation,
        name: ModifyScreen.routeName,
        builder: (context, _) => const ModifyScreen(),
      ),
      GoRoute(
        // 회원 탈퇴 화면
        path: WithdrawalScreen.routeLocation,
        name: WithdrawalScreen.routeName,
        builder: (context, _) => const WithdrawalScreen(),
      ),
      GoRoute(
        // 회원 탈퇴 화면
        path: MainScreen.routeLocation,
        name: MainScreen.routeName,
        builder: (context, _) => const MainScreen(),
      ),
      // GoRoute(
      //   // 탐색 탭
      //   path: ExploreScreen.routeLocation,
      //   name: ExploreScreen.routeName,
      //   builder: (context, _) => const ExploreScreen(),
      // ),
      ShellRoute(
        navigatorKey: exploreNavKey,
        routes: [
          GoRoute(
            // 탐색 탭
            path: ExploreScreen.routeLocation,
            name: ExploreScreen.routeName,
            builder: (context, _) => const ExploreScreen(),
          ),
          // TODO
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
        ],
      ),
      ShellRoute(
        navigatorKey: matchNavKey,
        routes: [
          GoRoute(
            // 매칭 탭 화면
            path: MatchingScreen.routeLocation,
            name: MatchingScreen.routeName,
            builder: (context, _) => const MatchingScreen(),
          ),
          GoRoute(
            // 매칭 디테일 화면
            path: MatchedDetailScreen.routeLocation,
            name: MatchedDetailScreen.routeName,
            builder: (context, state) {
              MatchedUserView matchedUser = state.extra as MatchedUserView;
              return MatchedDetailScreen(matchedUser: matchedUser);
            },
          ),
        ],
      ),
      GoRoute(
        // 좋아요 보낸 사람 리스트
        path: OtherWishUserScreen.routeLocation,
        name: OtherWishUserScreen.routeName,
        builder: (context, _) => const OtherWishUserScreen(),
      ),
      GoRoute(
        path: OtherWishUserDetailScreen.routeLocation,
        name: OtherWishUserDetailScreen.routeName,
        builder: (context, state) => OtherWishUserDetailScreen(
          wishId: state.params["wishId"],
        ),
      ),
      GoRoute(
        // 회원 가입 및 로그인 페이지
        path: SignInScreen.routeLoaction,
        name: SignInScreen.routeName,
        builder: (context, _) => const SignInScreen(),
      ),
      GoRoute(
        // 유저 프로필 닉네임, 성별, 나이, 입력 페이지
        path: AddProfileScreen.routeLocation,
        name: AddProfileScreen.routeName,
        builder: (context, _) => const AddProfileScreen(),
      ),
      GoRoute(
        // 프로필 등록 완료 페이지
        path: AddProfileCompleteScreen.routeLocation,
        name: AddProfileCompleteScreen.routeName,
        builder: (context, _) => const AddProfileCompleteScreen(),
      ),
    ];
