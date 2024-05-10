import 'package:Kiffy/screen_module/comment_section/provider/comments_provider.dart';
import 'package:Kiffy/screen_module/comment_section/widget/comment_tile.dart';
import 'package:Kiffy/screen_module/my/provider/my_provider.dart';
import 'package:Kiffy/util/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:openapi/openapi.dart';

enum CommentType { comment, reply }

class CommentSection extends ConsumerStatefulWidget {
  final String postId;
  final String author;

  const CommentSection({
    super.key,
    required this.author,
    required this.postId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentSectionState();
}

class _CommentSectionState extends ConsumerState<CommentSection> {
  late final TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final my = ref.read(myProvider);
    final textStyle = Theme.of(context).textTheme;
    AsyncValue<List<PostCommentViewV1>> comments =
        ref.watch(commentProvider(widget.postId));
    comments.copyWithPrevious(comments);
    return comments.when(
      error: (e, errorStack) {
        logger.e(e);
        return const SizedBox();
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (data) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              // 댓글 리스트 영역
              Expanded(
                child: data.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "text.tag.write_the_first_comment".tr(),
                              style: textStyle.titleLarge!.apply(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "text.tag.there_are_no_comments_yet".tr(),
                              style: textStyle.titleSmall!.apply(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final comment = data[index];
                          return Column(
                            children: [
                              // 댓글
                              Slidable(
                                key: ValueKey(comment.id),
                                endActionPane: ActionPane(
                                  extentRatio: 0.2,
                                  motion: const DrawerMotion(),
                                  dragDismissible: true,
                                  dismissible: DismissiblePane(
                                    onDismissed: () {
                                      ref
                                          .read(commentProvider(widget.postId)
                                              .notifier)
                                          .deleteComment(comment.id);
                                    },
                                  ),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        ref
                                            .read(commentProvider(widget.postId)
                                                .notifier)
                                            .deleteComment(comment.id);
                                      },
                                      backgroundColor: const Color(0xffF04646),
                                      icon: Icons.delete,
                                    ),
                                  ],
                                ),
                                child: CommentTile(
                                  onTap: () {
                                    ref
                                        .read(commentHintTextState.notifier)
                                        .update(
                                          (state) => state = CommentInfo(
                                            commentId: comment.id,
                                            author: comment.author.name,
                                          ),
                                        );
                                  },
                                  commentType: comment.parentId != null
                                      ? CommentType.reply
                                      : CommentType.comment,
                                  profileImageUrl:
                                      comment.author.profileImageUrl,
                                  userName: comment.author.name,
                                  text: comment.content,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
              ),

              /// 글 작성 영역
              SizedBox(
                height: 52,
                child: Consumer(builder: (context, ref, child) {
                  final replyTo = ref.watch(commentHintTextState);
                  return TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffF1F3F5),
                      hintText: replyTo?.author != null
                          ? "${"text.tag.reply_to".tr()}${replyTo?.author}${"text.tag.s_comment".tr()}"
                          : "${"text.tag.leave_a_comment_on".tr()} ${widget.author}${"text.tag_s post".tr()}",
                      hintStyle: textStyle.labelMedium!
                          .apply(color: Colors.grey[600], heightDelta: 0.5),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: InputBorder.none,
                      prefixIcon: Align(
                        widthFactor: 1,
                        heightFactor: 1,
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              my.requireValue.profile!.medias.first.url,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        maxHeight: 32,
                        maxWidth: 96,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Align(
                          widthFactor: 1,
                          heightFactor: 1,
                          child: ElevatedButton(
                            onPressed: () {
                              replyTo?.author != null
                                  // 대댓글
                                  ? ref
                                      .read(commentProvider(widget.postId)
                                          .notifier)
                                      .postLeaveReply(
                                        postId: widget.postId,
                                        commentId: replyTo!.commentId,
                                        replyText: textController.text,
                                      )
                                      .then(
                                      (value) {
                                        textController.clear();
                                        ref.invalidate(commentHintTextState);
                                      },
                                    )
                                  // 댓글
                                  : ref
                                      .read(commentProvider(widget.postId)
                                          .notifier)
                                      .postLeaveCommnet(
                                        widget.postId,
                                        textController.text,
                                      )
                                      .then(
                                      (value) {
                                        textController.clear();
                                      },
                                    );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0031AA),
                              foregroundColor: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "text.tag.post".tr(),
                              style: textStyle.labelSmall!
                                  .apply(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
