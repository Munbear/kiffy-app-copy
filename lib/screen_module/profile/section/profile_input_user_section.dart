import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/core/enum/gender_type.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_gender_button.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_text_form_field.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInputUserSection extends ConsumerStatefulWidget {
  const ProfileInputUserSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileInputUserSectionState();
}

class _ProfileInputUserSectionState extends ConsumerState<ProfileInputUserSection> {
  // 유저 닉네임
  String inputName = "";
  AddProfileInputItemValidation inputNameValidation = AddProfileInputItemValidation.success();

  // 유저 성별
  Gender? inputGender;
  AddProfileInputItemValidation inputGenderValidation = AddProfileInputItemValidation.success();

  // 유저 생년월일
  String inputBirthDay = "";
  AddProfileInputItemValidation inputBirthdayValidation = AddProfileInputItemValidation.success();

  @override
  Widget build(BuildContext context) {
    ref.watch(profileInputProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Nickname", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 8),
          // 닉네임 입력
          ProfileInputTextFormField(
            onChanged: (t) => setState(() {
              inputName = t;
            }),
            hintText: "Please enter it.",
          ),
          const SizedBox(height: 8),
          ProfileInputValidationText(
            normalText: "* It cannot be changed",
            validation: inputNameValidation,
          ),
          const SizedBox(height: 40),

          // 성별 선택
          const Text("Gender", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 8),
          ProfileInputGenderButton(
            onChanged: (gender) {
              setState(() {
                inputGender = gender;
              });
            },
            selectedGender: inputGender,
          ),

          const SizedBox(height: 8),
          ProfileInputValidationText(
            normalText: "* It cannot be changed",
            validation: inputGenderValidation,
          ),
          const SizedBox(height: 40),

          // 생년월일 입력
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Birthday", style: TextStyle(fontSize: 20)),
              SizedBox(width: 4),
              Text("example : 20010305", style: TextStyle(fontSize: 12, color: Color(0xff6c6c6c))),
            ],
          ),
          const SizedBox(height: 8),
          ProfileInputTextFormField(
            onChanged: (t) => setState(() {
              inputBirthDay = t;
            }),
            hintText: "YYYYMMDD",
          ),
          const SizedBox(height: 8),
          ProfileInputValidationText(
            normalText: "* It cannot be changed",
            validation: inputBirthdayValidation,
          ),
          const SizedBox(height: 20),

          ProfileInputNextButton(
            onPressed: () {
              setState(() {
                inputNameValidation = ref.read(profileInputProvider.notifier).setName(inputName);
                inputGenderValidation = ref.read(profileInputProvider.notifier).setGender(inputGender);
                inputBirthdayValidation = ref.read(profileInputProvider.notifier).setBirthDate(inputBirthDay);
              });

              if (inputNameValidation.isValid && inputGenderValidation.isValid && inputBirthdayValidation.isValid) {
                ref.read(profileInputProvider.notifier).updateName(inputName);
                ref.read(profileInputProvider.notifier).updateGender(inputGender);
                ref.read(profileInputProvider.notifier).updateBirthdDate(inputBirthDay);
                ref.read(routerProvider).replace("/profile/add_profile/contact");
              }
            },
          ),
        ],
      ),
    );
  }
}