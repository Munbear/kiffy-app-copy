import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileCompletePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                /**********************************************
                     *                  Logo
                     **********************************************/
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/images/kiffy_logo_purple.png",
                    width: 69,
                  ),
                ),
                /**********************************************
                     *             Example Profile
                     **********************************************/
                Container(
                  width: 152,
                  height: 152,
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.only(top: 200),
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    border: GradientBoxBorder(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(1.9, 0.1),
                          colors: [
                            Color(0xffBA00FF),
                            Color(0xffB003FA),
                            Color(0xff960AEE),
                            Color(0xff6A15DB),
                            Color(0xff2F25BF),
                            Color(0xff0031AA),
                          ],
                        ),
                        width: 3),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      "assets/images/example_for_dev.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "Build your Profile",
                    style: TextStyle(fontSize: 30, color: Color(0xFF0031AA), fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                    "Meet various people through the kiffy!",
                    style: TextStyle(fontSize: 16, color: Color(0xFF494949)),
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
                child: Text("Start KIFFY !"),
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
      ),),
    );
  }
}
