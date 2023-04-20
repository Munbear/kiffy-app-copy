import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/matched_user_profiles_view/matched_user_profiles_view.dart';

Future<MatchedUserProfilesView> getMatchedUsers({String? next = null}) async {
  if (next != null) {
    final response = await ApiClient().dio.get(next);
    return MatchedUserProfilesView.fromJson(response.data);
  } else {
    final response = await ApiClient().dio.get("/api/match/v1/users?offset=0&limit=6");
    return MatchedUserProfilesView.fromJson(response.data);
  }
}
