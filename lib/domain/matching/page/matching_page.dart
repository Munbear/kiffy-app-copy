import 'package:Kiffy/domain/common/preview_liked_list.dart';
import 'package:Kiffy/domain/matching/widget/matching_card.dart';
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
    final matchedUserList = ref.watch(matchedUserListProvider);
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
          /**********************************************
                              라이크 보낸 유저 리스트 
                **********************************************/
          PreviewLikedList(),

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

          /******************
               *    매칭 된 리스트  
               * ************** */
          matchedUserList != null
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: NotificationListener<ScrollUpdateNotification>(
                      onNotification: (ScrollUpdateNotification notification) {
                        print(notification);
                        return false;
                      },
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 6,
                        childAspectRatio: 0.75,
                        children: matchedUserList.list.map((matchedUser) => MatchingCard(userProfile: matchedUser)).toList(),
                      ),
                    ),
                  ),
                )
              : const Expanded(child: Center(child: Text("아직 매칭된 유져가 없습니다")))
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/matching"),
    );
  }
}
