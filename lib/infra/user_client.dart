import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/user_status_view/user_status_view.dart';

Future<UserStatusView> getUserStatus() async {
  final response = await ApiClient().dio.get("/api/view/user/v1/my/status");

  return UserStatusView.fromJson(response.data);
}
