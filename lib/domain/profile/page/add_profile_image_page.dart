import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_header.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_image_card.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_validation_text.dart';
import 'package:Kiffy/infra/media_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputImageMaxLength = 6;
    var inputImages = useState<List<AddProfileInputImageItem>>(List.empty());
    var inputImagesValidation = useState(AddProfileInputItemValidation.success());

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
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                /**********************************************
                     *                  Header
                     **********************************************/
                AddProfileHeader(),
                /**********************************************
                     *             Input Image
                     **********************************************/
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                        text: "Select your pictures",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ])),
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                Container(
                                  width: 28,
                                  height: 18,
                                  padding: EdgeInsets.only(right: 10),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/icons/alert_icon.png",
                                    ),
                                    padding: EdgeInsets.all(0),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 13, bottom: 7),
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: inputImageMaxLength,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 1 / 1.3,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 0,
                                ),
                                itemBuilder: (context, index) => AddProfileInputImageCard(
                                  props: AddProfileInputImageCardProps(
                                    index: index,
                                    onDeleted: (idx) => onDeletedListener(idx),
                                    onAdded: (path) => onAddedListener(path),
                                    filePath: inputImages.value.length > index
                                        ? inputImages.value.elementAt(index).filePath
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AddProfileInputValidationText(
                                normalText: "* You must select at least two sheets.",
                                validation: inputImagesValidation.value,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          /**********************************************
               *               Next Button
               **********************************************/
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(36),
              child: ElevatedButton(
                child: Text("Next"),
                onPressed: () {
                  inputImagesValidation.value = ref.read(addProfileInputProvider.notifier).setMedias(inputImages.value
                      .map((image) => AddProfileMedia(id: image.id, orderNum: image.orderNum))
                      .toList());

                  if (inputImagesValidation.value.isValid) {
                    ref.read(routerProvider).replace("/profile/add_profile/complete");
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF0031AA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
