import 'package:Kiffy/screen_module/comment_section_module/provider/comments_provider.dart';
import 'package:Kiffy/screen_module/comment_section_module/widget/comment_tile.dart';
import 'package:Kiffy/screen_module/my/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CommentSection extends ConsumerStatefulWidget {
  final String commentId;

  const CommentSection({
    super.key,
    required this.commentId,
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

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          // 댓글 리스트 영역
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // 댓글
                    Slidable(
                      endActionPane: ActionPane(
                        extentRatio: 0.2,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: const Color(0xffF04646),
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: const CommentTile(
                        profileImageUrl: "assets/images/test_image.png",
                        userName: "kiffy",
                        text: "hello everyone do you know who i am?",
                      ),
                    ),
                    // 대댓글
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                            extentRatio: 0.2,
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {},
                                backgroundColor: const Color(0xffF04646),
                                icon: Icons.delete,
                              ),
                            ],
                          ),
                          child: const CommentTile(
                            isReply: true,
                            profileImageUrl: "assets/images/dummy_image.jpg",
                            userName: "kiffy",
                            text: "hello everyone do you know who i am?",
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),

          /// 글 작성 영역
          SizedBox(
            height: 52,
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffF1F3F5),
                hintText: "땡땡님 게시글에 댓글 추가",
                hintStyle: textStyle.labelMedium!.apply(
                  color: Colors.grey[600],
                ),
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
                        ref
                            .read(leaveCommentProvider.notifier)
                            .postLeaveCommnet(
                              widget.commentId,
                              textController.text,
                            )
                            .then((value) {
                          textController.clear();
                        });
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
                        "post",
                        style: textStyle.labelSmall!.apply(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
