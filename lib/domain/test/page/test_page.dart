import 'dart:developer';

import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../infra/user_client.dart';

class TestPage extends HookConsumerWidget {
  TestPage({super.key});

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
        child: Container(
          color: Colors.blueAccent,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GlobalBottomNavigation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
