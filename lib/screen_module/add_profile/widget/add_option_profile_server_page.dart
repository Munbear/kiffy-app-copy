import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/common/button/widget/main_blue_button.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/common/provider/option_profile_tag_provider.dart';
import 'package:Kiffy/screen_module/add_profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/add_profile/section/add_option_profile_server_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class AddOptionProfileServerPage extends ConsumerWidget {
  final VoidCallback onTap;

  const AddOptionProfileServerPage({
    super.key,
    required this.onTap,
  });

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
            GestureDetector(
              onTap: () {
                // ref.read(profilePageController).jumpToPage(6);
                ref
                    .read(profileInputValidatorProvider)
                    .nextStep(currentPage: 5);
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  "Skipping",
                  textAlign: TextAlign.right,
                ),
              ),
            ),

            const Space(height: 16),

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

            /// 사용하는 언어 복수
            OptionProfileSeverForm(
              onTap: (id) {
                ref
                    .read(profileInputValidatorProvider)
                    .optionProfileMultiSelector(
                        ref.read(multiSelecteState), id);
              },
              title: "What language do you speak?",
              items: items.value![0],
              hasDivider: true,
              isMultiSelecte: true,
            ),

            // /// 찾는 관계 복수
            OptionProfileSeverForm(
              onTap: (id) {
                ref
                    .read(profileInputValidatorProvider)
                    .optionProfileMultiSelector(
                        ref.read(multiSelecteState), id);
              },
              title: "What kind of relationship are you looking for?",
              items: items.value![1],
              hasDivider: true,
              isMultiSelecte: true,
            ),

            /// 남에게 듣는 성격 단일
            OptionProfileSeverForm(
              onTap: (id) {
                ref
                    .read(singleSelecteState.notifier)
                    .update((state) => state = id);
              },
              title: "What kind of personality do you hear from others?",
              items: items.value![2],
              hasDivider: true,
              isMultiSelecte: false,
            ),

            // 좋아 하는 커피 복수
            OptionProfileSeverForm(
              onTap: (id) {
                ref
                    .read(profileInputValidatorProvider)
                    .optionProfileMultiSelector(
                        ref.read(multiSelecteState), id);
              },
              title: "What kind of coffee do you like?",
              items: items.value![3],
              hasDivider: false,
              isMultiSelecte: true,
            ),
            Gab.height24,

            MainBlueButton(
              onTap: () => onTap(),
              text: "Next",
            ),
            Gab.height24,
          ],
        ),
      ),
    );
  }
}
