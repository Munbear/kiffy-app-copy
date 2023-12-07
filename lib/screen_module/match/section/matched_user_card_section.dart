import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen/matching_detail/matched_detail_screen.dart';
import 'package:Kiffy/screen_module/match/widget/matching_card_skeleton.dart';
import 'package:Kiffy/screen_module/match/widget/matching_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:openapi/openapi.dart';

class MatchedUserCardSection extends ConsumerStatefulWidget {
  const MatchedUserCardSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MatchedUserCardSectionState();
}

class _MatchedUserCardSectionState
    extends ConsumerState<MatchedUserCardSection> {
  static const _offset = 6;

  final PagingController<int, MatchedUserView> _pagingController =
      PagingController<int, MatchedUserView>(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fecthMatchedUsers(pageKey);
    });
    super.initState();
  }

  _fecthMatchedUsers(pageKey) async {
    try {
      final res = await ref
          .read(openApiProvider)
          .getMatchApi()
          .apiMatchV2UsersGet(offset: pageKey, limit: _offset);
      List<MatchedUserView> newItems = res.data?.list.toList() ?? [];
      final isLastPage = newItems.length < _offset;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: PagedGridView<int, MatchedUserView>(
          showNewPageProgressIndicatorAsGridChild: true,
          showNewPageErrorIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
          pagingController: _pagingController,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 18,
            mainAxisSpacing: 6,
          ),
          builderDelegate: PagedChildBuilderDelegate<MatchedUserView>(
            firstPageProgressIndicatorBuilder: (context) {
              // 스켈레톤
              return const MatchingCardSkeleton();
            },
            newPageProgressIndicatorBuilder: (context) {
              // 더 불러올때
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.purple[600],
                ),
              );
            },
            itemBuilder: (context, items, index) {
              return MatchingUserCard(
                onTap: () {
                  // TODO
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return MatchedDetailScreen(matchedUser: items);
                      },
                    ),
                  );
                  // ).then((value) {
                  //   setState(() {
                  //     _pagingController.refresh();
                  //   });
                  // });
                  // context
                  //     .pushNamed(MatchedDetailScreen.routeName, extra: items)
                  //     .then(
                  //   (_) {
                  //     setState(() {
                  //       setState(() {
                  //         // TODO 매칭 제거하면 바로 없어지도록 변경 필요
                  //         _pagingController.refresh();
                  //       });
                  //     });
                  //   },
                  // );
                },
                userProfile: items,
              );
            },
          ),
        ),
      ),
    );
  }
}
