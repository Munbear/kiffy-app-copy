import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/explore/page/explore_page.dart';
import 'package:Kiffy/domain/profile/page/add_profile_user_page.dart';
import 'package:Kiffy/screen_module/common/provider/my_provider.dart';
import 'package:Kiffy/screen_module/sign/provider/auth_provider.dart';
import 'package:Kiffy/screen_module/sign/widget/google_sgin_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class SignInSection extends ConsumerStatefulWidget {
  const SignInSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInSectionState();
}

class _SignInSectionState extends ConsumerState<SignInSection> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
  }

  void googleLoginAndRoute() async {
    var authStatus = await ref.read(authProvider).googleLogin();

    // 구글 로그인에 성공하면 내 정보를 가져와서 초기화하고 탐색 탭으로 이동

    if (authStatus != AuthStatus.SUCCESS) {
      return;
    }
    await ref.read(myProvider).init();

    var userStatus = ref.read(myProvider).getStatus();
    switch (userStatus.status) {
      case UserStatusEnumView.JOINER:
        ref.read(routerProvider).replace(AddProfileUserPage.routeLocation);
        break;
      case UserStatusEnumView.APPROVED:
        ref.read(routerProvider).replace(ExplorePage.routeLocation);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext cntext) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/kiffy_logo_purple.png", width: 150),
          // 구글 아이콘
          GoogleSignInButton(
            onSgin: () => googleLoginAndRoute(),
          )
        ],
      ),
    );
  }
}
