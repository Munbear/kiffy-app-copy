import 'package:Kiffy/view/home/widget/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 변경 : provider 용 statefulWidget 변경
class HomeScreen extends HookConsumerWidget {
  static String get routeName => 'home';

  static String get routeLocation => '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: UserProfileView(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hello');
        },
        child: SvgPicture.asset(
          "assets/images/like_icon.svg",
          width: 59,
          height: 59,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
