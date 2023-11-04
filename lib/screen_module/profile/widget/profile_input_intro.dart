import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field_multiline.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/widget/example_intro_tips_bottom_sheet.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInputIntro extends ConsumerWidget {
  final ValueChanged<String> onChanged;

  const ProfileInputIntro({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        introTitle(context),
        Space(height: 8),
        KiffyTextFieldMultiline(onChanged: (v) => onChanged(v)),
        Space(height: 2),
        validationText(ref),
      ],
    );
  }

  Widget validationText(WidgetRef ref) {
    return Align(
      alignment: Alignment.topLeft,
      child: ProfileInputValidationText(
        normalText: "* ${tr("text.profile.input_profile.intro")}",
        violatedText: "* ${tr("text.profile.input_profile.intro")}",
        check: () => true,
      ),
    );
  }

  // 자기소개 추천 바텀 시트
  Future<void> introExampleBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      builder: (BuildContext lcontext) {
        return ExampleIntroTipsBottomSheet();
      },
    );
  }

  Widget introTitle(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Text(
            tr("text.profile.intro"),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          const Text("(option)", style: TextStyle(fontSize: 14)),
          const Spacer(),
          SizedBox(
            width: 18,
            height: 18,
            child: GestureDetector(
              onTap: () => introExampleBottomSheet(context),
              child: Image.asset(
                "assets/icons/alert_icon.png",
                color: const Color(0xffcecece),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
