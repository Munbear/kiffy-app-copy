import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/explore_user_profiles_view/explore_user_profiles_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<ExploreUserProfilesView> getExploreUserProfiles({String? next}) async {
  if (next != null) {
    final response = await ApiClient().dio.get(next);
    return ExploreUserProfilesView.fromJson(response.data);
  } else {
    final response = await ApiClient().dio.get("/api/explore/v1/users?offset=0&limit=10");
    return ExploreUserProfilesView.fromJson(response.data);
  }
}

final exploreProvider = Provider<ExploreHandler>((ref) => ExploreHandler(ref));

class ExploreHandler {
  final Ref ref;

  ExploreHandler(this.ref);

  // 탐색할 유저 불러오기
  getExploreUserProfiles({String? next}) async {
    if (next != null) {
      final response = await ApiClient().dio.get(next);
      ExploreUserProfilesView? items =
          ref.watch(useruserProfilesProvider.notifier).update((state) => state = ExploreUserProfilesView.fromJson(response.data));

      return items;
    } else {
      final response = await ApiClient().dio.get("/api/explore/v1/users?offset=0&limit=10");

      ExploreUserProfilesView? items =
          ref.watch(useruserProfilesProvider.notifier).update((state) => state = ExploreUserProfilesView.fromJson(response.data));
      return items;
    }
  }
}

final useruserProfilesProvider = StateProvider<ExploreUserProfilesView?>((ref) => null);
