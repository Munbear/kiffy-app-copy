import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileUserPage extends HookConsumerWidget {
  AddProfileUserPage({super.key});

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
                     *             Input Nickname
                     **********************************************/
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: const [
                            Align(
                              child: Text(
                                "Nickname",
                                style: TextStyle(fontSize: 20),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 13, bottom: 7),
                              child: TextField(
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
                              child: Text(
                                "* It cannot be changed",
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
                /**********************************************
                 *             Input Gender
                 **********************************************/
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 40,
                          left: 40,
                          right: 40,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Align(
                              child: Text(
                                "Gender",
                                style: TextStyle(fontSize: 20),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 13, bottom: 7),
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: ElevatedButton.icon(
                                          onPressed: () {},
                                          label: Text("Man"),
                                          icon: Image.asset("assets/icons/man_icon.png", width: 18),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(15),
                                                  bottomRight: Radius.circular(15),
                                                  topRight: Radius.circular(15)),
                                            ),
                                            shadowColor: Color(0x00000000),
                                            padding: EdgeInsets.only(top: 16, bottom: 16),
                                            backgroundColor: Colors.white,
                                            foregroundColor: Color(0xff494949),
                                            textStyle: TextStyle(fontSize: 18),
                                            side: BorderSide(
                                              color: Color(0xffDCDCDC),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: ElevatedButton.icon(
                                          onPressed: () {},
                                          label: Text("Woman"),
                                          icon: Image.asset("assets/icons/woman_icon.png", width: 20),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(15),
                                                  bottomRight: Radius.circular(15),
                                                  topRight: Radius.circular(15)),
                                            ),
                                            shadowColor: Color(0x00000000),
                                            padding: EdgeInsets.only(top: 16, bottom: 16),
                                            backgroundColor: Colors.white,
                                            foregroundColor: Color(0xff494949),
                                            textStyle: TextStyle(fontSize: 18),
                                            side: BorderSide(
                                              color: Color(0xffDCDCDC),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              child: Text(
                                "* It cannot be changed",
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
                /**********************************************
                 *             Input Birthday
                 **********************************************/
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: const [
                            Align(
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                  text: "Birthday",
                                  style: TextStyle(fontSize: 20),
                                ),
                                TextSpan(
                                    text: "  example : 20010305",
                                    style: TextStyle(fontSize: 12, color: Color(0xff6c6c6c)))
                              ])),
                              alignment: Alignment.centerLeft,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 13, bottom: 7),
                              child: TextField(
                                style: TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
                                decoration: InputDecoration(
                                    hintText: "YYYYMMDD",
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
                              child: Text(
                                "* It cannot be changed",
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
                  textStyle: TextStyle(fontSize: 20, color: Colors.white, ),
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
