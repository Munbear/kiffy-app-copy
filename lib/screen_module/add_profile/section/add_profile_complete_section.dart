import 'package:Kiffy/screen/main_screen/main_screen.dart';
import 'package:Kiffy/screen_module/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/profile_input_next_button.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/proifle_input_complete_welcome_box.dart';
import 'package:dartlin/control_flow.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

class AddProfileCompleteSection extends ConsumerStatefulWidget {
  const AddProfileCompleteSection({super.key});

  @override
  ConsumerState<AddProfileCompleteSection> createState() =>
      _ProfileInputCompleteSectionState();
}

class _ProfileInputCompleteSectionState
    extends ConsumerState<AddProfileCompleteSection> {
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
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: myProfile?.medias.first.url.let(
                    (it) => ProfileInputCompleteWelcomeBox(boxImageUrl: it)) ??
                const SizedBox(),
          ),
          // start button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ProfileInputNextButton(
              text: tr("text.start_kiffy"),
              onPressed: () => context.replaceNamed(MainScreen.routeName),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
