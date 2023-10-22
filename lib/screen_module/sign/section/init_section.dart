import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/explore/page/explore_page.dart';
import 'package:Kiffy/screen/profile/add_profile_user_screen.dart';
import 'package:Kiffy/screen/sign/sign_in_screen.dart';
import 'package:Kiffy/screen_module/common/provider/my_provider.dart';
import 'package:Kiffy/screen_module/sign/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class InitSection extends ConsumerStatefulWidget {
  const InitSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InitSectionState();
}

class _InitSectionState extends ConsumerState<InitSection> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  void init() async {
    var authStatus = await ref.read(authProvider).autoLogin();

    progress = 50;

    if (authStatus == AuthStatus.SUCCESS) {
      // 로그인 정보가 저장되어 있으면 탐색탭으로 바로 이동하고 내 정보를 초기화함
      await ref.read(myProvider).init();
      progress = 100;

      var userStatus = ref.read(myProvider).getStatus();
      switch (userStatus.status) {
        case UserStatusEnumView.JOINER:
          ref.read(routerProvider).replace(AddProfileUserScreen.routeLocation);
          break;
        case UserStatusEnumView.APPROVED:
          ref.read(routerProvider).replace(ExplorePage.routeLocation);
          break;
        default:
          break;
      }
    } else {
      progress = 100;
      ref.read(routerProvider).replace(SignInScreen.routeLoaction);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircularProgressIndicator(
            value: progress,
          )
        ],
      ),
    );
  }
}
