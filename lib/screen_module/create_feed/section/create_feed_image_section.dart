import 'dart:io';

import 'package:Kiffy/constant/style/gab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CreateFeedImageSection extends ConsumerStatefulWidget {
  const CreateFeedImageSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateFeedImageSectionState();
}

class _CreateFeedImageSectionState
    extends ConsumerState<CreateFeedImageSection> {
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
    return Column(
      children: [
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

                  // 사진 지우기 버튼
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

                  // 사진 로딩
                  Consumer(
                    builder: (context, ref, child) {
                      return Positioned.fill(
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: const Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
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
    );
  }
}
