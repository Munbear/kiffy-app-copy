import 'package:Kiffy/domain/matching/widget/matching_card.dart';
import 'package:Kiffy/infra/openapi_client.dart';
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

  /// 로딩 state
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final res = await ref
          .read(openApiProvider)
          .getMatchApi()
          .apiMatchV2UsersGet(offset: 0, limit: 5);

      setState(() {
        usersProfile = res.data!.list.toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///
        const Padding(
          padding: EdgeInsets.only(left: 24, top: 12),
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
        // TODO
        // 유저 카드 컴포넌트
        // 스켈레톤 컴포넌트
        // more 컴포넌트
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 24, right: 24),
        //     child: GridView.count(
        //       scrollDirection: Axis.vertical,
        //       crossAxisCount: 2,
        //       crossAxisSpacing: 18,
        //       mainAxisSpacing: 6,
        //       childAspectRatio: 0.75,
        //       children: usersProfile.map((matchedUser) {
        //         return MatchingCard(userProfile: matchedUser);
        //       }).toList(),
        //     ),
        //   ),
        // )
        // isLoading
        //     ? const Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     // 매칭 리스트
        //     : usersProfile.isNotEmpty
        //         ? Expanded(
        //             child: Padding(
        //               padding: const EdgeInsets.only(left: 24, right: 24),
        //               child: GridView.count(
        //                 scrollDirection: Axis.vertical,
        //                 crossAxisCount: 2,
        //                 crossAxisSpacing: 18,
        //                 mainAxisSpacing: 6,
        //                 childAspectRatio: 0.75,
        //                 children: usersProfile.map((matchedUser) {
        //                   return MatchingCard(userProfile: matchedUser);
        //                 }).toList(),
        //               ),
        //             ),
        //           )
        //         : const Expanded(child: Center(child: Text("아직 매칭된 유져가 없습니다"))),

        // isMore
        //     ? MatchingMoreButton(
        //         onClick: () => ref
        //             .read(matchedUserProfileProvider)
        //             .getMatchedUsers(matchedUserList.length, 6),
        //       )
        //     : const SizedBox()
      ],
    );
  }
}
