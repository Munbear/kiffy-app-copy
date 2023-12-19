import 'package:Kiffy/screen_module/common/button/widget/main_blue_button.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/option_tag/option_profile_tag_provider.dart';
import 'package:Kiffy/screen_module/profile/section/add_profile/add_option_profile_relation_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOptionProfileServerPage extends ConsumerWidget {
  const AddOptionProfileServerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(optionProfileTagProvider);
    if (items.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (items.hasError) {
      return const Text("Oops something wrong");
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// header text
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

            /// 사용하는 언어
            OptionProfileSeverForm(
              title: "What language do you speak?",
              items: items.value![0],
              hasDivider: true,
            ),

            /// 찾는 관계
            OptionProfileSeverForm(
              // onTap: () {},
              title: "What kind of relationship are you looking for?",
              items: items.value![1],
              hasDivider: true,
            ),

            /// 남에게 듣는 성격
            OptionProfileSeverForm(
              // onTap: () {},
              title: "What kind of personality do you hear from others?",
              items: items.value![2],
              hasDivider: true,
            ),

            // 좋아 하는 커피
            OptionProfileSeverForm(
              // onTap: () {},
              title: "What kind of coffee do you like?",
              items: items.value![3],
              hasDivider: false,
            ),
            const Space(height: 24),

            MainBlueButton(
              onClick: () {},
              text: "Next",
            ),
            const Space(height: 24),
          ],
        ),
      ),
    );
  }
}
