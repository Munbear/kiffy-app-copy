import 'package:Kiffy/screen_module/sign/section/sign_in_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  static String get routeLoaction => "/sign";
  static String get routeName => "sign";

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SignInSection(),
    );
  }
}
