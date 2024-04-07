import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

// 댓글 불러오기
final commentProvider = AsyncNotifierProvider.autoDispose
    .family<Comments, List<PostCommentViewV1>, String>(
  Comments.new,
);

//PostCommentPageView
class Comments
    extends AutoDisposeFamilyAsyncNotifier<List<PostCommentViewV1>, String> {
  @override
  Future<List<PostCommentViewV1>> build(String commentId) async {
    final res = await ref.read(openApiProvider).getPostApi().getPostComments(
          postId: commentId,
          getCommentsRequestV1: GetCommentsRequestV1(),
        );
    return res.data!.comments.toList();
  }

  // 댓글 더 불렁기
  Future<PostCommentPageView> updateComments(String commentId) async {
    final data = await ref.read(openApiProvider).getPostApi().getPostComments(
          postId: commentId,
          getCommentsRequestV1: GetCommentsRequestV1(),
        );
    return data.data!;
  }

  /// 댓글 달기
  Future postLeaveCommnet(String commentId, String commentText) async {
    final responseValue =
        await ref.read(openApiProvider).getPostApi().createPostComment(
              postId: commentId,
              createPostCommentRequestV1: CreatePostCommentRequestV1(
                (builderItem) {
                  builderItem.content = commentText;
                },
              ),
            );
    final List<PostCommentViewV1> updateList =
        List<PostCommentViewV1>.from(state.value!)..add(responseValue.data!);
    state = AsyncValue.data(updateList);
  }

  // 대댓글 달기
  Future postLeaveReply(
      {String? postId, String? commentId, String? replyText}) async {
    final resValue =
        await ref.read(openApiProvider).getPostApi().createPostCommentReply(
              postId: postId!,
              commentId: commentId!,
              createPostCommentRequestV1: CreatePostCommentRequestV1(
                (b) {
                  b.content = replyText;
                },
              ),
            );
    List<PostCommentViewV1> updateList =
        List<PostCommentViewV1>.from(state.value!);
    PostCommentViewV1 newReply = resValue.data!;

    int parentIndex =
        updateList.indexWhere((element) => element.id == commentId);
    if (parentIndex != -1) {
      updateList.insert(parentIndex + 1, newReply);
    }
    state = AsyncValue.data(updateList);
  }

  /// 댓글 삭제
  Future deleteComment(String commentId) async {
    final resValue =
        await ref.read(openApiProvider).getPostApi().deletePostComment(
              postId: arg,
              commentId: commentId,
            );
    if (resValue.statusCode == 200) {
      final List<PostCommentViewV1> updateList =
          state.value!.where((element) => element.id != commentId).toList();
      state = AsyncValue.data(updateList);
    }
  }
}

// 댓글 정보
class CommentInfo {
  final String commentId;
  final String? author;

  CommentInfo({required this.commentId, this.author});
}

final commentHintTextState =
    StateProvider.autoDispose<CommentInfo?>((ref) => null);
