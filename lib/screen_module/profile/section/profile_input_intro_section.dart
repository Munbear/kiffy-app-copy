import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile_header.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_text_field.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation_text.dart';
import 'package:Kiffy/screen_module/profile/widget/example_intro_tips_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInputIntroSection extends ConsumerStatefulWidget {
  const ProfileInputIntroSection({super.key});

  @override
  ConsumerState<ProfileInputIntroSection> createState() => _ProfileInputIntroSectionState();
}

class _ProfileInputIntroSectionState extends ConsumerState<ProfileInputIntroSection> {
  String inputIntro = "";
  AddProfileInputItemValidation inputIntroValidation = AddProfileInputItemValidation.success();

  // 자기소개 추천 바텀 시트
  IntroExampleBottomSheet(context) {
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

  // 제목
  Widget IntroTitle() {
    return Row(
      children: [
        const Text(
          "Introduce yourself",
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
            onTap: () => IntroExampleBottomSheet(context),
            child: Image.asset(
              "assets/icons/alert_icon.png",
              color: const Color(0xffcecece),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 해더 텍스트
          const AddProfileHeader(),

          // 타이틀
          IntroTitle(),
          const SizedBox(height: 16),

          // 자기소개 입력 폼
          ProfileInputTextField(
            onChanged: (text) {
              setState(() {
                inputIntro = text;
              });
            },
          ),
          const SizedBox(height: 8),

          // 유효성 안내 텍스트
          ProfileInputValidationText(
            normalText: "* This will increase your matching probability.",
            validation: inputIntroValidation,
          ),
          const Spacer(),

          // 다음 버튼
          ProfileInputNextButton(onPressed: () {
            inputIntroValidation = ref.read(profileInputProvider.notifier).setIntro(inputIntro);

            if (inputIntroValidation.isValid) {
              ref.read(profileInputProvider.notifier).updateIntro(inputIntro);
              ref.read(routerProvider).replace("/profile/add_profile/image");
            }
          }),
        ],
      ),
    );
  }
}
