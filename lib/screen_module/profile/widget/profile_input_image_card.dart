import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoInputCard extends StatelessWidget {
  final int index;
  final String? filePath;
  final ValueChanged<int> onDeleted;
  final ValueChanged<String> onAdded;

  const PhotoInputCard({
    super.key,
    required this.index,
    required this.onDeleted,
    required this.onAdded,
    this.filePath
  });

  @override
  Widget build(BuildContext context) {
    if (filePath != null) {
      return FilledPhotoInputCard(index: index, filePath: filePath!, onDeleted: onDeleted);
    }

    return EmptyPhotoInputCard(onAdded: onAdded);
  }
}

class EmptyPhotoInputCard extends StatelessWidget {
  final ValueChanged<String> onAdded;

  const EmptyPhotoInputCard({super.key, required this.onAdded});

  Future addImage(ImageSource imageSource) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: imageSource);
    if (file != null) {
      onAdded(file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
            width: 93,
            height: 133,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFCECECE), width: 2.0),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: InkWell(
              onTap: () {
                addImage(ImageSource.gallery);
              },
              child: const Center(child: Text("+", style: TextStyle(fontSize: 20, color: Color(0xFFCECECE)))),
            )
          // Image.file(File(imagePath.value!.path), fit: BoxFit.cover),
        )
      ],
    );
  }
}

class FilledPhotoInputCard extends StatelessWidget {
  final int index;
  final String filePath;
  final ValueChanged<int> onDeleted;

  const FilledPhotoInputCard({super.key, required this.index, required this.filePath, required this.onDeleted});

  // 이미지 삭제
  Future deleteImage(ValueNotifier<File?> imagePath, ValueNotifier<File?> imageFile) async {
    if (imagePath.value != null) {
      imagePath.value = null;
      imageFile.value = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 93,
          height: 133,
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(image: Image.file(File(filePath)).image, fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          right: 15,
          top: 15,
          child: GestureDetector(
            onTap: () => onDeleted(index),
            child: const Text("X", style: TextStyle(fontSize: 14, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}