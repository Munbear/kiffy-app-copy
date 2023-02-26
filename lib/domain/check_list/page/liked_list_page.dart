import 'package:Kiffy/domain/common/custom_app_bar_image_title.dart';
import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikedListPage extends HookConsumerWidget {
  const LikedListPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const CustomAppBarImageTitle(),
      ),
      body: Column(
        children: [
          const Spacer(),
          const CustomBottomNavigationBar(),
        ],
      ),
    );
  }
}
