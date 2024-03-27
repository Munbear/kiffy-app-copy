import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/match/provider/feed_provider.dart';
import 'package:Kiffy/util/screen_mixin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:openapi/openapi.dart';

typedef Preview = List<Map<String, dynamic>>;

class FeedSection extends ConsumerStatefulWidget {
  const FeedSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedSectionState();
}

class _FeedSectionState extends ConsumerState<FeedSection> with ScreenMixin {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  static List<String> testImages = [
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    AsyncValue<FeedPageViewV1> feedData = ref.watch(feedListProvider);
    // final feedList = feedData.valueOrNull!.posts;
    return feedData.when(
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (error, stackTrace) {
        return const SizedBox(
          child: Text("죄송합니다. 잠시우 다시 시작해주십시오"),
        );
      },
      data: (data) {
        final feedList = data.posts;
        if (kDebugMode) {
          return Expanded(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    showCommentBottomSheet();
                  },
                  child: Text("comment"),
                ),
              ],
            ),
          );
        }
        return Expanded(
          child: feedList.isNotEmpty
              ? const Center(child: Text("아직 매칭된 사용자가 없거나 게시글이 존재 하지 않습니다."))
              : RefreshIndicator(
                  onRefresh: () async {
                    return ref.refresh(feedListProvider.future);
                  },
                  color: const Color(0xff0031AA),
                  child: InViewNotifierList(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: feedList.length,
                    isInViewPortCondition: (double deltaTop, double deltaBottom,
                        double viewPortDimension) {
                      return false;
                    },
                    onListEndReached: () {
                      print('더 불러 오기');
                    },
                    builder: (BuildContext context, int index) {
                      final feed = feedList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      feed.author.profileImageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                    // child: Image.asset(
                                    //   "assets/images/test_image.png",
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ),
                                Gab.width8,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      feed.author.name,
                                      // "User name",
                                      style: textStyle.bodyMedium,
                                    ),
                                    Text(
                                      "${feed.createdAt.hour}",
                                      // "10 minute ago",
                                      style: textStyle.labelMedium,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    showMatchingCancelBottomSheet();
                                  },
                                  icon: const Icon(Icons.more_horiz),
                                ),
                              ],
                            ),
                          ),

                          // 피드 사진
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: PageView(
                                children: feed.medias.map(
                                  (item) {
                                    return Image.network(
                                      item.url,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),

                          // 댓글
                          GestureDetector(
                            onTap: () {
                              showCommentBottomSheet();
                            },
                            child: Row(
                              children: [
                                Gab.width16,
                                SvgPicture.asset("assets/svg/icn_comment.svg"),
                                Gab.width4,
                                Text("6"),
                              ],
                            ),
                          ),

                          Gab.height4,
                          // 피드 글
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(feed.content),
                          ),

                          Gab.height12,
                          // 댓글
                          GestureDetector(
                            onTap: () {
                              showCommentBottomSheet();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                "View all comments",
                                style: textStyle.labelMedium!
                                    .apply(color: Colors.grey[500]),
                              ),
                            ),
                          ),
                          Gab.height4,

                          // 댓글 미리보기
                          ...feed.firstComments.map(
                            (previewComment) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      previewComment.author.name,
                                      style: textStyle.labelLarge,
                                    ),
                                    Gab.width8,
                                    Text(
                                      previewComment.content,
                                      style: textStyle.labelMedium!
                                          .apply(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        ],
                      );
                    },
                  ),
                  // child: ListView.builder(
                  //   itemCount: feedList.length,
                  //   physics: const BouncingScrollPhysics(),
                  //   itemBuilder: (context, index) {
                  //     final feed = feedList[index];
                  //     return Column(
                  //       crossAxisAlignment: CrossAxisAlignment.stretch,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 16, vertical: 12),
                  //           child: Row(
                  //             children: [
                  //               Container(
                  //                 width: 36,
                  //                 height: 36,
                  //                 decoration: const BoxDecoration(
                  //                     shape: BoxShape.circle),
                  //                 child: ClipRRect(
                  //                   borderRadius: BorderRadius.circular(50),
                  //                   child: Image.asset(
                  //                     "assets/images/test_image.png",
                  //                     fit: BoxFit.cover,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Gab.width8,
                  //               Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     "User name",
                  //                     style: textStyle.bodyMedium,
                  //                   ),
                  //                   Text(
                  //                     "10 minute ago",
                  //                     style: textStyle.labelMedium,
                  //                   ),
                  //                 ],
                  //               ),
                  //               const Spacer(),
                  //               IconButton(
                  //                 onPressed: () {
                  //                   showMatchingCancelBottomSheet();
                  //                 },
                  //                 icon: const Icon(Icons.more_horiz),
                  //               ),
                  //             ],
                  //           ),
                  //         ),

                  //         // 피드 사진
                  //         Container(
                  //           margin: const EdgeInsets.only(bottom: 8),
                  //           child: AspectRatio(
                  //             aspectRatio: 1 / 1,
                  //             child: PageView(
                  //               children: feed.medias.map(
                  //                 (item) {
                  //                   return Image.network(item.url,
                  //                       fit: BoxFit.cover);
                  //                 },
                  //               ).toList(),
                  //             ),
                  //           ),
                  //         ),

                  //         // 댓글
                  //         GestureDetector(
                  //           onTap: () {
                  //             showCommentBottomSheet();
                  //           },
                  //           child: Row(
                  //             children: [
                  //               Gab.width16,
                  //               SvgPicture.asset("assets/svg/icn_comment.svg"),
                  //               Gab.width4,
                  //               Text("6"),
                  //             ],
                  //           ),
                  //         ),

                  //         Gab.height4,
                  //         // 피드 글
                  //         const Padding(
                  //           padding: EdgeInsets.symmetric(horizontal: 16),
                  //           child: Text(
                  //             "Is there anyone you're meeting tonight? I'm bored. Is there anyone you're meeting tonight? I'm bored. Is there anyone you're meeting tonight? I'm bored. Is there ...",
                  //           ),
                  //         ),

                  //         Gab.height12,
                  //         // 댓글
                  //         GestureDetector(
                  //           onTap: () {
                  //             showCommentBottomSheet();
                  //           },
                  //           child: Padding(
                  //             padding: const EdgeInsets.only(left: 16),
                  //             child: Text(
                  //               "View all comments",
                  //               style: textStyle.labelMedium!
                  //                   .apply(color: Colors.grey[500]),
                  //             ),
                  //           ),
                  //         ),
                  //         Gab.height4,

                  //         // 댓글 미리보기
                  //         ...feed.firstComments.map(
                  //           (previewComment) {
                  //             return Padding(
                  //               padding: const EdgeInsets.only(left: 16),
                  //               child: Row(
                  //                 children: [
                  //                   Text(
                  //                     "kiffy",
                  //                     style: textStyle.labelLarge,
                  //                   ),
                  //                   Gab.width8,
                  //                   Text(
                  //                     "Hello world",
                  //                     style: textStyle.labelMedium!
                  //                         .apply(color: Colors.grey[700]),
                  //                   ),
                  //                 ],
                  //               ),
                  //             );
                  //           },
                  //         ).toList(),
                  //       ],
                  //     );
                  //   },
                  // ),
                ),
        );
      },
    );
  }
}
