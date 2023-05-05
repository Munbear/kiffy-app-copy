import 'dart:io';

import 'package:Kiffy/infra/media_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddProfileInputImageCardProps {
  int index;
  String? filePath;

  ValueChanged<int> onDeleted;
  ValueChanged<String> onAdded;

  AddProfileInputImageCardProps({
    required this.index,
    required this.onDeleted,
    required this.onAdded,
    this.filePath,
  });
}

// class AddProfileInputImageCard extends HookConsumerWidget {
//   AddProfileInputImageCardProps props;

//   AddProfileInputImageCard({required this.props});

//   // 이미지 불러오기
//   Future addImage(ImageSource imageSource) async {
//     final picker = ImagePicker();
//     final file = await picker.pickImage(source: imageSource);
//     if (file != null) {
//       props.onAdded(file.path);
//     }
//   }

//   // 이미지 삭제
//   Future deleteImage(ValueNotifier<File?> imagePath, ValueNotifier<File?> imageFile) async {
//     if (imagePath.value != null) {
//       imagePath.value = null;
//       imageFile.value = null;
//     }
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Stack(
//       children: [
//         Container(
//           width: 93,
//           height: 133,
//           clipBehavior: Clip.hardEdge,
//           padding: const EdgeInsets.all(0),
//           decoration: BoxDecoration(
//             border: props.filePath == null ? Border.all(color: const Color(0xFFCECECE), width: 2.0) : null,
//             borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(15),
//               bottomRight: Radius.circular(15),
//               topRight: Radius.circular(15),
//             ),
//           ),
//           child: props.filePath == null
//               ? InkWell(
//                   onTap: () {
//                     addImage(ImageSource.gallery);
//                   },
//                   child: const Center(child: Text("+", style: TextStyle(fontSize: 20, color: Color(0xFFCECECE)))),
//                 )
//               : Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     image: DecorationImage(image: Image.file(File(props.filePath!)).image, fit: BoxFit.cover),
//                   ),
//                 ),
//           // Image.file(File(imagePath.value!.path), fit: BoxFit.cover),
//         ),
//         Visibility(
//           visible: props.filePath != null ? true : false,
//           child: Positioned(
//             right: 15,
//             top: 15,
//             child: GestureDetector(
//               onTap: () => props.onDeleted(props.index),
//               child: const Text("X", style: TextStyle(fontSize: 14, color: Colors.white)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

/////////////////
///
///

class AddProfileInputImageCard extends ConsumerStatefulWidget {
  AddProfileInputImageCardProps props;

  AddProfileInputImageCard({super.key, required this.props});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddProfileInputImageCardState();
}

class _AddProfileInputImageCardState extends ConsumerState<AddProfileInputImageCard> {
  // 이미지 불러오기
  Future addImage(ImageSource imageSource) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: imageSource);
    if (file != null) {
      widget.props.onAdded(file.path);
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 93,
          height: 133,
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: widget.props.filePath == null ? Border.all(color: const Color(0xFFCECECE), width: 2.0) : null,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: widget.props.filePath == null
              ? InkWell(
                  onTap: () {
                    addImage(ImageSource.gallery);
                  },
                  child: const Center(child: Text("+", style: TextStyle(fontSize: 20, color: Color(0xFFCECECE)))),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(image: Image.file(File(widget.props.filePath!)).image, fit: BoxFit.cover),
                  ),
                ),
          // Image.file(File(imagePath.value!.path), fit: BoxFit.cover),
        ),
        Visibility(
          visible: widget.props.filePath != null ? true : false,
          child: Positioned(
            right: 15,
            top: 15,
            child: GestureDetector(
              onTap: () => widget.props.onDeleted(widget.props.index),
              child: const Text("X", style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
