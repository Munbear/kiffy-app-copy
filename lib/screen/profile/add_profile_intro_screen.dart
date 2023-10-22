import 'package:Kiffy/screen_module/profile/section/profile_input_intro_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProfileIntroScreen extends ConsumerStatefulWidget {
  static String get routeLocation => "/profile/add_profile/intro";
  static String get routeName => "profile_add_profile_intro";

  const AddProfileIntroScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddProfileIntroPageState();
}

class _AddProfileIntroPageState extends ConsumerState<AddProfileIntroScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: ProfileInputIntroSection(),
    );
  }
}
