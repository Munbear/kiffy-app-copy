import 'dart:developer';

import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_header.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_image_card.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_validation_text.dart';
import 'package:Kiffy/domain/profile/widget/example_profile_foto_tip_bottom_sheet.dart';
import 'package:Kiffy/infra/media_client.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_contact/user_profile_create_and_edit_command_profile_contact.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_media/user_profile_create_and_edit_command_profile_media.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infra/user_client.dart';

class AddProfileInputImageItem {
  String filePath;
  String url;
  String id;
  int orderNum;

  AddProfileInputImageItem({
    required this.filePath,
    required this.url,
    required this.id,
    required this.orderNum,
  });
}

// class AddProfileImagePage extends HookConsumerWidget {
//   PageController pageController = PageController(initialPage: 0);

//   // profile foto tip
//   fotoTipBottomSheet(context) {
//     return showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       constraints: BoxConstraints(
//         maxHeight: MediaQuery.of(context).size.height / 2,
//       ),
//       builder: (BuildContext context) {
//         return ExampleProfileFotoTipBottomSheet();
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final inputImageMaxLength = 6;

//     var inputImages = useState<List<AddProfileInputImageItem>>([]);
//     var inputImagesValidation = useState(AddProfileInputItemValidation.success());
//     var userProfile = ref.read(addProfileInputProvider);

//     void onAddedListener(String path) {
//       uploadImage(path).then(
//         (res) => inputImages.value = [
//           ...inputImages.value,
//           AddProfileInputImageItem(
//             filePath: path,
//             url: res.url,
//             id: res.id,
//             orderNum: inputImages.value.length,
//           )
//         ],
//       );
//     }

//     void onDeletedListener(int index) {
//       var copiedList = inputImages.value.getRange(0, inputImages.value.length).toList();
//       copiedList.removeAt(index);
//       inputImages.value = copiedList;
//     }

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Padding(
//         padding: const EdgeInsets.all(39),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             AddProfileHeader(),
//             const SizedBox(height: 40),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Select your pictures",
//                   style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   width: 18,
//                   height: 18,
//                   child: GestureDetector(
//                     onTap: () => fotoTipBottomSheet(context),
//                     child: Image.asset(
//                       "assets/icons/alert_icon.png",
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(height: 20),
//             // 사진 추가
//             Wrap(
//               spacing: 15,
//               runSpacing: 15,
//               children: List.generate(
//                 inputImageMaxLength,
//                 (index) => AddProfileInputImageCard(
//                   props: AddProfileInputImageCardProps(
//                     index: index,
//                     onDeleted: (idx) => onDeletedListener(idx),
//                     onAdded: (path) => onAddedListener(path),
//                     filePath: inputImages.value.length > index ? inputImages.value.elementAt(index).filePath : null,
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),
//             AddProfileInputValidationText(
//               normalText: "* You must select at least two sheets.",
//               validation: inputImagesValidation.value,
//             ),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 inputImagesValidation.value = ref.read(addProfileInputProvider.notifier).setMedias(
//                       inputImages.value.map((image) {
//                         ref.read(addProfileInputProvider.notifier).updateMedia(image.id, image.orderNum);
//                         return UserProfileCreateAndEditCommandProfileMedia(id: image.id, orderNum: image.orderNum);
//                       }).toList(),
//                     );

//                 if (inputImagesValidation.value.isValid) {
//                   try {
//                     ref.watch(addProfileInputProvider.notifier).addProfile();
//                   } on DioError catch (e) {
//                     log(e.message ?? "");
//                   }

//                   ref.read(routerProvider).replace("/profile/add_profile/complete");
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.only(top: 15, bottom: 15),
//                 textStyle: const TextStyle(fontSize: 20, color: Colors.white),
//                 backgroundColor: const Color(0xFF0031AA),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: const Text("Next"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//////////////////////
///
///
class AddProfileImagePage extends ConsumerStatefulWidget {
  static String get routeLocation => "/profile/add_profile/image";
  static String get routeName => "profile_add_profile_image";

  const AddProfileImagePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddProfileImagePageState();
}

class _AddProfileImagePageState extends ConsumerState<AddProfileImagePage> {
  PageController pageController = PageController(initialPage: 0);
  int inputImageMaxLength = 6;

  List<AddProfileInputImageItem> inputImages = [];
  AddProfileInputItemValidation inputImagesValidation =
      AddProfileInputItemValidation.success();

  void onAddedListener(String path) async {
    ref.read(openApiProvider).getMediaApi().apiMediaV1UploadTypePost(type: "image", file: await MultipartFile.fromFile(path))
      .then((res) {
      setState(() {});
      return inputImages = [
        ...inputImages,
        AddProfileInputImageItem(
          filePath: path,
          url: res.data!.url,
          id: res.data!.id,
          orderNum: inputImages.length,
        )
      ];
      });
  }

  void onDeletedListener(int index) {
    var copiedList = inputImages.getRange(0, inputImages.length).toList();
    copiedList.removeAt(index);
    setState(() {});
    inputImages = copiedList;
  }

  // 프로필 사진 팁 바텀 시트
  fotoTipBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      builder: (BuildContext context) {
        return ExampleProfileFotoTipBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = ref.watch(addProfileInputProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(39),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AddProfileHeader(),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Select your pictures",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 18,
                  height: 18,
                  child: GestureDetector(
                    onTap: () => fotoTipBottomSheet(context),
                    child: Image.asset(
                      "assets/icons/alert_icon.png",
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            // 사진 추가
            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: List.generate(inputImageMaxLength, (index) {
                return AddProfileInputImageCard(
                  props: AddProfileInputImageCardProps(
                    index: index,
                    onDeleted: (idx) => onDeletedListener(idx),
                    onAdded: (path) => onAddedListener(path),
                    filePath: inputImages.length > index
                        ? inputImages.elementAt(index).filePath
                        : null,
                  ),
                );
              }),
            ),

            const SizedBox(height: 8),
            AddProfileInputValidationText(
              normalText: "* You must select at least two sheets.",
              validation: inputImagesValidation,
            ),
            const Spacer(),

            // 넥스트 버튼
            ElevatedButton(
              onPressed: () {
                inputImagesValidation =
                    ref.read(addProfileInputProvider.notifier).setMedias(
                          inputImages.map((image) {
                            ref
                                .read(addProfileInputProvider.notifier)
                                .updateMedia(image.id, image.orderNum);
                            return UserProfileCreateAndEditCommandProfileMedia(
                                id: image.id, orderNum: image.orderNum);
                          }).toList(),
                        );

                setState(() {});

                if (inputImagesValidation.isValid) {
                  ref.watch(addProfileInputProvider.notifier).addProfile()
                    .then((_) {
                    ref
                        .read(routerProvider)
                        .replace("/profile/add_profile/complete");
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                backgroundColor: const Color(0xFF0031AA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
