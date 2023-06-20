import 'package:Kiffy/domain/common/preview_liked_list.dart';
import 'package:Kiffy/domain/matching/widget/matching_card.dart';
import 'package:Kiffy/domain/my_page/widget/matching_more_button.dart';
import 'package:Kiffy/infra/match_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/custom_bottom_nav_bar.dart';

class MatchingPage extends ConsumerStatefulWidget {
  static String get routeLocation => "/matching";
  static String get routeName => "matching";

  const MatchingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MatchingPageState();
}

class _MatchingPageState extends ConsumerState<MatchingPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(matchedUserProfileProvider).getMatchedUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    // 매칭 리스트
    final matchedUserList = ref.watch(matchedUserListProvider);
    // print(matchedUserList);
    // 로딩
    final isLoading = ref.watch(isMatchedUserLoadedProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Image.asset(
          width: 70,
          height: 55,
          "assets/images/kiffy_logo_purple.png",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 위시 리스트
          const PreviewLikedList(),

          // 매칭 된 리스트 타이틀
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

          // 매칭 리스트
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : matchedUserList.isNotEmpty
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: GridView.count(
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 2,
                          crossAxisSpacing: 18,
                          mainAxisSpacing: 6,
                          childAspectRatio: 0.75,
                          children: matchedUserList.map((matchedUser) => MatchingCard(userProfile: matchedUser)).toList(),
                        ),
                      ),
                    )
                  : const Expanded(child: Center(child: Text("아직 매칭된 유져가 없습니다"))),

          // 더보기 버튼
          ref.read(isMatchedUserListMoreProvider.notifier).state
              ? MatchingMoreButton(
                  onClick: () => ref.read(matchedUserProfileProvider).getMatchedUsers(),
                )
              : const SizedBox()
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/matching"),
    );
  }
}
