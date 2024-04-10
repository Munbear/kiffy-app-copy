import 'dart:io';

import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/match/provider/feed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CreateFeedImageSection extends ConsumerStatefulWidget {
  const CreateFeedImageSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateFeedImageSectionState();
}

class _CreateFeedImageSectionState
    extends ConsumerState<CreateFeedImageSection> {
  @override
  Widget build(BuildContext context) {
    final selectedImages = ref.watch(imageFileState);
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
                        ref
                            .read(communityProvider.notifier)
                            .removeImage(index)
                            .then((value) {
                          setState(() {});
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
                      final uploadImageList = ref.watch(imageUploadState);
                      if (uploadImageList.isEmpty) {
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
                      } else {
                        return const SizedBox();
                      }
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
                  // 업로드 이미지 지우기
                  if (ref.read(imageUploadState).isNotEmpty) {
                    ref.invalidate(imageUploadState);
                  }

                  // 이미지 선택하기
                  ref.read(communityProvider.notifier).getImageFilesV2();
                },
                icon: SvgPicture.asset("assets/svg/gallery.svg"),
              ),
              Consumer(builder: (context, ref, child) {
                final textLenght = ref.watch(feedTextLengthState);
                return Text(
                  "$textLenght/500",
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
