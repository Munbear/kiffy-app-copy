import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/common/button/widget/main_blue_button.dart';
import 'package:Kiffy/screen_module/main_screen_module/provider/main_screen_provider.dart';
import 'package:Kiffy/screen_module/match/provider/community_provider.dart';
import 'package:Kiffy/util/convert_time.dart';
import 'package:Kiffy/util/screen_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:openapi/openapi.dart';

class FeedSection extends ConsumerStatefulWidget {
  const FeedSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedSectionState();
}

class _FeedSectionState extends ConsumerState<FeedSection>
    with ScreenMixin, AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final textStyle = Theme.of(context).textTheme;
    AsyncValue<List<PostViewV1>> feedData = ref.watch(communityProvider);
    return feedData.when(
      loading: () {
        return const _FeedSkeleton();
      },
      error: (error, stackTrace) {
        return const SizedBox(
          child: Text("죄송합니다. 잠시우 다시 시작해주십시오"),
        );
      },
      data: (data) {
        final feedList = data;
        final isLoading = ref.watch(loading2);
        final nextKey = ref.watch(feedPagingState);
        return Expanded(
          child: feedList.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do "wish" and\ntalk to various friends!',
                      style: textStyle.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    Gab.height16,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: MainBlueButton(
                        onTap: () {
                          ref.read(mainPageController).jumpToPage(0);
                          ref
                              .read(currentPage.notifier)
                              .update((state) => state = 0);
                        },
                        text: "Go to wish",
                      ),
                    ),
                  ],
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    return ref.refresh(communityProvider.future);
                  },
                  color: const Color(0xff0031AA),
                  child: InViewNotifierList(
                    endNotificationOffset: 10,
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: feedList.length,
                    isInViewPortCondition: (double deltaTop, double deltaBottom,
                        double viewPortDimension) {
                      return false;
                    },
                    onListEndReached: () async {
                      if (!isLoading) {
                        ref.read(loading2.notifier).update((state) => true);
                        ref
                            .read(communityProvider.notifier)
                            .updateFeedList(nextPage: nextKey);
                        await Future.delayed(const Duration(milliseconds: 2000))
                            .then((value) {
                          ref.read(loading2.notifier).update((state) => false);
                        });
                      }
                    },
                    builder: (BuildContext context, int index) {
                      final feed = feedList[index];
                      final createTime =
                          ConvertTime.formatTimeDifference(feed.createdAt);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                /// 작성지 프로필 이미지
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      feed.author.profileImageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Gab.width8,

                                /// 작성자 닉네임 및 업로드 시간
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      feed.author.name,
                                      style: textStyle.bodyMedium,
                                    ),
                                    Text(
                                      createTime,
                                      style: textStyle.labelMedium,
                                    ),
                                  ],
                                ),
                                const Spacer(),

                                //  피드 옵션
                                IconButton(
                                  onPressed: () {
                                    showFeedOptionBottomSheet(
                                      feed.id,
                                      feed.author.id,
                                    );
                                  },
                                  icon: const Icon(Icons.more_horiz),
                                ),
                              ],
                            ),
                          ),

                          // 피드 사진
                          if (feed.medias.isNotEmpty)
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
                              /// 댓글 바텀 시트 열기
                              showCommentBottomSheet(feed.id, feed.author.name);
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Gab.width16,
                                  SvgPicture.asset(
                                    "assets/svg/icn_comment.svg",
                                  ),
                                  Gab.width4,
                                  feed.firstComments.isEmpty
                                      ? Text(
                                          "Write the first Comment",
                                          style: textStyle.labelSmall!
                                              .apply(color: Colors.grey[500]),
                                        )
                                      : Text("${feed.commentCount}"),
                                ],
                              ),
                            ),
                          ),

                          Gab.height4,
                          // 피드 글
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(feed.content),
                          ),

                          // 댓글
                          if (feed.firstComments.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                showCommentBottomSheet(
                                    feed.id, feed.author.name);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 12),
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
                ),
        );
      },
    );
  }
}

class _FeedSkeleton extends StatelessWidget {
  const _FeedSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: const [
        ShimmerEffect(
          duration: Duration(milliseconds: 1200),
        ),
      ],
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  color: Colors.grey[300],
                ),
              ),
              Gab.height16,
              Container(
                margin: const EdgeInsets.only(left: 16),
                width: 200,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Gab.height24,
              Container(
                margin: const EdgeInsets.only(left: 16),
                width: 300,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Gab.height8,
              Container(
                margin: const EdgeInsets.only(left: 16),
                width: 200,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Gab.height32,
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  color: Colors.grey[300],
                ),
              ),
              Gab.height16,
              Container(
                margin: const EdgeInsets.only(left: 16),
                width: 200,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Gab.height24,
              Container(
                margin: const EdgeInsets.only(left: 16),
                width: 300,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Gab.height8,
              Container(
                margin: const EdgeInsets.only(left: 16),
                width: 200,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
