import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/modify/provider/modify_profile_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModiftyIntroSection extends ConsumerStatefulWidget {
  const ModiftyIntroSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ModiftyIntroSectionState();
}

class _ModiftyIntroSectionState extends ConsumerState<ModiftyIntroSection> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    textController.text = ref.read(myProvider).getProfile().intro;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: ProfileInputIntro(
        onChanged: (intro) {
          ref
              .read(editUserIntroProfile.notifier)
              .update((state) => state = intro);
        },
        textController: textController,
      ),
    );
  }
}
