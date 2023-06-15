import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/infra/match_client.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> getCoachingEmogi(matchId) async {
  final res = await ApiClient().dio.get("/api/match/v1/emoji?matchId=$matchId}");

  print(res.data);
}

// final testEmoji = FutureProvider((ref) async {
//   final res = await ApiClient().dio.get("/api/match/v1/emoji?matchId=${ref.read(matchedUserDetailProvider.notifier).state!.id}}");
// });


// final myProfileProvider = FutureProvider((ref) async {
//   final res = await ApiClient().dio.get("/api/view/user/v1/my/profile");

//   return UserProfileView.fromJson(res.data);
// });