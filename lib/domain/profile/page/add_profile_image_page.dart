import 'dart:developer';

import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_header.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_image_card.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_validation_text.dart';
import 'package:Kiffy/infra/media_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

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

class AddProfileImagePage extends HookConsumerWidget {
  List<String> items = [
    "assets/images/dummy_image.jpg",
    "assets/images/dummy_image.jpg",
    "assets/images/dummy_image.jpg",
  ];

  PageController pageController = PageController(initialPage: 0);
  fotoTipBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      builder: (BuildContext context) {
        changePage(page) {
          pageController.animateToPage(page, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xffcecece),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (page) => changePage(page),
                  children: items
                      .map(
                        (item) => Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              "This is an example of a popular photo.\nPlease refer to it!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 39),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset('assets/svg/arrow_prev.svg'),
                                  ),
                                  Container(
                                    width: 178,
                                    height: 236,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(item, fit: BoxFit.cover),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      changePage(pageController.initialPage);
                                    },
                                    icon: SvgPicture.asset('assets/svg/arrow_next.svg'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 39),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      side: const BorderSide(color: Color(0xff0031AA)),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      "Okay",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff0031AA),
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputImageMaxLength = 6;
    var inputImages = useState<List<AddProfileInputImageItem>>(List.empty());
    var inputImagesValidation = useState(AddProfileInputItemValidation.success());
    var userProfile = ref.read(addProfileInputProvider);

    void onAddedListener(String path) {
      uploadImage(path).then((res) => inputImages.value = [
            ...inputImages.value,
            AddProfileInputImageItem(
              filePath: path,
              url: res.url,
              id: res.id,
              orderNum: inputImages.value.length - 1,
            )
          ]);
    }

    void onDeletedListener(int index) {
      var copiedList = inputImages.value.getRange(0, inputImages.value.length).toList();
      copiedList.removeAt(index);
      inputImages.value = copiedList;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(39),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AddProfileHeader(),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Select your pictures",
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
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
              children: List.generate(
                inputImageMaxLength,
                (index) => AddProfileInputImageCard(
                  props: AddProfileInputImageCardProps(
                    index: index,
                    onDeleted: (idx) => onDeletedListener(idx),
                    onAdded: (path) => onAddedListener(path),
                    filePath: inputImages.value.length > index ? inputImages.value.elementAt(index).filePath : null,
                  ),
                ),
              ),
            ),
            // Container(
            //   color: Colors.red,
            //   child: GridView.builder(
            //     shrinkWrap: true,
            //     itemCount: inputImageMaxLength,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 3,
            //       childAspectRatio: 1 / 1.3,
            //       mainAxisSpacing: 15,
            //       crossAxisSpacing: 15,
            //     ),
            //     itemBuilder: (context, index) => AddProfileInputImageCard(
            //       props: AddProfileInputImageCardProps(
            //         index: index,
            //         onDeleted: (idx) => onDeletedListener(idx),
            //         onAdded: (path) => onAddedListener(path),
            //         filePath: inputImages.value.length > index ? inputImages.value.elementAt(index).filePath : null,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 8),
            AddProfileInputValidationText(
              normalText: "* You must select at least two sheets.",
              validation: inputImagesValidation.value,
            ),
            const Spacer(),
            ElevatedButton(
              // 500에러 수정시 주석 품
              onPressed: () {
                inputImagesValidation.value = ref.read(addProfileInputProvider.notifier).setMedias(
                      inputImages.value.map((image) => AddProfileMedia(id: image.id, orderNum: image.orderNum)).toList(),
                    );

                if (inputImagesValidation.value.isValid) {
                  try {
                    postUserProfile(
                      userProfile.name,
                      userProfile.gender,
                      userProfile.birthDate,
                      userProfile.intro,
                      userProfile.medias,
                    );
                  } on DioError catch (e) {
                    log(e.message);
                  }

                  ref.read(routerProvider).replace("/profile/add_profile/complete");
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                backgroundColor: Color(0xFF0031AA),
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
