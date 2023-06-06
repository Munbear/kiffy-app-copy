import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/matched_user_profiles_view/matched_user_profiles_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final matchedUserProfileProvider = Provider<MatchedUserProfileHandler>((ref) => MatchedUserProfileHandler(ref));

class MatchedUserProfileHandler {
  final Ref ref;

  MatchedUserProfileHandler(this.ref);

  // 매칭된 유저 리스트
  getMatchedUsers() async {
    final res = await ApiClient().dio.get("/api/match/v1/users?offset=${ref.read(matchedUserListProvider.notifier).state.length}&limit=4");

    MatchedUserProfilesView test = MatchedUserProfilesView.fromJson(res.data);

    if (test.paging.next == null) ref.read(isMatchedUserListMoreProvider.notifier).state = false;

    ref.read(matchedUserListProvider.notifier).update((state) => state = [...state, ...test.list]);

    ref.read(isMatchedUserLoadedProvider.notifier).state = false;
  }
}

// 매칭된 유저 리스트
final matchedUserListProvider = StateProvider<List<UserProfileView>>((ref) => []);

// 로딩 상태
final isMatchedUserLoadedProvider = StateProvider<bool>((ref) => true);

// 더보기 버튼 상태
final isMatchedUserListMoreProvider = StateProvider<bool>((ref) => true);
