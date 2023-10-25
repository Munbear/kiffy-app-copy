import 'package:Kiffy/screen_module/match/widget/matching_empty_widget.dart';
import 'package:Kiffy/screen_module/match/widget/matching_user_card.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/match/widget/matching_card_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class MatchedUserCardSection extends ConsumerStatefulWidget {
  const MatchedUserCardSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MatchedUserCardSectionState();
}

class _MatchedUserCardSectionState
    extends ConsumerState<MatchedUserCardSection> {
  /// 매칭 유저들 state
  List<MatchedUserView> usersProfile = List.empty();
  late ScrollController _scrollController;

  /// 로딩 state
  bool isLoading = true;
  bool isMoreLoading = false;
  bool hasList = true;
  bool _scrollDelay = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getMatchingUsers(0, 6);
    });

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent &&
            hasList &&
            !_scrollDelay) {
          _scrollDelay = true;
          getMatchingUsers(usersProfile.length, 6);
          _scrollDelay = false;
        }
      });
  }

  void getMatchingUsers(offset, limit) async {
    setState(() => isLoading = true);
    final res = await ref
        .read(openApiProvider)
        .getMatchApi()
        .apiMatchV2UsersGet(offset: offset, limit: limit);

    if (res.data!.list.toList().isEmpty) {
      setState(() {
        hasList = false;
      });
    }

    setState(() {
      usersProfile = [...usersProfile, ...res.data!.list.toList()];
      isLoading = false;
    });
  }

  Widget loadingMatchingCard() {
    if (isLoading) {
      return const MatchingCardSkeleton();
    }

    if (usersProfile.isEmpty) {
      return const MatchingEmptyWidget();
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          controller: _scrollController,
          itemCount: usersProfile.length,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 18,
            mainAxisSpacing: 6,
          ),
          itemBuilder: (context, index) {
            final matchedUser = usersProfile[index];
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// 캡션
          const Padding(
            padding: EdgeInsets.only(left: 26, top: 12),
            child: Text(
              "Matches",
              style: TextStyle(
                color: Color(0xff494949),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// 리스트
          loadingMatchingCard(),
          // 더보기 로딩
          if (isMoreLoading)
            const SizedBox(
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
