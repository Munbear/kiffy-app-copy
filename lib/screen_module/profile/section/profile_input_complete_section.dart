import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/screen/explore/explore_screen.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:Kiffy/screen_module/profile/widget/proifle_input_complete_welcome_box.dart';
import 'package:dartlin/control_flow.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class ProfileInputCompleteSection extends ConsumerStatefulWidget {
  const ProfileInputCompleteSection({super.key});

  @override
  ConsumerState<ProfileInputCompleteSection> createState() =>
      _ProfileInputCompleteSectionState();
}

class _ProfileInputCompleteSectionState
    extends ConsumerState<ProfileInputCompleteSection> {
  UserProfileView? myProfile;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(myProvider.notifier).init();
      setState(() {
        myProfile = ref.read(myProvider.notifier).getProfile();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (myProfile == null) {
      return CircularProgressIndicator();
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: myProfile?.medias.first.url.let(
                    (it) => ProfileInputCompleteWelcomeBox(boxImageUrl: it)) ??
                SizedBox(),
          ),
          // start button
          ProfileInputNextButton(
            text: tr("text.start_kiffy"),
            onPressed: () =>
                ref.read(routerProvider).replace(ExploreScreen.routeLocation),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
