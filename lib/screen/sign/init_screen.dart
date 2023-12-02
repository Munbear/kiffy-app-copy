import 'package:Kiffy/screen_module/sign/section/init_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitScreen extends ConsumerWidget {
  static String get routeLoaction => "/";
  static String get routeName => "init";

  const InitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: InitSection(),
    );
  }
}
