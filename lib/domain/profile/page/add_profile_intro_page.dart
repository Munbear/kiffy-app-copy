import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_validation_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileIntroPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var inputIntro = useState("");
    var inputIntroValidation = useState(AddProfileInputItemValidation.success());

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
                Container(
                  padding: EdgeInsets.only(top: 72, bottom: 30),
                  child: Column(
                    children: const [
                      Text(
                        "Identify yourself",
                        style: TextStyle(
                          fontSize: 32,
                          color: Color(0xff0031AA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Enter information to be displayed in kiffy",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff494949),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                /**********************************************
                     *             Input Intro
                     **********************************************/
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                        text: "Introduce yourself",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      TextSpan(text: "  (option)", style: TextStyle(fontSize: 14))
                                    ])),
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                Container(
                                  width: 28,
                                  height: 18,
                                  padding: EdgeInsets.only(right: 10),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/icons/alert_icon.png",
                                    ),
                                    padding: EdgeInsets.all(0),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 13, bottom: 7),
                              child: TextField(
                                onChanged: (t) => inputIntro.value = t,
                                minLines: 5,
                                maxLines: 5,
                                style: TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
                                decoration: InputDecoration(
                                    hintText: "Please enter it.",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xffcecece), width: 2.0),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xff0031AA), width: 3.0),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                    ),
                                    contentPadding: EdgeInsets.all(18)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AddProfileInputValidationText(
                                normalText: "* This will increase your matching probability.",
                                validation: inputIntroValidation.value,
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
              padding: EdgeInsets.all(36),
              child: ElevatedButton(
                child: Text("Next"),
                onPressed: () {
                  inputIntroValidation.value = ref.read(addProfileInputProvider.notifier).setIntro(inputIntro.value);

                  if (inputIntroValidation.value.isValid) {
                    ref.read(routerProvider).replace("/profile/add_profile/image");
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF0031AA),
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
