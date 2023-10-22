import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/common/border._style.dart';
import 'package:Kiffy/domain/explore/page/explore_page.dart';
import 'package:Kiffy/screen_module/common/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/proifle_input_complete_welcome_box.dart';
import 'package:dartlin/control_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class ProfileInputCompleteSection extends ConsumerStatefulWidget {
  const ProfileInputCompleteSection({super.key});

  @override
  ConsumerState<ProfileInputCompleteSection> createState() => _ProfileInputCompleteSectionState();
}

class _ProfileInputCompleteSectionState extends ConsumerState<ProfileInputCompleteSection> {
  UserProfileView? myProfile;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        myProfile = ref.read(myProvider).getProfile();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: myProfile?.medias.first.url.let((it) =>
                ProfileInputCompleteWelcomeBox(boxImageUrl: it)
            ) ?? SizedBox(),
          ),
          // start button
          ElevatedButton(
            onPressed: () {
              ref.read(routerProvider).replace(ExplorePage.routeLocation);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              textStyle: const TextStyle(fontSize: 20, color: Colors.white),
              backgroundColor: const Color(0xFF0031AA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Start KIFFY !"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
