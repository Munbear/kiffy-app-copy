import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/media_view/media_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:Kiffy/model/wish_other_profiles_view/wish_other_profiles_view.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wishClientProvider = Provider<WishClientHandler>((ref) => WishClientHandler(ref));

class WishClientHandler {
  final Ref ref;
  Dio dio;

  WishClientHandler(this.ref) : dio = ref.read(dioProvider);

  // 위시 보내기
  approveWish({required String userId}) async {
    await dio.put("/api/wish/v1/wish/approve", data: {"toUserId": userId});
  }

  // 위시 거절
  rejectWish({required String userId}) async {
    await dio.put("/api/wish/v1/wish/reject", data: {"toUserId": userId});
  }

// 나에게 위시한 사용자들 가져오기
  getWishOthersProfiles({String? next}) async {
    Response res = await dio.get("/api/wish/v1/wish/other");
    final items = WishOtherProfilesView.fromJson(res.data);
    ref.read(wishMeUsersProvider.notifier).update((state) => items.list);
  }
}

final mediaDetailProvider = StateProvider<List<MediaView>>((ref) => []);

// 받은 위시 리스트
final wishMeUsersProvider = StateProvider<List<UserProfileView>?>((ref) => []);

final wishMeListLoaded = StateProvider<bool>((ref) => false);
