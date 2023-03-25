import 'dart:io';

import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_header.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_validation_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileIntroPage extends HookConsumerWidget {
  List<String> example = [
    "My MBTI is..",
    "My MBTI is..",
    "My MBTI is..",
    "My MBTI is..",
  ];

  // example bottom sheet
  exmapleBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      builder: (BuildContext lcontext) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // const SizedBox(height: 17),
              Center(
                child: Container(
                  height: 5,
                  width: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffcecece),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: example
                    .map(
                      (item) => Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xfff5f5f5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text(item)),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(color: Color(0xff0031AA))),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Okay",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff0031AA),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        );
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
            AddProfileHeader(),
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
            AddProfileInputValidationText(
              normalText: "* This will increase your matching probability.",
              validation: inputIntroValidation.value,
            ),
            const Spacer(),
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
