import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoCard extends HookConsumerWidget {
  PhotoCard({super.key});

  final picker = ImagePicker();
  late String saveFile;

  Future addImage(ValueNotifier<File?> _image, ImageSource imageSource) async {
    final file = await picker.pickImage(source: imageSource);
    // null 체크
    if (file == null) {
      return;
    } else {
      _image.value = File(file.path);
      // 저장됨
      saveFile = File(file.path).copySync('/Users/munbeaer/Downloads/24/test.jpg').toString();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = useState<File?>(null);

    return InkWell(
      onTap: () => addImage(image, ImageSource.gallery),
      child: Container(
        margin: const EdgeInsets.fromLTRB(7.5, 13, 7.5, 13),
        width: 109,
        height: 162,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff0031AA), width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(7)),
        ),
        child: image.value == null
            ? Center(child: SvgPicture.asset("assets/svg/camera.svg"))
            : ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.file(File(image.value!.path), fit: BoxFit.fill),
              ),
      ),
    );
  }
}
