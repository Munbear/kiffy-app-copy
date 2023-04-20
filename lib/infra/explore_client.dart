
import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/explore_user_profiles_view/explore_user_profiles_view.dart';

Future<ExploreUserProfilesView> getExploreUserProfiles({String? next}) async {
  if (next != null) {
    final response = await ApiClient().dio.get(next);
    return ExploreUserProfilesView.fromJson(response.data);
  } else {
    final response = await ApiClient().dio.get("/api/explore/v1/users?offset=0&limit=10");
    return ExploreUserProfilesView.fromJson(response.data);
  }
}