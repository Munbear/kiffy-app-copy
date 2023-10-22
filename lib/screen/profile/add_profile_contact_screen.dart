import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/common/border._style.dart';
import 'package:Kiffy/domain/core/enum/contact_type.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile_header.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProfileContactPage extends ConsumerStatefulWidget {
  static String get routeLocation => "/profile/add_profile/contact";
  static String get routeName => "profile_add_profile_contact";
  const AddProfileContactPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddProfileContactPageState();
}

class _AddProfileContactPageState extends ConsumerState<AddProfileContactPage> {
  AddProfileInputItemValidation inputContactValidation =
      AddProfileInputItemValidation.success();

  String inputContactId = "";
  ContactType? inputContactType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // header //
            const AddProfileHeader(),

            const Text(
              "Messenger for KIFFY",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),

            // sns 선택
            Row(
              children: ContactType.values.map((contactApp) {
                return GestureDetector(
                  onTap: () {
                    inputContactType = contactApp;
                    setState(() {});
                  },
                  child: Container(
                    height: 55,
                    width: 55,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: contactApp == inputContactType
                        ? BorderGradientCircleShape.outlineGradientBoxDecoration
                        : null,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BorderGradientCircleShape.innerDecoration,
                      child: Stack(
                        children: [
                          // icon Image
                          ContactType.contactAppIcon(contactApp),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: inputContactType == contactApp
                                  ? null
                                  : Colors.white.withOpacity(0.7),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            const Text(
              "ID for contact",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),

            // 아이디 입력 폼
            TextFormField(
              onChanged: (t) => inputContactId = t,
              style: const TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
              decoration: const InputDecoration(
                  hintText: "Please enter it.",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffcecece), width: 2.0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff0031AA), width: 3.0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  contentPadding: EdgeInsets.all(18)),
            ),
            const SizedBox(height: 8),

            // 유호성 안내 텍스
            ProfileInputValidationText(
              normalText: "* When a match is made, it’s shown to the woman.",
              validation: inputContactValidation,
            ),
            const Spacer(),

            // 다음 버튼
            ElevatedButton(
              onPressed: () {
                inputContactValidation =
                    ref.read(profileInputProvider.notifier).setContact(
                          inputContactId,
                          inputContactType,
                        );
                setState(() {});

                if (inputContactValidation.isValid) {
                  ref
                      .read(profileInputProvider.notifier)
                      .updateContact(inputContactId, inputContactType);
                  ref
                      .read(routerProvider)
                      .replace("/profile/add_profile/intro");
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
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
