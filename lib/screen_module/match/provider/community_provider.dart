import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/match/widget/feed_filter_contaienr.dart';
import 'package:Kiffy/screen_module/my/provider/my_provider.dart';
import 'package:Kiffy/util/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openapi/openapi.dart';

final communityProvider =
    AsyncNotifierProvider.autoDispose<FeedList, List<PostViewV1>>(FeedList.new);

class FeedList extends AutoDisposeAsyncNotifier<List<PostViewV1>> {
  @override
  Future<List<PostViewV1>> build() async {
    final res = await ref.read(openApiProvider).getPostApi().getFeed(
      getFeedRequestV1: GetFeedRequestV1(
        (b) {
          b.nextKey = null;
        },
      ),
    );
    ref
        .read(feedPagingState.notifier)
        .update((state) => res.data!.paging.nextKey);
    logger.d(res.data!);
    return res.data!.posts.toList();
  }

  // 피드 게시글 더 불러오기
  Future<void> updateFeedList({String? nextPage}) async {
    // final nextKey = ref.watch(feedPagingState);
    final res = await ref.read(openApiProvider).getPostApi().getFeed(
      getFeedRequestV1: GetFeedRequestV1(
        (b) {
          b.nextKey = nextPage;
        },
      ),
    );

    List<PostViewV1> newList = res.data!.posts.toList();
    List<PostViewV1> currentList = state.value!;
    currentList.addAll(newList);
    state = AsyncValue.data(currentList);
    ref
        .read(feedPagingState.notifier)
        .update((state) => res.data!.paging.nextKey);
    // return res.data!.paging.nextKey;
  }

  Future feedFilter(FeedFilter currentFilter) async {
    final myInfo = ref.read(myProvider);
    ref.read(communityFilter.notifier).update((state) => currentFilter);
    if (currentFilter == FeedFilter.my) {
      List<PostViewV1> myList = state.value!
          .where((element) => element.author.id == myInfo.value!.profile!.id)
          .toList();
      state = AsyncValue.data(myList);
    } else {
      ref.invalidate(communityProvider);
    }
  }

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

  // 게시글 작성하기
  Future postFeed(String text, List<String> imageIds) async {
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

    // 게시글 작성
    if (text != "" && text.length > 10) {
      await ref.read(openApiProvider).getPostApi().createPost(
        createPostRequestV1: CreatePostRequestV1(
          (b) {
            b.content = text;
            b.mediaIds.addAll(imageIds);
          },
        ),
      ).then((value) {
        final List<PostViewV1> updateFeeds =
            List<PostViewV1>.from(state.value!);
        updateFeeds.insert(0, value.data!);

        state = AsyncValue.data(updateFeeds);
        statusCode = value.statusCode ?? 0;
      });
    }
    return statusCode;
  }

  /// feed 삭제하기
  Future deleteFeed(String feedId) async {
    Response res =
        await ref.read(openApiProvider).getPostApi().deletePost(postId: feedId);
    if (res.statusCode == 200) {
      logger.d("삭제됨: ${res.data}");
      final List<PostViewV1> updateList =
          state.value!.where((element) => element.id != feedId).toList();
      state = AsyncValue.data(updateList);
    }
  }

  updateLoadingState(bool isLoading) {
    ref.read(loading2.notifier).update((state) => isLoading);
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
// 로딩
final loading2 = StateProvider.autoDispose<bool>((ref) => false);
// 피드 페이징
final feedPagingState = StateProvider<String>((ref) => "");
// 선택된 피드 필터
final communityFilter =
    StateProvider.autoDispose<FeedFilter>((ref) => FeedFilter.all);
