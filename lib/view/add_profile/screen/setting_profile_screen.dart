import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/confirm_button.dart';
import '../widget/introduce_text_form.dart';
import '../widget/selected_gender.dart';
import '../widget/selected_photos.dart';
import '../widget/setting_birth.dart';
import '../widget/setting_nick_name.dart';

class SettingProfileScreen extends HookConsumerWidget {
  static String get routeName => 'setting';
  static String get routeLocation => '/setting';

  const SettingProfileScreen({super.key});

  void upDateGuideText(ValueNotifier currentNumber, ValueNotifier title, ValueNotifier guideText) {
    //이름
    if (currentNumber.value == 0) title.value = "name";

    // 생년월일
    if (currentNumber.value == 1) title.value = "ultah";
    if (currentNumber.value == 1) guideText.value = "Masukkan tanggal lahir Anda.";

    // 성별
    if (currentNumber.value == 2) title.value = "jenis kelamin";
    if (currentNumber.value == 2) guideText.value = "Silakan pilih jenis kelamin.";

    // 사진
    // if (currentNumber == 3) title = "사진을 등록해 주세요";
    // 자기소개
    // if (currentNumber == 4) title = "자기소개를 작성해 주세요";
  }

  void showNextStep(ValueNotifier currentNumber, ValueNotifier isShowedNickname, ValueNotifier isShowedBirth, ValueNotifier isShowedGender) {
    // 닉네임
    if (currentNumber.value == 0) isShowedNickname.value = !isShowedNickname.value;
    // 생년월일
    if (currentNumber.value == 1) isShowedBirth.value = !isShowedBirth.value;
    // 성별
    if (currentNumber.value == 2) isShowedGender.value = !isShowedGender.value;
    // if (currentNumber == 3) isOpacityPhoto = !isOpacityPhoto;
    // if (currentNumber == 4) isOpacityIntroduce = !isOpacityIntroduce;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentNumber = useState<int>(0);
    var title = useState<String>("name");
    var guideText = useState<String>("Dengan nama yang diatur di profil KIFFY, Tidak dapat diubah setelah ini.");
    var isShowedNickname = useState(false);
    var isShowedBirth = useState(false);
    var isShowedGender = useState(false);
    var isShowedIntroduce = useState(false);
    var isShowedPhoto = useState(false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 51, vertical: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        title.value,
                        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        guideText.value,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              Form(
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    child: Column(
                      children: [
                        // // 자기소개
                        // IntroduceTextForm(isOpacity: isOpacityIntroduce),

                        // // 사진 선택
                        // SelectedPhotos(isOpacity: isOpacityPhoto),

                        // 성별 선택 :: 테스트
                        SelectedGender(isShowed: isShowedGender.value),

                        // 생년월일
                        AddBirthTextForm(hinText: "Birth day", labelText: "Birth day", isShowed: isShowedBirth.value),

                        // 닉네임 기본으로 보여줌
                        const SettingNickName(hinText: "NickName", labelText: "NickName"),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  currentNumber.value++;
                  showNextStep(currentNumber, isShowedNickname, isShowedBirth, isShowedGender);
                  upDateGuideText(currentNumber, title, guideText);
                },
                child: const ConfirmButton(text: "확인"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 51, vertical: 20),
  //         child: Column(
  //           children: [
  //             Container(
  //               decoration: BoxDecoration(border: Border.all(color: Colors.red)),
  //               height: 100,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Center(
  //                     child: Text(
  //                       title,
  //                       style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 16),
  //                   Center(
  //                     child: Text(
  //                       guideText,
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(height: 70),
  //             Form(
  //               child: Expanded(
  //                 child: Container(
  //                   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
  //                   child: Column(
  //                     children: [
  //                       // // 자기소개
  //                       // IntroduceTextForm(isOpacity: isOpacityIntroduce),

  //                       // // 사진 선택
  //                       // SelectedPhotos(isOpacity: isOpacityPhoto),

  //                       // 성별 선택 :: 테스트
  //                       SelectedGender(isShowed: isShowedGender),

  //                       // 생년월일
  //                       AddBirthTextForm(hinText: "Birth day", labelText: "Birth day", isShowed: isShowedBirth),

  //                       // 닉네임 기본으로 보여줌
  //                       const SettingNickName(hinText: "NickName", labelText: "NickName"),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             InkWell(
  //               onTap: () {
  //                 setState(() {
  //                   currentNumber++;
  //                   showNextStep();
  //                   upDateGuideText();
  //                 });
  //               },
  //               child: const ConfirmButton(text: "확인"),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
