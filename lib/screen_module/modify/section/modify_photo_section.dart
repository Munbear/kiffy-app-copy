import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/modify/provider/modify_profile_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class ModifyPhotoSection extends ConsumerStatefulWidget {
  const ModifyPhotoSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PhotoListSectionState();
}

class _PhotoListSectionState extends ConsumerState<ModifyPhotoSection> {
  List<MediaView> myImages = List.empty();

  @override
  void initState() {
    setState(() {
      myImages = ref.read(myProvider).getProfile().medias.toList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        children: [
          ProfileInputImages(
            medias: myImages,
            onAdded: (media) {
              setState(() {
                myImages.add(media);
              });
              ref
                  .read(editUserMediaProfile.notifier)
                  .update((state) => myImages);
              print("###########################");
              print(ref.read(editUserMediaProfile));
            },
            onDeleted: (index) {
              setState(() {
                myImages.removeAt(index);
              });
              ref
                  .read(editUserMediaProfile.notifier)
                  .update((state) => myImages);
              print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
              print(ref.read(editUserMediaProfile));
            },
            isModifyScreen: true,
          ),
        ],
      ),
    );
    // return SizedBox(
    //   height: 310,
    //   child: GridView.count(
    //     primary: false,
    //     crossAxisSpacing: 15,
    //     mainAxisSpacing: 15,
    //     childAspectRatio: 0.8,
    //     crossAxisCount: 3,
    //     children: List.generate(
    //       6,
    //       (index) {
    //         final myImage = myImages.length > index ? myImages[index] : null;
    //         return myImage == null
    //             ? InkWell(
    //                 onTap: () {
    //                   print("hello");
    //                 },
    //                 borderRadius: const BorderRadius.only(
    //                   topRight: Radius.circular(16),
    //                   bottomRight: Radius.circular(16),
    //                   bottomLeft: Radius.circular(16),
    //                 ),
    //                 child: Container(
    //                     height: 133,
    //                     decoration: BoxDecoration(
    //                       borderRadius: const BorderRadius.only(
    //                         topRight: Radius.circular(16),
    //                         bottomRight: Radius.circular(16),
    //                         bottomLeft: Radius.circular(16),
    //                       ),
    //                       border: Border.all(
    //                         color: const Color(0xffCECECE),
    //                       ),
    //                     ),
    //                     // default UI
    //                     child: const Center(
    //                       child: Icon(
    //                         Icons.add,
    //                         color: Color(0xffCECECE),
    //                       ),
    //                     )),
    //               )
    //             : ClipRRect(
    //                 borderRadius: const BorderRadius.only(
    //                   topRight: Radius.circular(16),
    //                   bottomRight: Radius.circular(16),
    //                   bottomLeft: Radius.circular(16),
    //                 ),
    //                 child: Stack(
    //                   fit: StackFit.expand,
    //                   children: [
    //                     Image.network(
    //                       myImage.url,
    //                       fit: BoxFit.cover,
    //                     ),
    //                     Positioned(
    //                       top: 6,
    //                       right: 6,
    //                       child: IconButton(
    //                         onPressed: () {
    //                           print("사진 삭제");
    //                           removeImage(myImage.id);
    //                         },
    //                         constraints: const BoxConstraints(),
    //                         padding: EdgeInsets.zero,
    //                         splashRadius: 2.0,
    //                         icon: const Icon(
    //                           Icons.close,
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               );
    //       },
    //     ),
    //   ),
    // );
  }
}
