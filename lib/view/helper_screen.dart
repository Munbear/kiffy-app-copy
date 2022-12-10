import 'package:Kiffy/view/couter_screen.dart';
import 'package:Kiffy/view/service/providers/test_provider.dart';
import 'package:Kiffy/view/screens/home_screen.dart';
import 'package:Kiffy/view/screens/intro_screen.dart';
import 'package:Kiffy/view/screens/setting_profile_screen.dart';
import 'package:Kiffy/view/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class HelperScreen extends HookConsumerWidget {
  HelperScreen({super.key});

  List<String> pageRoutes = [
    CounterScreen.routeLocation,
    IntroScreen.routeLocation,
    HomeScreen.routeLocation,
    SignScreen.routeLocation,
    SettingProfileScreen.routeLocation
  ];

  static String get routeName => 'helper';
  static String get routeLocation => '/helper';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      backgroundColor: Color(0xf5f5f5ff),
      body: SafeArea(
          child: Column(
            children: [
              pageRoutes
                  .map((pageRoute) =>
                  Row(
                    children: [
                      Column(
                        children: [ElevatedButton(onPressed: () => context.go(pageRoute), child: Text(
                            "Go to ${pageRoute}"))
                        ],
                      )
                    ],
                  ))
                  .toList(),
              [
                Row(
                  children: [
                    ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).increment(), child: Text("업")),
                    Text("${counter}"),
                    ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).decrement(), child: Text("다운"))
                  ],
                )
              ]
            ].expand((element) => element).toList(),
          )),
    );
  }
}