import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final leaveCommentProvider =
    AsyncNotifierProvider.autoDispose<CreateComment, PostCommentViewV1>(
        CreateComment.new);

class CreateComment extends AutoDisposeAsyncNotifier<PostCommentViewV1> {
  @override
  Future<PostCommentViewV1> build() async {
    return PostCommentViewV1();
  }

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
}
