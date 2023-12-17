// ignore_for_file: unused_element

import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/option_tag/option_profile_tag_provider.dart';
import 'package:Kiffy/screen_module/profile/section/add_profile/add_option_profile_coffee_section.dart';
import 'package:Kiffy/screen_module/profile/section/add_profile/add_option_profile_language_section.dart';
import 'package:Kiffy/screen_module/profile/section/add_profile/add_option_profile_relation_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOptionProfileServerPage extends ConsumerWidget {
  const AddOptionProfileServerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _AddOptionProfileServerPageInit(
      child: SingleChildScrollView(
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

              /// 찾는 관계 section
              const AddOptionProfileRelationSection(),

              /// 사용하는 언어 section
              const AddOptionProfileLanguageSection(),

              /// 좋아 하는 커피 section
              const AddOptionProfileCoffeeSection()
            ],
          ),
        ),
      ),
    );
  }
}

class _AddOptionProfileServerPageInit extends ConsumerWidget {
  final Widget child;
  const _AddOptionProfileServerPageInit({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(optionProfileTagProvider);
    return child;
  }
}
