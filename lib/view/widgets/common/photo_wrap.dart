import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PhotoWrap extends ConsumerStatefulWidget {
  const PhotoWrap({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoWrapState();
}

class _PhotoWrapState extends ConsumerState<PhotoWrap> {
  File? _image;
  final picker = ImagePicker();

  // 갤러리에서 이미지 선택 :: IOS 에뮬레이터에서는 팅김
  Future addImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        addImage(ImageSource.gallery);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: _image == null ? const Center(child: Icon(Icons.add_a_photo)) : ClipRRect(child: Image.file(File(_image!.path), fit: BoxFit.fill)),
      ),
    );
  }
}
