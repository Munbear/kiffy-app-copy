import 'package:flutter/material.dart';

import 'package:Kiffy/enums/gender_type.dart';

import '../widgets/common/confirm_button.dart';
import '../widgets/photo_wrap.dart';

class SettingProfileScreen extends StatefulWidget {
  const SettingProfileScreen({super.key});

  @override
  State<SettingProfileScreen> createState() => _SettingProfileScreenState();
}

class _SettingProfileScreenState extends State<SettingProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          child: Column(
            children: [
              Form(
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Visibility(
                          visible: true,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffbcbcbc)),
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            maxLines: 10,
                            maxLength: 300,
                          ),
                        ),
                        // 사진 선택
                        Visibility(
                          visible: false,
                          child: Wrap(
                            children: [
                              PhotoWrap(),
                              PhotoWrap(),
                              PhotoWrap(),
                              PhotoWrap(),
                              PhotoWrap(),
                              PhotoWrap(),
                            ],
                          ),
                        ),

                        // 생년월일
                        Visibility(
                          visible: false,
                          child: TextFormField(),
                        ),
                        // 닉네임
                        Visibility(
                          visible: true,
                          child: TextFormField(),
                        ),
                        // 성별 선택
                        Visibility(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: GenderType.values.map(
                                (item) {
                                  return Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black, width: 0.5),
                                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                                        ),
                                        child: Center(child: Text(item.gender))),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const ConfirmButton(text: "다음"),
            ],
          ),
        ),
      ),
    );
  }
}
