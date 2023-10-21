

import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/explore/page/explore_page.dart';
import 'package:Kiffy/screen/sign/sign_in_screen.dart';
import 'package:Kiffy/screen_module/sign/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      ref.read(authProvider).autoLogin()
        .then((authStatus) {
          // 로그인 정보가 저장되어 있으면 탐색탭으로 바로 이동함
          progress = 100;
          if (authStatus == AuthStatus.SUCCESS) {
            ref.read(routerProvider).replace(ExplorePage.routeLocation);
          } else {
            ref.read(routerProvider).replace(SignInScreen.routeLoaction);
          }
        }
      );
    });
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