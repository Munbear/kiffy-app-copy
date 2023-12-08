import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field_multiline.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_intro_tips.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProfileInputIntro extends ConsumerWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController? textController;

  const AddProfileInputIntro({
    super.key,
    required this.onChanged,
    this.textController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        introTitle(context),
        const Space(height: 8),
        KiffyTextFieldMultiline(
          onChanged: (v) => onChanged(v),
          textController: textController,
        ),
        const Space(height: 2),
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
        return ProfileIntroTips();
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
