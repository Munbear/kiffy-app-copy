import 'package:Kiffy/config/router/route.dart';

import 'package:Kiffy/domain/core/model/gender_type.dart';
import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_header.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_validation_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileUserPage extends HookConsumerWidget {
  AddProfileUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(addProfileInputProvider);

    var inputName = useState("");
    var inputNameValidation = useState(AddProfileInputItemValidation.success());

    var inputGender = useState<Gender?>(null);
    var inputGenderValidation = useState(AddProfileInputItemValidation.success());

    var inputBirthDay = useState("");
    var inputBirthdayValidation = useState(AddProfileInputItemValidation.success());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 헤더 텍스트
              AddProfileHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 닉네임 입력
                      const Text("Nickname", style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 8),
                      TextFormField(
                        onChanged: (t) => inputName.value = t,
                        style: const TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
                        decoration: const InputDecoration(
                          hintText: "Please enter it.",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffcecece), width: 2.0),
                            borderRadius:
                                BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0031AA), width: 3.0),
                            borderRadius:
                                BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                          ),
                          contentPadding: EdgeInsets.all(18),
                        ),
                      ),
                      const SizedBox(height: 8),
                      AddProfileInputValidationText(
                        normalText: "* It cannot be changed",
                        validation: inputNameValidation.value,
                      ),
                      const SizedBox(height: 40),

                      // 성별 선택
                      const Text("Gender", style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 8),
                      Row(
                        children: Gender.values.map(
                          (gender) {
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    print(gender);
                                    inputGender.value = gender;
                                  },
                                  label: Text(
                                    Gender.genderToString(gender),
                                    style: TextStyle(
                                      color: inputGender.value == gender ? const Color(0xFF0031AA) : const Color(0xff494949),
                                    ),
                                  ),
                                  icon: Image.asset(
                                    "assets/icons/man_icon.png",
                                    width: 18,
                                    color: inputGender.value == gender ? const Color(0xFF0031AA) : const Color(0xff494949),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    shadowColor: const Color(0x00000000),
                                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                                    backgroundColor: Colors.white,
                                    foregroundColor: const Color(0xff494949),
                                    textStyle: const TextStyle(fontSize: 18),
                                    side: BorderSide(
                                      color: inputGender.value == gender ? const Color(0xFF0031AA) : const Color(0xffDCDCDC),
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),

                      const SizedBox(height: 8),
                      AddProfileInputValidationText(
                        normalText: "* It cannot be changed",
                        validation: inputGenderValidation.value,
                      ),
                      const SizedBox(height: 40),

                      // 생년월일 입력
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text("Birthday", style: TextStyle(fontSize: 20)),
                          SizedBox(width: 4),
                          Text("example : 20010305", style: TextStyle(fontSize: 12, color: Color(0xff6c6c6c))),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (t) => inputBirthDay.value = t,
                        style: const TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
                        decoration: const InputDecoration(
                            hintText: "YYYY/MM/DD",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffcecece), width: 2.0),
                              borderRadius:
                                  BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0031AA), width: 3.0),
                              borderRadius:
                                  BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                            ),
                            contentPadding: EdgeInsets.all(18)),
                      ),
                      const SizedBox(height: 8),
                      AddProfileInputValidationText(
                        normalText: "* It cannot be changed",
                        validation: inputBirthdayValidation.value,
                      ),
                    ],
                  ),
                ),
              ),

              // submit 버튼
              ElevatedButton(
                onPressed: () {
                  inputNameValidation.value = ref.read(addProfileInputProvider.notifier).setName(inputName.value);
                  inputGenderValidation.value = ref.read(addProfileInputProvider.notifier).setGender(inputGender.value);
                  inputBirthdayValidation.value = ref.read(addProfileInputProvider.notifier).setBirthDate(inputBirthDay.value);

                  if (inputNameValidation.value.isValid && inputGenderValidation.value.isValid && inputBirthdayValidation.value.isValid) {
                    ref.read(routerProvider).replace("/profile/add_profile/contact");
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
      ),
    );
  }
}
