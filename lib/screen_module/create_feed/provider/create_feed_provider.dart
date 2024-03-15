import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/model/create_feed_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openapi/openapi.dart';

final createFeedProvider =
    AsyncNotifierProvider.autoDispose<CreateFeed, CreateFeedModel>(
        CreateFeed.new);

class CreateFeed extends AutoDisposeAsyncNotifier<CreateFeedModel> {
  @override
  CreateFeedModel build() {
    // your logic here

    return CreateFeedModel(
      content: "",
      mediaIds: [],
    );
  }
  // your methods here

  // 사진 파일 가져오기
  Future<void> getImageFilesV2() async {
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
      // preview 보여줄 이미지 변수
      ref.read(imageFileState.notifier).update((state) => state = images);
      // Media api
      postMediaApi(images);
    }
  }

  // 이미지 사이즈 줄이기
  void postMediaApi(List<XFile> images) async {
    List<String> uploadedIds = [];
    for (var image in images) {
      var res = await ref
          .read(openApiProvider)
          .getMediaApi()
          .apiMediaV1UploadTypePost(
              type: "image", file: await MultipartFile.fromFile(image.path));
      uploadedIds.add(res.data!.id);
    }
    ref.read(imageUploadState.notifier).update((state) => state = uploadedIds);
  }

  // 이미지 지우기
  Future<void> removeImage(targetIndex) async {
    final currentImageFiles = ref.read(imageFileState);
    final currentUploadState = ref.read(imageUploadState);

    currentImageFiles.removeAt(targetIndex);
    currentUploadState.removeAt(targetIndex);

    ref
        .read(imageFileState.notifier)
        .update((state) => state = currentImageFiles);
    ref
        .read(imageUploadState.notifier)
        .update((state) => state = currentUploadState);
  }

  // 요청 보내기
  postFeed(String text, List<String> imageIds) async {
    int statusCode = 0;
    if (text.isEmpty) {
      Fluttertoast.showToast(
        msg: "내용을 입력해 주세요",
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }

    if (text.isNotEmpty && text.length < 10) {
      Fluttertoast.showToast(
        msg: "10글잘 이상 입력해 주세요",
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }

    if (text != "" && text.length > 10) {
      await ref.read(openApiProvider).getPostApi().createPost(
        createPostRequestV1: CreatePostRequestV1(
          (b) {
            b.content = text;
            b.mediaIds.addAll(imageIds);
          },
        ),
      ).then((value) {
        statusCode = value.statusCode ?? 0;
      });
      return statusCode;
    }
  }
}

//텍스트 상태
final feedTextController = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());
// 텍스트 길이
final feedTextLengthState = StateProvider.autoDispose<int>((ref) => 0);
// 이미지 preivew 상태
final imageFileState = StateProvider.autoDispose<List<XFile>>((ref) => []);
// 이미지 업로드 상태
final imageUploadState = StateProvider.autoDispose<List<String>>((ref) => []);
