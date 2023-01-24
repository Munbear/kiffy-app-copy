// import 'package:Kiffy/global/service/geo_location.dart';
// import 'package:Kiffy/view/couter_screen.dart';
// import 'package:Kiffy/view/me/add_profile/screen/add_profile_user_page.dart';
// import 'package:Kiffy/view/test_provider.dart';
// import 'package:Kiffy/view/home/screen/home_screen.dart';
// import 'package:Kiffy/view/intro/screen/intro_screen.dart';
// import 'package:Kiffy/view/legacy_add_profile/screen/legacy_add_profile.dart';
// import 'package:Kiffy/view/sign/screen/sign_in_screen.dart';
import 'package:Kiffy/depreacted/global/service/geo_location.dart';
import 'package:Kiffy/depreacted/view/couter_screen.dart';
import 'package:Kiffy/depreacted/view/home/screen/home_screen.dart';
import 'package:Kiffy/depreacted/view/intro/screen/intro_screen.dart';
import 'package:Kiffy/depreacted/view/sign/screen/sign_in_screen.dart';
import 'package:Kiffy/depreacted/view/test_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'legacy_add_profile/screen/legacy_add_profile.dart';
import 'me/add_profile/screen/add_profile.dart';

class HelperScreen extends HookConsumerWidget {
  HelperScreen({super.key});

  List<String> pageRoutes = [
    CounterScreen.routeLocation,
    IntroScreen.routeLocation,
    HomeScreen.routeLocation,
    SignScreen.routeLocation,
    LegacyAddProfile.routeLocation,
    AddProfileScreen.routeLocation,
  ];

  static String get routeName => 'helper';

  static String get routeLocation => '/helper';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    var location = useGeoLocation();

    return Scaffold(
      backgroundColor: Color(0xf5f5f5ff),
      body: SafeArea(
          child: Column(
        children: [
          pageRoutes
              .map((pageRoute) => Row(
                    children: [
                      Column(
                        children: [ElevatedButton(onPressed: () => context.go(pageRoute), child: Text("Go to ${pageRoute}"))],
                      )
                    ],
                  ))
              .toList(),
          [
            Row(
              children: [
                Text("app.test.test".tr()),
                ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).increment(), child: Text("업")),
                Text("${counter}"),
                ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).decrement(), child: Text("다운")),
                ElevatedButton(
                    onPressed: () async {
                      print(location.value);
                    },
                    child: Text("위치가져오기"))
              ],
            ),
          ]
        ].expand((element) => element).toList(),
      )),
    );
  }
}
