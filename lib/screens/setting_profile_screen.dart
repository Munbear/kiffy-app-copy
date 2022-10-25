import 'dart:io';
import 'package:flutter/material.dart';

import 'package:Kiffy/enums/gender_type.dart';
import 'package:image_picker/image_picker.dart';

class SettingProfileScreen extends StatefulWidget {
  const SettingProfileScreen({super.key});

  @override
  State<SettingProfileScreen> createState() => _SettingProfileScreenState();
}

class _SettingProfileScreenState extends State<SettingProfileScreen> {
  File? _image;
  final picker = ImagePicker();

  // 실행시키면 에뮬레이터 팅김
  Future addImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      addImage(ImageSource.gallery);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Text("Add Photo"),
                    ),
                  ),
                  // 생년월일
                  TextFormField(),
                  // 닉네임
                  TextFormField(),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: GenderType.values.map((item) {
                      return Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 0.5),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(child: Text(item.gender))),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
