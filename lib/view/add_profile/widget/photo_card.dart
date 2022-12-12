import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoCard extends ConsumerStatefulWidget {
  const PhotoCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoCardState();
}

class _PhotoCardState extends ConsumerState<PhotoCard> {
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
        margin: const EdgeInsets.fromLTRB(7.5, 13, 7.5, 13),
        width: 109,
        height: 162,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff0031AA), width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(7)),
        ),
        child: _image == null
            ? SvgPicture.asset(
                "assets/svg/camera.svg",
                width: 10,
                height: 10,
              )
            : ClipRRect(
                child: Image.file(File(_image!.path), fit: BoxFit.fill),
              ),
      ),
    );
  }
}
