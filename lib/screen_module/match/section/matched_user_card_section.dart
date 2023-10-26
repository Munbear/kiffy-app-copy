import 'package:Kiffy/screen_module/match/widget/matching_empty_widget.dart';
import 'package:Kiffy/screen_module/match/widget/matching_user_card.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/match/widget/matching_card_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
      PagingController<int, MatchedUserView>(firstPageKey: 6);

  /// 매칭 유저들 state
  List<MatchedUserView> usersProfile = List.empty();
  // late ScrollController _scrollController;

  /// 로딩 state
  bool isLoading = true;
  bool isMoreLoading = false;
  bool hasList = true;
  bool _scrollDelay = false;

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   initMatchingUsers();
    // });

    _pagingController.addPageRequestListener((pageKey) {
      _moreMatchedUsers(pageKey);
    });
  }

  void initMatchingUsers() async {
    setState(() => isLoading = true);

    final res = await ref
        .read(openApiProvider)
        .getMatchApi()
        .apiMatchV2UsersGet(offset: 0, limit: 6);

    if (res.data!.list.toList().isEmpty) {
      setState(() {
        hasList = false;
      });
    }

    setState(() {
      usersProfile = res.data!.list.toList();
      isLoading = false;
    });
  }

  _moreMatchedUsers(pageKey) async {
    final res = await ref
        .read(openApiProvider)
        .getMatchApi()
        .apiMatchV2UsersGet(offset: pageKey, limit: _offset);
    final newItems = res.data!.list.toList();
    final isLastPage = newItems.length < _offset;
    if (isLastPage) {
      _pagingController.appendLastPage(newItems);
    } else {
      final nextPageKey = pageKey + newItems.length;
      _pagingController.appendPage(newItems, nextPageKey);
    }
  }

  // Widget loadingMatchingCard() {
  //   if (isLoading) {
  //     return const MatchingCardSkeleton();
  //   }

  //   if (usersProfile.isEmpty) {
  //     return const MatchingEmptyWidget();
  //   }

  //   return Expanded(
  //     child: Padding(
  //       padding: const EdgeInsets.only(left: 24, right: 24),
  //       child: GridView.builder(
  //         shrinkWrap: true,
  //         physics: const ScrollPhysics(),
  //         // controller: _scrollController,
  //         itemCount: usersProfile.length,
  //         scrollDirection: Axis.vertical,
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //           childAspectRatio: 0.75,
  //           crossAxisSpacing: 18,
  //           mainAxisSpacing: 6,
  //         ),
  //         itemBuilder: (context, index) {
  //           final matchedUser = usersProfile[index];
  //           return MatchingUserCard(
  //             onTap: () {
  //               //TODO
  //               // 매칭 유저 디테일 이동
  //             },
  //             userProfile: matchedUser,
  //           );
  //         },
  //       ),
  //     ),
  //     // child:
  //   );
  // }

  ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: PagedGridView<int, MatchedUserView>(
          pagingController: _pagingController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 18,
            mainAxisSpacing: 6,
          ),
          builderDelegate: PagedChildBuilderDelegate<MatchedUserView>(
            itemBuilder: (context, matchedUser, index) {
              return MatchingUserCard(
                onTap: () {
                  //TODO
                  // 매칭 유저 디테일 이동
                },
                userProfile: matchedUser,
              );
            },
          ),
        ),
      ),
    );
  }
}
