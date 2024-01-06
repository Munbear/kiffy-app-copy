import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field_multiline.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/edit_profile/provider/modify_profile_input_provider.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/modify_profile_input_header.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/profile_intro_tips.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModifyProfileInputIntro extends ConsumerWidget {
  const ModifyProfileInputIntro({super.key});

  // 자기소개 추천 바텀 시트
  Future<void> introExampleBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      builder: (BuildContext lcontext) {
        return ProfileIntroTips();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ModifyProfileHeaderTitle(text: tr("text.profile.intro")),
            Spacer(),
            ProfileIntroTipsIcon(onTap: () => introExampleBottomSheet(context)),
          ],
        ),
        Space(height: 8),
        ModifyProfileInputIntroTextField(),
      ],
    );
  }
}

/// ***********************************
///            자기소개 입력
/// **********************************
class ModifyProfileInputIntroTextField extends ConsumerWidget {
  const ModifyProfileInputIntroTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KiffyTextFieldMultiline(
      textController: TextEditingController(
        text: ref.read(modifyProfileInputValueProvider).intro,
      ),
      onChanged: (t) =>
          ref.read(modifyProfileInputValueProvider.notifier).setIntro(t),
    );
  }
}
