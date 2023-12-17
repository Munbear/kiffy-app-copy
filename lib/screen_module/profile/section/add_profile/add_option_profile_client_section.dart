import 'package:Kiffy/constant/personality_type.dart';
import 'package:Kiffy/constant/zodiac_type.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/section/add_profile/add_option_profile_personnality.dart';
import 'package:Kiffy/screen_module/profile/section/add_profile/add_option_profile_mbti_section.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_option_profile_text_form.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/option_profile_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOptionProfileClientSection extends ConsumerStatefulWidget {
  const AddOptionProfileClientSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddOptionProfileClientPageState();
}

class _AddOptionProfileClientPageState
    extends ConsumerState<AddOptionProfileClientSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
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

            /// 남에게 듣는 성격
            Consumer(
              builder: (context, ref, child) {
                return OptionProfileSelector(
                  onTap: () {
                    print("hello");
                  },
                  title: "What kind of personality do you hear from others?",
                  itemList: Personality.values,
                  showDivider: true,
                );
              },
            ),
            // const AddOptionProfilePersonality(),

            /// 키 && 몸무게
            Consumer(
              builder: (context, ref, child) {
                return AddOptionProfileTextForm(
                  onChagedTall: (tall) {},
                  onChagedWeight: (weight) {},
                );
              },
            ),

            /// mbti
            const AddOptionProfileMbtiSection(),

            /// 별자리
            Consumer(
              builder: (context, ref, child) {
                return OptionProfileSelector(
                  onTap: () {
                    print("hello");
                  },
                  title: "What's your zodiac sign?",
                  itemList: Zodiac.values,
                  showDivider: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
