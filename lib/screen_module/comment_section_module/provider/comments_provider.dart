import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/util/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

// 댓글 불러오기
final commentsProvider = AsyncNotifierProvider.autoDispose
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

  // 댓글창 없데이트
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
    final responseValue =
        await ref.read(openApiProvider).getPostApi().createPostCommentReply(
              postId: postId!,
              commentId: commentId!,
              createPostCommentRequestV1: CreatePostCommentRequestV1(
                (b) {
                  b.content = replyText;
                },
              ),
            );
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    logger.d("워터 : $responseValue");
    final List<PostCommentViewV1> updateList =
        List<PostCommentViewV1>.from(state.value!);
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
