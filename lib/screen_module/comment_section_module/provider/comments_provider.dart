import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

// 댓글 불러오기
final commentsProvider = AsyncNotifierProvider.autoDispose
    .family<Comments, PostCommentPageView, String>(
  Comments.new,
);

class Comments
    extends AutoDisposeFamilyAsyncNotifier<PostCommentPageView, String> {
  @override
  Future<PostCommentPageView> build(String commentId) async {
    final data = await ref.read(openApiProvider).getPostApi().getPostComments(
          postId: commentId,
          getCommentsRequestV1: GetCommentsRequestV1(),
        );
    return data.data!;
  }

  // 댓글창 없데이트
  Future<PostCommentPageView> updateComments(String commentId) async {
    final data = await ref.read(openApiProvider).getPostApi().getPostComments(
          postId: commentId,
          getCommentsRequestV1: GetCommentsRequestV1(),
        );
    return data.data!;
  }
}
