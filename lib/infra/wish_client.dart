import 'package:Kiffy/domain/common/user_profile_card.dart';
import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/media_view/media_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:Kiffy/model/wish_other_profiles_view/wish_other_profiles_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wishClientProvider = Provider<WishClientHandler>((ref) => WishClientHandler(ref));

class WishClientHandler {
  final Ref ref;

  WishClientHandler(this.ref);

// 위시 보내기
  Future<void> approveWish({required String userId}) async {
    await ApiClient().dio.put("/api/wish/v1/wish/approve", data: {"toUserId": userId});
  }

  // 위시 거절
  Future<void> rejectWish({required String userId}) async {
    await ApiClient().dio.put("/api/wish/v1/wish/reject", data: {"toUserId": userId});
  }

// 나에게 위시한 사용자들 가져오기
  getWishOthersProfiles({String? next}) async {
    if (next != null) {
      final response = await ApiClient().dio.get(next);
      WishOtherProfilesView? items = ref.watch(wishMeUsersProvider.notifier).update((state) => WishOtherProfilesView.fromJson(response.data));
      return items;
    } else {
      final response = await ApiClient().dio.get("/api/wish/v1/wish/other");
      WishOtherProfilesView? items = ref.watch(wishMeUsersProvider.notifier).update((state) => WishOtherProfilesView.fromJson(response.data));
      return items;
    }
    // }

    // getWishMeList() async {
    //   if (ref.read(wishMeListLoaded.notifier).state) return;

    //   ref.read(wishMeListLoaded.notifier).update((state) => state = true);

    //   // api 호출
    //   final res = await ApiClient().dio.get("/api/wish/v1/wish/other");
    //   await Future.delayed(const Duration(milliseconds: 1500));

    //   List<UserProfileView>? items = WishOtherProfilesView.fromJson(res.data).list;

    //   print(items);

    //   ref.read(wishMeUsersProvider.notifier).update((state) => items);

    //   ref.read(wishMeListLoaded.notifier).update((state) => false);
  }
}

final mediaDetailProvider = StateProvider<List<MediaView>>((ref) => []);

final wishMeUsersProvider = StateProvider<WishOtherProfilesView?>((ref) => null);

// final wishMeUsersProvider = StateProvider<List<UserProfileView>>((ref) => []);

final wishMeListLoaded = StateProvider<bool>((ref) => false);
