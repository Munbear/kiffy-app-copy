import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoCard extends HookConsumerWidget {
  PhotoCard({super.key});

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
          margin: const EdgeInsets.fromLTRB(7.5, 13, 7.5, 13),
          width: 109,
          height: 162,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff0031AA), width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(7)),
          ),
          child: imagePath.value == null
              ? InkWell(
                  onTap: () => addImage(imagePath, imageFile, ImageSource.gallery),
                  child: Center(child: SvgPicture.asset("assets/svg/camera.svg")),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.file(File(imagePath.value!.path), fit: BoxFit.fill),
                ),
        ),
        Visibility(
          visible: imageFile.value != null ? true : false,
          child: Positioned(
            right: -7,
            top: -5,
            child: GestureDetector(
              onTap: () => deleteImage(imagePath, imageFile),
              child: SvgPicture.asset("assets/svg/cancel_icon.svg"),
            ),
          ),
        ),
      ],
    );
  }
}
