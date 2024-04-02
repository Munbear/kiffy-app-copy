import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

// 댓글 달기
final leaveCommentProvider =
    AsyncNotifierProvider.autoDispose<CreateComment, PostCommentViewV1>(
        CreateComment.new);

class CreateComment extends AutoDisposeAsyncNotifier<PostCommentViewV1> {
  @override
  Future<PostCommentViewV1> build() async {
    return PostCommentViewV1();
  }

  /// 댓글 달기
  Future postLeaveCommnet(String commentId, String commentText) async {
    await ref.read(openApiProvider).getPostApi().createPostComment(
          postId: commentId,
          createPostCommentRequestV1: CreatePostCommentRequestV1(
            (builderItem) {
              builderItem.content = commentText;
            },
          ),
        );
  }

  /// 대댓글 달기
  Future postLeaveReply(
      {String? postId, String? commentId, String? replyText}) async {
    await ref.read(openApiProvider).getPostApi().createPostCommentReply(
          postId: postId!,
          commentId: commentId!,
          createPostCommentRequestV1: CreatePostCommentRequestV1(
            (b) {
              b.content = replyText;
            },
          ),
        );
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
