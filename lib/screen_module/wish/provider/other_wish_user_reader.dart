import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final otherWishUserReaderProvider =
    Provider((ref) => OtherWishUserReader(ref: ref));

class OtherWishUserReader {
  final Ref ref;

  OtherWishUserReader({required this.ref});

  Future<OtherWishUserProfileView> getOtherWishUserProfile(
      String wishId) async {
    var response = await ref
        .read(openApiProvider)
        .getWishApi()
        .apiWishV1WishDetailWishIdGet(wishId: wishId);

    return response.data!;
  }
}
