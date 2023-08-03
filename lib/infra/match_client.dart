import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/matched_user_profiles_view/matched_user_profiles_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final matchedUserProfileProvider = Provider<MatchedUserProfileHandler>((ref) => MatchedUserProfileHandler(ref));

class MatchedUserProfileHandler {
  Ref ref;
  Dio dio;

  MatchedUserProfileHandler(this.ref) : dio = ref.read(dioProvider);

  // 매칭된 유저 리스트
  getMatchedUsers(offset, limit) async {
    print(ref.read(isMatchedUserListMoreProvider));
    if (ref.read(isMatchedUserListMoreProvider)) {
      final res = await dio.get("/api/match/v1/users", queryParameters: {"offset": offset, "limit": limit});

      MatchedUserProfilesView item = MatchedUserProfilesView.fromJson(res.data);

      // 더보기 버튼 유출 여부
      if (item.paging.next == null) ref.read(isMatchedUserListMoreProvider.notifier).update((state) => state = false);

      ref.read(matchedUserListProvider.notifier).update((state) => state = [...state, ...item.list]);

      ref.read(isMatchedUserLoadedProvider.notifier).state = false;
    }
  }
}

// 매칭된 유저 리스트
final matchedUserListProvider = StateProvider<List<UserProfileView>>((ref) => []);

// 로딩 상태
final isMatchedUserLoadedProvider = StateProvider<bool>((ref) => true);

// 더보기 버튼 상태
final isMatchedUserListMoreProvider = StateProvider<bool>((ref) => true);

// 매칭 유저 상세 정보 프로바이더
final matchedUserDetailProvider = StateProvider<UserProfileView?>((ref) => null);
