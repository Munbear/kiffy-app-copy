import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/matched_user_profiles_view/matched_user_profiles_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<MatchedUserProfilesView> getMatchedUsers({String? next = null}) async {
  if (next != null) {
    final response = await ApiClient().dio.get(next);
    return MatchedUserProfilesView.fromJson(response.data);
  } else {
    final response = await ApiClient().dio.get("/api/match/v1/users?offset=0&limit=6");
    return MatchedUserProfilesView.fromJson(response.data);
  }
}

final matchedUserProfileProvider = Provider<MatchedUserProfileHandler>((ref) => MatchedUserProfileHandler(ref));

class MatchedUserProfileHandler {
  final Ref ref;

  MatchedUserProfileHandler(this.ref);

  // 매칭된 유저 불러오기
  getMatchedUsers({String? next = null}) async {
    if (next != null) {
      final response = await ApiClient().dio.get(next);
      MatchedUserProfilesView? items = ref.watch(matchedUserListProvider.notifier).update((state) => MatchedUserProfilesView.fromJson(response.data));

      return items;
    } else {
      final response = await ApiClient().dio.get("/api/match/v1/users?offset=0&limit=6");

      MatchedUserProfilesView? items = ref.watch(matchedUserListProvider.notifier).update((state) => MatchedUserProfilesView.fromJson(response.data));

      return items;
    }
  }
}

final matchedUserListProvider = StateProvider<MatchedUserProfilesView?>((ref) => null);
