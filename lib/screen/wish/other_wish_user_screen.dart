import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar_image_title.dart';
import 'package:Kiffy/screen_module/common/google_admob/admob_banner_widget.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/wish/section/other_wish_user_profile_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherWishUserScreen extends ConsumerStatefulWidget {
  static String get routeLocation => "/likedListPage";
  static String get routeName => "likedListPage";
  const OtherWishUserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LikedListPageState();
}

class _LikedListPageState extends ConsumerState<OtherWishUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const CustomAppBarImageTitle(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Space(height: 8),
            const AdmobBannerWidget(),
            const Space(height: 8),
            SizedBox(
              height: 100,
              child: Center(
                child: Text(tr("text.wish.other_wishes")),
              ),
            ),
            Container(
              child: OtherWishUserProfileSection(),
            ),
          ],
        ),
      ),
    );
  }
}
