import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen/matched_detail_list_screen/matched_detail_list_screen.dart';
import 'package:Kiffy/screen/matching_detail/matched_detail_screen.dart';
import 'package:Kiffy/screen_module/common/google_admob/admob_banner_widget.dart';
import 'package:Kiffy/screen_module/match/provider/matched_user_provider.dart';
import 'package:Kiffy/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreviewMatchingUserSection extends ConsumerStatefulWidget {
  const PreviewMatchingUserSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PreviewMatchingUserSectionState();
}

class _PreviewMatchingUserSectionState
    extends ConsumerState<PreviewMatchingUserSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final matchedUsers = ref.watch(matchedUsersProvider);
    return matchedUsers.when(
      error: (error, errorStack) {
        logger.d("$error");
        return const SizedBox();
      },
      loading: () => const _MatchedUserPreviewSkeleton(),
      data: (data) {
        final matchedUserList = data;
        return matchedUserList.isEmpty
            ? const AdmobBannerWidget()
            : SizedBox(
                height: 96,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  itemCount: matchedUserList.length + 1,
                  itemBuilder: (context, index) {
                    /// 매칭된 유저 상세보기 화면 버튼
                    if (index == matchedUserList.length) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const MatchedDetailListScreen();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey[200]!,
                                  ),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.grey[400]!,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 72,
                              child: Text(
                                "more",
                                style: textStyle.titleSmall,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    final matchedUser = matchedUserList[index];

                    /// 매칭된 유저 Preview UI
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return MatchedDetailScreen(
                                    matchedUser: matchedUser,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 64,
                            height: 64,
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              // 프로필 확인 했을 때
                              // color: Colors.grey[300]!,
                              // 프로필 확인 안했을 때
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xffBA00ff),
                                  Color(0xff0031AA),
                                ],
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  matchedUser.userProfile.medias.first.url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 72,
                          child: Text(
                            matchedUser.userProfile.name,
                            style: textStyle.titleSmall,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Gab.width12;
                  },
                ),
              );
      },
    );
  }
}

class _MatchedUserPreviewSkeleton extends StatelessWidget {
  const _MatchedUserPreviewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: List.generate(6, (index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.grey[200],
            )
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 1500.ms),
          );
        }),
      ),
    );
  }
}
