import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoCard extends HookConsumerWidget {
  PhotoCard({super.key});

  File? _image;
  final picker = ImagePicker();

  Future addImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    // setState(() {
    //   _image = File(image!.path);
    // });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => addImage(ImageSource.gallery),
      child: Container(
        margin: const EdgeInsets.fromLTRB(7.5, 13, 7.5, 13),
        width: 109,
        height: 162,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff0031AA), width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(7)),
        ),
        child: _image == null
            ? Center(child: SvgPicture.asset("assets/svg/camera.svg"))
            : ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.file(File(_image!.path), fit: BoxFit.fill),
              ),
      ),
    );
  }
}
