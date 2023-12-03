import 'package:Kiffy/constant/main_tab_status.dart';
import 'package:Kiffy/screen_module/main_screen_module/provider/main_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreenSection extends ConsumerStatefulWidget {
  const MainScreenSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainScreenSectionState();
}

class _MainScreenSectionState extends ConsumerState<MainScreenSection> {
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();

    screens = [
      Container(width: 100, height: 100, color: Colors.red),
      Container(width: 100, height: 100, color: Colors.green),
      Container(width: 100, height: 100, color: Colors.blue),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final currentScreenIndex = ref.watch(mainScreenProviderV2);
    return IndexedStack(
      index: currentScreenIndex,
      children: screens,
    );
  }
}
