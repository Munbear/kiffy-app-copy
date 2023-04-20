import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/wish_other_profiles_view/wish_other_profiles_view.dart';

Future<WishOtherProfilesView> getWishOthersProfiles({String? next}) async {
  if (next != null) {
    final response = await ApiClient().dio.get(next);
    return WishOtherProfilesView.fromJson(response.data);
  } else {
    final response = await ApiClient().dio.get("/api/wish/v1/wish/other");
    return WishOtherProfilesView.fromJson(response.data);
  }
}
