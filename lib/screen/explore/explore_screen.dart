import 'package:Kiffy/screen_module/common/bottom_nav/widget/bottom_nav_bar.dart';
import 'package:Kiffy/screen_module/common/other_wish_user/section/other_wish_preview_section.dart';
import 'package:Kiffy/screen_module/explore/section/explore_user_card_section.dart';
import 'package:Kiffy/screen_module/explore/section/test_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ExploreScreen extends StatelessWidget {
  static String get routeName => "explore";
  static String get routeLocation => "/explore";

  const ExploreScreen({super.key});

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Image.asset(
          width: 70,
          height: 55,
          "assets/images/kiffy_logo_purple.png",
        ),
      ),
      body: FutureBuilder<void>(
          future: _initGoogleMobileAds(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            return const SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // 나에게 위시 보낸 유저 리스트
                  OtherWishPreviewSection(),
                  // 탐색할 유저 카드
                  ExploreUserProfileCardSection(),

                  ///
                  TestBannerWidget()
                ],
              ),
            );
          }),
      bottomNavigationBar: CustomBottomNavBar(
        currentPath: ExploreScreen.routeLocation,
      ),
    );
  }
}
