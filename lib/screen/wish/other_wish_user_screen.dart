import 'package:Kiffy/domain/common/custom_app_bar_image_title.dart';
import 'package:Kiffy/screen_module/wish/section/other_wish_user_profile_section.dart';
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
            SizedBox(
              height: 100,
              child: Center(
                child: Text("나에게 위시한 사용자들"),
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
