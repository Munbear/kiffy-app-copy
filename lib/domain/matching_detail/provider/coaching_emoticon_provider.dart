import 'package:Kiffy/infra/api_client.dart';

Future<void> getCoachingEmogi(matchId) async {
  final res = await ApiClient().dio.get("/api/match/v1/emoji?matchId=$matchId}");

  print(res.data);
}
