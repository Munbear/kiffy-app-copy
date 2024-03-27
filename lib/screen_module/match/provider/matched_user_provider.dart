import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final matchedUsersProvider =
    AsyncNotifierProvider.autoDispose<MatchedUsers, List<MatchedUserView>>(
        MatchedUsers.new);

class MatchedUsers extends AutoDisposeAsyncNotifier<List<MatchedUserView>> {
  @override
  Future<List<MatchedUserView>> build() async {
    final res = await ref
        .read(openApiProvider)
        .getMatchApi()
        .apiMatchV2UsersGet(offset: 0, limit: 8);
    return res.data?.list.toList() ?? [];
  }
}
