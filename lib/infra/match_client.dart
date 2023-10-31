// import 'package:Kiffy/infra/api_client.dart';
// import 'package:Kiffy/infra/openapi_client.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:openapi/openapi.dart';

// final matchedUserProfileProvider = Provider<MatchedUserProfileHandler>((ref) => MatchedUserProfileHandler(ref));

// class MatchedUserProfileHandler {
//   Ref ref;
//   Dio dio;

//   MatchedUserProfileHandler(this.ref) : dio = ref.read(dioProvider);

//   // 매칭된 유저 리스트
//   getMatchedUsers(offset, limit) async {
//     print("isTrue???");
//     print(ref.read(isMatchedUserListMoreProvider));
//     if (ref.read(isMatchedUserListMoreProvider)) {
//       var response = await ref.read(openApiProvider).getMatchApi().apiMatchV2UsersGet(offset: offset, limit: limit);

//       // 더보기 버튼 유출 여부
//       if (response.data!.paging.hasNext == false) {
//         ref.read(isMatchedUserListMoreProvider.notifier).update((state) => state = false);
//       }

//       ref.read(matchedUserListProvider.notifier).update((state) => state = [...state, ...response.data!.list.toList().map((e) => e.userProfile)]);

//       ref.read(isMatchedUserLoadedProvider.notifier).state = false;
//     }
//   }
// }

// // 매칭된 유저 리스트
// final matchedUserListProvider = StateProvider<List<UserProfileView>>((ref) => []);

// // 로딩 상태
// final isMatchedUserLoadedProvider = StateProvider<bool>((ref) => true);

// // 더보기 버튼 상태
// final isMatchedUserListMoreProvider = StateProvider<bool>((ref) => true);

// // 매칭 유저 상세 정보 프로바이더
// final matchedUserDetailProvider = StateProvider<UserProfileView?>((ref) => null);
