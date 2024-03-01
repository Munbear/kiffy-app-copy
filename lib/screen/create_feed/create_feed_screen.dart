import 'dart:io';

import 'package:Kiffy/constant/style/gab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class CreateFeedScreen extends StatefulWidget {
  static String get routeName => 'createFeed';
  static String get routeLocation => '/createFeed';

  const CreateFeedScreen({super.key});

  @override
  State<CreateFeedScreen> createState() => _CreateFeedScreenState();
}

class _CreateFeedScreenState extends State<CreateFeedScreen> {
  List<XFile> selectedImages = [];

  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    List<XFile>? images = await picker.pickMultiImage();
    if (images.length > 10) {
      Fluttertoast.showToast(
          msg: "사진은 최대 10까지 선택 가능 합니다.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      images.clear();
    } else {
      setState(() {
        selectedImages = images;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final iconButtonStyle = Theme.of(context).iconButtonTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 96,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "cancel",
              style: textStyle.titleSmall,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.zero,
                backgroundColor: const Color(0xff0031AA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Share",
                style: textStyle.titleSmall!.apply(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 유저 정보
                      Row(
                        children: [
                          SizedBox(
                            width: 32,
                            height: 32,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/images/test_image.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Gab.width12,
                          Text(
                            "kiffy",
                            style: textStyle.titleSmall,
                          )
                        ],
                      ),
                      Gab.height12,
                      // divider
                      Container(height: 1, color: Colors.grey[400]),
                      // 텍스트 영역
                      TextFormField(
                        autofocus: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(500),
                        ],
                        maxLines: null,
                        decoration: InputDecoration(
                          hintStyle: textStyle.bodyLarge!
                              .apply(color: Colors.grey[400]),
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: "write here",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 이미지 프리뷰
            SizedBox(
              height: 128,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: selectedImages.length,
                separatorBuilder: (context, index) {
                  return Gab.width4;
                },
                itemBuilder: (context, index) {
                  final image = selectedImages[index].path;
                  return Stack(
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcATop,
                        shaderCallback: (Rect bound) {
                          return LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.4),
                            ],
                            stops: const [0.8, 1],
                          ).createShader(bound);
                        },
                        child: SizedBox(
                          width: 112,
                          height: 112,
                          child: Image.file(
                            File(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        right: -10,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              selectedImages.remove(selectedImages[index]);
                            });
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // // 사진 불러오기 영역
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      getLostData();
                    },
                    icon: SvgPicture.asset("assets/svg/gallery.svg"),
                  ),
                  Text(
                    "0 / 500",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
