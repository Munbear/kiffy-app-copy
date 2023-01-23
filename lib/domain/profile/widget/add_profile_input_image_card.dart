import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProfileInputImageCard extends HookConsumerWidget {
  AddProfileInputImageCard({super.key});

  // 이미지 불러오기
  Future addImage(ValueNotifier<File?> imagePath, ValueNotifier<File?> imageFile, ImageSource imageSource) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: imageSource);
    if (file != null) {
      imagePath.value = File(file.path);
      imageFile.value = File(file.name);
    } else {
      return;
    }
  }

  // 이미지 삭제
  Future deleteImage(ValueNotifier<File?> imagePath, ValueNotifier<File?> imageFile) async {
    if (imagePath.value != null) {
      imagePath.value = null;
      imageFile.value = null;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = useState<File?>(null);
    final imageFile = useState<File?>(null);

    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.all(7),
            height: 133,
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: imagePath.value == null
                  ? Border.all(color: const Color(0xFFCECECE), width: 2.0)
                  : null,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: imagePath.value == null
                ? InkWell(
                    onTap: () => addImage(imagePath, imageFile, ImageSource.gallery),
                    child: Center(
                        child: Text(
                      "+",
                      style: TextStyle(fontSize: 20, color: Color(0xFFCECECE)),
                    )),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: Image.file(File(imagePath.value!.path)).image,
                        fit: BoxFit.cover
                      ),
                    ),
                  )
            //      Image.file(File(imagePath.value!.path), fit: BoxFit.cover)
            ),
        Visibility(
          visible: imageFile.value != null ? true : false,
          child: Positioned(
            right: 15,
            top: 15,
            child: GestureDetector(
              onTap: () => deleteImage(imagePath, imageFile),
              child: Text(
                "X",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
