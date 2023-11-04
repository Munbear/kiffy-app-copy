import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_media/user_profile_create_and_edit_command_profile_media.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile_header.dart';
import 'package:Kiffy/screen_module/profile/widget/example_profile_photo_tip_bottom_sheet.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_image_card.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation_text.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class ProfileInputImageSection extends ConsumerStatefulWidget {
  const ProfileInputImageSection({super.key});

  @override
  ConsumerState<ProfileInputImageSection> createState() =>
      _ProfileInputImageSectionState();
}

class _ProfileInputImageSectionState
    extends ConsumerState<ProfileInputImageSection> {
  List<AddProfileInputImageItem> inputImages = [];
  AddProfileInputItemValidation inputImagesValidation =
      AddProfileInputItemValidation.success();
  PageController pageController = PageController(initialPage: 0);
  int inputImageMaxLength = 6;

  void onAddedListener(String path) async {
    ref
        .read(openApiProvider)
        .getMediaApi()
        .apiMediaV1UploadTypePost(
            type: "image", file: await MultipartFile.fromFile(path))
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
  photoTipBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      builder: (BuildContext context) {
        return ExampleProfilePhotoTipBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(39),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AddProfileHeader(),
          const Space(height: 40),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                    tr("text.profile.media"),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                width: 18,
                height: 18,
                child: GestureDetector(
                  onTap: () => photoTipBottomSheet(context),
                  child: Image.asset(
                    "assets/icons/alert_icon.png",
                  ),
                ),
              ),
              Space(width: 10)
            ],
          ),
          const Space(height: 20),
          // 사진 추가
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: List.generate(inputImageMaxLength, (index) {
              return ProfileInputImageCard(
                index: index,
                onDeleted: (idx) => onDeletedListener(idx),
                onAdded: (path) => onAddedListener(path),
                filePath: inputImages.length > index
                    ? inputImages.elementAt(index).filePath
                    : null,
              );
            }),
          ),

          const Space(height: 8),
          ProfileInputValidationText(
            normalText: tr("text.profile.profile_input.media"),
            validation: inputImagesValidation,
          ),
          const Spacer(),

          // 넥스트 버튼
          ProfileInputNextButton(
            onPressed: () async {
              inputImagesValidation =
                  ref.read(profileInputProvider.notifier).setMedias(
                        inputImages.map((image) {
                          ref
                              .read(profileInputProvider.notifier)
                              .updateMedia(image.id, image.orderNum);
                          return UserProfileCreateAndEditCommandProfileMedia(
                              id: image.id, orderNum: image.orderNum);
                        }).toList(),
                      );

              setState(() {});

              if (inputImagesValidation.isValid) {
                await ref.read(profileInputProvider.notifier).addProfile();
                // 프로필을 생성해주었으니 다시 init 해주어야함
                await ref.read(myProvider).init();
                ref
                    .read(routerProvider)
                    .replace("/profile/add_profile/complete");
              }
            },
          ),
        ],
      ),
    );
  }
}
