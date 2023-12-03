import 'package:Kiffy/screen_module/main_screen_module/section/bottom_nav_bar_section.dart';
import 'package:Kiffy/screen_module/main_screen_module/section/main_screen_section.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static String get routeLocation => "/mainScreen";
  static String get routeName => "mainScreen";
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const MainScreenSection(),
      bottomNavigationBar: const MainScreenBottomNavBarSection(),
    );
  }
}
