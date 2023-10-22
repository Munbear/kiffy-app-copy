import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/core/enum/contact_type.dart';
import 'package:Kiffy/screen_module/common/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile_header.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_sns_button.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_text_form_field.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInputContactSection extends ConsumerStatefulWidget {
  const ProfileInputContactSection({super.key});

  @override
  ConsumerState<ProfileInputContactSection> createState() => _ProfileInputContactSectionState();
}

class _ProfileInputContactSectionState extends ConsumerState<ProfileInputContactSection> {
  AddProfileInputItemValidation inputContactValidation = AddProfileInputItemValidation.success();

  String inputContactId = "";
  ContactType? inputContactType;

  Widget ContactTypeTitle() {
    return const Text(
      "Messenger for KIFFY",
      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
    );
  }

  Widget ContactIdTitle() {
    return const Text(
      "ID for contact",
      style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // header
          const AddProfileHeader(),

          ContactTypeTitle(),
          const Space(height: 10),

          // sns 선택
          ProfileInputSnsButton(
            onChanged: (contactType) => setState(() {
              inputContactType = contactType;
            }),
            selectedContactType: inputContactType,
          ),
          const Space(height: 30),

          ContactIdTitle(),
          const Space(height: 10),

          // 아이디 입력 폼
          ProfileInputTextFormField(
            onChanged: (t) => setState(() {
              inputContactId = t;
            }),
            hintText: "Please enter it.",
          ),
          const Space(height: 8),

          // 유호성 안내 텍스
          ProfileInputValidationText(
            normalText: "* When a match is made, it’s shown to the woman.",
            validation: inputContactValidation,
          ),
          const Spacer(),

          // 다음 버튼
          ProfileInputNextButton(
            onPressed: () {
              inputContactValidation = ref.read(profileInputProvider.notifier).setContact(
                    inputContactId,
                    inputContactType,
                  );
              setState(() {});

              if (inputContactValidation.isValid) {
                ref.read(profileInputProvider.notifier).updateContact(inputContactId, inputContactType);
                ref.read(routerProvider).replace("/profile/add_profile/intro");
              }
            },
          ),
        ],
      ),
    );
  }
}
