import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final wishManagerProvider = Provider((ref) => WishManager(ref: ref));

class WishManager {
  final Ref ref;

  WishManager({required this.ref});

  Future<void> approve(String toUserId) async {
    await ref.read(openApiProvider).getWishApi().apiWishV1WishApprovePut(
        wishApproveRequest: WishApproveRequest((b) {
      b.toUserId = toUserId;
    }));
  }

  Future<void> reject(String toUserId) async {
    await ref.read(openApiProvider).getWishApi().apiWishV1WishRejectPut(
      wishRejectRequest: WishRejectRequest(
        (b) {
          b.toUserId = toUserId;
        },
      ),
    );
  }
}
