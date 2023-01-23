import 'package:Kiffy/domain/profile/widget/add_profile_header.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_image_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileImagePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                     *             Input Image
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
                                        text: "Select your pictures",
                                        style: TextStyle(fontSize: 20),
                                      ),
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
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(child: AddProfileInputImageCard()),
                                            Expanded(child: AddProfileInputImageCard()),
                                            Expanded(child: AddProfileInputImageCard()),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(child: AddProfileInputImageCard()),
                                            Expanded(child: AddProfileInputImageCard()),
                                            Expanded(child: AddProfileInputImageCard()),
                                          ],
                                        ),
                                      ),
                                      ],
                                  ),
                                )),
                            Align(
                              child: Text(
                                "* You must select at least two sheets.",
                                style: TextStyle(fontSize: 13, color: Color(0xFF0031AA)),
                              ),
                              alignment: Alignment.centerLeft,
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
                onPressed: () {},
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
