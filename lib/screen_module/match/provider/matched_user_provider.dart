import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/util/logger.dart';
import 'package:flutter/cupertino.dart';
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

  Future<void> cancelMatch(String matchId) async {
    ref
        .read(openApiProvider)
        .getMatchApi()
        .apiMatchV1MatchMatchIdDelete(
          matchId: matchId,
        )
        .then(
      (value) {
        logger.d("매칭 취소: $value");
        if (value.statusCode == 200) {
          final List<MatchedUserView> updateList = state.value!
              .where((element) => element.matchId != matchId)
              .toList();
          state = AsyncValue.data(updateList);
        }
      },
    );
  }
}
