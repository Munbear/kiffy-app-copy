import 'dart:io';

import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_header.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_validation_text.dart';
import 'package:Kiffy/domain/profile/widget/example_intro_tips_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileIntroPage extends HookConsumerWidget {
  const AddProfileIntroPage({super.key});

  // example bottom sheet
  exmapleBottomSheet(context) {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var inputIntro = useState("");
    var inputIntroValidation = useState(AddProfileInputItemValidation.success());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 해더 텍스트
            AddProfileHeader(),

            // 타이틀
            Row(
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
                    onTap: () => exmapleBottomSheet(context),
                    child: Image.asset(
                      "assets/icons/alert_icon.png",
                      color: const Color(0xffcecece),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 자기소개 입력 폼
            TextField(
              onChanged: (t) => inputIntro.value = t,
              minLines: 5,
              maxLines: 5,
              style: const TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
              decoration: const InputDecoration(
                  hintText: "Please enter it.",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcecece), width: 2.0),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff0031AA), width: 3.0),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                  ),
                  contentPadding: EdgeInsets.all(18)),
            ),
            const SizedBox(height: 8),

            // 유효성 안내 텍스트
            AddProfileInputValidationText(
              normalText: "* This will increase your matching probability.",
              validation: inputIntroValidation.value,
            ),
            const Spacer(),

            // 다음 버튼
            ElevatedButton(
              onPressed: () {
                inputIntroValidation.value = ref.read(addProfileInputProvider.notifier).setIntro(inputIntro.value);

                if (inputIntroValidation.value.isValid) {
                  ref.read(routerProvider).replace("/profile/add_profile/image");
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                backgroundColor: const Color(0xFF0031AA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
