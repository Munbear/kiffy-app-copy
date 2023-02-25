import 'dart:developer';

import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/user_client.dart';

class MatchingPage extends HookConsumerWidget {
  const MatchingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      var res = getTest().then((value) {
        log("=========================");
        log(value.toString());
        log("=========================");
      });
    }, []);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              color: Colors.blueAccent,
              child: Stack(
                children: [
                  // Positioned(
                  //   bottom: 0,
                  //   left: 0,
                  //   right: 0,
                  //   child: GlobalBottomNavigation(),
                  // ),
                ],
              ),
            ),
            // 커스텀 바텀 네비게이션 바
            CustomBottomNavigationBar()
          ],
        ),
      ),
    );
  }
}
