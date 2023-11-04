import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar_image_title.dart';
import 'package:Kiffy/screen_module/wish/section/other_wish_user_detail_section.dart';
import 'package:flutter/material.dart';

class OtherWishUserDetailScreen extends StatelessWidget {
  static String get routeLocation => "/other-wish/wish/:wishId/detail";
  static String get routeName => "otherWishUserDetail";

  final String? wishId;

  const OtherWishUserDetailScreen({super.key, required this.wishId});

  @override
  Widget build(BuildContext context) {
    if (wishId == null) {
      return const Placeholder();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const CustomAppBarImageTitle(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: OtherWishUserDetailSection(
          wishId: wishId!,
        ),
      ),
    );
  }
}
