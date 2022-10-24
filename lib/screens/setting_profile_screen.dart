import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingProfileScreen extends StatefulWidget {
  const SettingProfileScreen({super.key});

  @override
  State<SettingProfileScreen> createState() => _SettingProfileScreenState();
}

class _SettingProfileScreenState extends State<SettingProfileScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _addImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      // 사진 추가 기능 계속 만들어야됨
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 테스트
            Container(
              color: Colors.indigoAccent,
              child: Form(
                child: Column(
                  children: [
                    TextFormField(),
                    TextFormField(),
                    TextFormField(),
                  ],
                ),
              ),
            ),
            // 사진
            Container(
              child: ElevatedButton(
                onPressed: () {
                  _addImage(ImageSource.gallery);
                },
                child: Text('사진등록'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
