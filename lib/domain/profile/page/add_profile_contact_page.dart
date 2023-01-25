import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/core/model/ContactType.dart';
import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_header.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_validation_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileContactPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var inputContactValidation = useState(AddProfileInputItemValidation.success());

    var inputContactId = useState("");
    var inputContactType = useState<ContactType?>(null);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                /**********************************************
                 *                  Header
                 **********************************************/
                AddProfileHeader(),
                /**********************************************
                 *             Input Contact
                 **********************************************/
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Align(
                              child: Text(
                                "ID for contact",
                                style: TextStyle(fontSize: 20),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 13, bottom: 7),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      onChanged: (t) => inputContactId.value = t,
                                      style: const TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
                                      decoration: const InputDecoration(
                                          hintText: "Please enter it.",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xffcecece), width: 2.0),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff0031AA), width: 3.0),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                                          ),
                                          contentPadding: EdgeInsets.all(18)),
                                    ),
                                  ),
                                  Container(
                                    height: 55,
                                    width: 55,
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: inputContactType.value == ContactType.LINE
                                          ? const GradientBoxBorder(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment(-0.94, 1.8),
                                                colors: [
                                                  Color(0xffBA00FF),
                                                  Color(0xffB003FA),
                                                  Color(0xff960AEE),
                                                  Color(0xff6A15DB),
                                                  Color(0xff2F25BF),
                                                  Color(0xff0031AA),
                                                ],
                                              ),
                                            )
                                          : null,
                                    ),
                                    child: IconButton(
                                      padding: const EdgeInsets.all(5),
                                      onPressed: () => inputContactType.value = ContactType.LINE,
                                      icon: Image.asset(
                                        "assets/icons/line_icon.png",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 55,
                                    width: 55,
                                    margin: const EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: inputContactType.value == ContactType.WHATSAPP
                                          ? const GradientBoxBorder(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment(-0.94, 1.8),
                                                colors: [
                                                  Color(0xffBA00FF),
                                                  Color(0xffB003FA),
                                                  Color(0xff960AEE),
                                                  Color(0xff6A15DB),
                                                  Color(0xff2F25BF),
                                                  Color(0xff0031AA),
                                                ],
                                              ),
                                            )
                                          : null,
                                    ),
                                    child: IconButton(
                                      padding: const EdgeInsets.all(5),
                                      onPressed: () => inputContactType.value = ContactType.WHATSAPP,
                                      icon: Image.asset(
                                        "assets/icons/whatsapp_icon.png",
                                        width: 68,
                                        height: 68,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AddProfileInputValidationText(
                                normalText: "* When a match is made, it’s shown to the woman.",
                                validation: inputContactValidation.value,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          /**********************************************
               *               Next Button
               **********************************************/
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: ElevatedButton(
                child: Text("Next"),
                onPressed: () {
                  inputContactValidation.value = ref.read(addProfileInputProvider.notifier).setContact(
                        inputContactId.value,
                        inputContactType.value,
                      );

                  if (inputContactValidation.value.isValid) {
                    ref.read(routerProvider).replace("/profile/add_profile/intro");
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
              ),
            ),
          ),
        ],
      )),
    );
  }
}
