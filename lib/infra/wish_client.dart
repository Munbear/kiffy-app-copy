import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final wishClientProvider =
    Provider<WishClientHandler>((ref) => WishClientHandler(ref));

class WishClientHandler {
  final Ref ref;
  Dio dio;

  WishClientHandler(this.ref) : dio = ref.read(dioProvider);

  // 위시 보내기
  approveWish({required String userId}) async {
    await ref.read(openApiProvider).getWishApi().apiWishV1WishApprovePut(wishApproveRequest: WishApproveRequest((b) {
      b.toUserId = userId;
    }));
  }

  // 위시 거절
  rejectWish({required String userId}) async {
    await ref.read(openApiProvider).getWishApi().apiWishV1WishRejectPut(wishRejectRequest: WishRejectRequest((b) {
      b.toUserId = userId;
    }));
  }

// 나에게 위시한 사용자들 가져오기
  getWishOthersProfiles({String? next}) async {
    var response = await ref.read(openApiProvider).getWishApi().apiWishV1WishOtherGet();
    ref.read(wishMeUsersProvider.notifier).update((state) => response.data!.list!.toList());
  }
}

final mediaDetailProvider = StateProvider<List<MediaView>>((ref) => []);

// 받은 위시 리스트
final wishMeUsersProvider = StateProvider<List<UserProfileView>?>((ref) => []);

final wishMeListLoaded = StateProvider<bool>((ref) => false);
