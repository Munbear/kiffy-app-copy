import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/constant/zodiac_type.dart';
import 'package:Kiffy/screen_module/common/button/widget/main_blue_button.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/add_profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/screen_module/add_profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/add_profile/section/add_option_profile_mbti.dart';
import 'package:Kiffy/screen_module/add_profile/widget/add_option_profile_text_form.dart';
import 'package:Kiffy/screen_module/add_profile/widget/zodiac_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOptionProfileClientPage extends ConsumerStatefulWidget {
  final VoidCallback onTap;

  const AddOptionProfileClientPage({
    super.key,
    required this.onTap,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddOptionProfileClientPageState();
}

class _AddOptionProfileClientPageState
    extends ConsumerState<AddOptionProfileClientPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                ref.read(profileInputValidatorProvider).nextStep();
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "Skipping",
                  textAlign: TextAlign.right,
                ),
              ),
            ),

            const Space(height: 16),
            const Text(
              "Appeal yourself!",
              style: TextStyle(
                color: Color(0xff0031AA),
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "\nLet me introduce myself in more detail",
                    style: TextStyle(
                      color: Color(0xff494949),
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: "\n(Option)",
                    style: TextStyle(
                      color: Color(0xff0031AA),
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            const Space(height: 32),

            // const AddOptionProfilePersonality(),

            /// 키 && 몸무게
            AddOptionProfileTextForm(
              onChagedTall: (tall) {
                ref.read(profileInputValueProvider.notifier).setTall(tall);
              },
              onChagedWeight: (weight) {
                ref.read(profileInputValueProvider.notifier).setWeight(weight);
              },
            ),

            /// mbti
            const AddOptionProfileMbti(
              hasDivider: true,
            ),

            /// 별자리
            const ZodiacList(
              title: "What's your zodiac sign?",
              itemList: Zodiac.values,
              showDivider: false,
            ),
            Gab.height20,

            MainBlueButton(
              onTap: () => widget.onTap(),
              text: "Next",
            ),

            Gab.height24,
          ],
        ),
      ),
    );
  }
}
