import 'package:Kiffy/domain/common/preview_liked_list.dart';
import 'package:Kiffy/domain/matching/widget/matching_card.dart';
import 'package:Kiffy/infra/match_client.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/custom_bottom_nav_bar.dart';

class MatchingPage extends HookConsumerWidget {
  MatchingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchedUsersList = useState<List<UserProfileView>>([]);
    final hasNext = useState(true);
    final next = useState<String?>(null);

    final getApiAndSetStates = ({init: bool}) async {
      if (init) {
        final matchedUsersView = await getMatchedUsers();
        matchedUsersList.value = [...matchedUsersList.value, ...matchedUsersView.list];
        hasNext.value = matchedUsersView.paging.next != null;
        next.value = matchedUsersView.paging.next;

        return;
      }
    };

    useEffect(() {
      getApiAndSetStates(init: true)
        .then((value) {

      });
    }, []);

    // useEffect(() {
    //   var res = getTest().then((value) {
    //     log("=========================");
    //     log(value.toString());
    //     log("=========================");
    //   });
    // }, []);

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right:24),
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
                  children: matchedUsersList.value.map((matchedUSer) => MatchingCard()).toList(),
                ),
              ),
            ),
          ),

          // 커스텀 바텀 네비게이션 바
          // const Spacer(),
          // const CustomBottomNavigationBar()
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentPath: "/matching"),
    );
  }
}
