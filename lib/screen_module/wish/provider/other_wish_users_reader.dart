import 'dart:async';

import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final otherWishUsersReaderProvider = AutoDisposeAsyncNotifierProvider<
    OtherWishUsersReaderProvider,
    OtherWishUsers>(OtherWishUsersReaderProvider.new);

class OtherWishUsers {
  String? offsetWishId;
  bool hasNext = true;
  List<OtherWishUserProfileView> otherWishes = List.empty();

  OtherWishUsers({
    required this.offsetWishId,
    required this.hasNext,
    required this.otherWishes,
  });

  factory OtherWishUsers.empty() {
    return OtherWishUsers(
      offsetWishId: null,
      hasNext: true,
      otherWishes: [],
    );
  }

  factory OtherWishUsers.from(
      OtherWishUsers? before, OtherWishUserProfilePagingView view) {
    if (before == null) {
      return OtherWishUsers(
        offsetWishId: view.list.lastOrNull?.id ?? before?.offsetWishId,
        hasNext: view.paging.hasNext,
        otherWishes: view.list.toList(),
      );
    }

    if (view.list.isNotEmpty) {
      return OtherWishUsers(
          hasNext: view.paging.hasNext,
          offsetWishId: view.list.lastOrNull?.id ?? before.offsetWishId,
          otherWishes: [
            ...before.otherWishes,
            ...view.list,
          ]);
    } else {
      return OtherWishUsers(
        hasNext: view.paging.hasNext,
        offsetWishId: before.offsetWishId,
        otherWishes: before.otherWishes,
      );
    }
  }

  factory OtherWishUsers.removeUserId(OtherWishUsers before, String userId) {
    var beforeOtherWishes = before.otherWishes;
    beforeOtherWishes
        .removeWhere((element) => element.userProfile.id == userId);

    return OtherWishUsers(
      offsetWishId: before.offsetWishId,
      hasNext: before.hasNext,
      otherWishes: beforeOtherWishes,
    );
  }
}

class OtherWishUsersReaderProvider
    extends AutoDisposeAsyncNotifier<OtherWishUsers> {
  int limit = 15;

  @override
  Future<OtherWishUsers> build() async {
    var response =
        await ref.read(openApiProvider).getWishApi().apiWishV2WishOtherGet(
              offsetWishId: null,
              limit: limit,
            );

    return OtherWishUsers(
      offsetWishId: response.data!.list.lastOrNull?.id,
      hasNext: response.data!.paging.hasNext,
      otherWishes: response.data!.list.toList(),
    );
  }

  Future<void> nextWishes() async {
    if (state.requireValue.hasNext) {
      return;
    }

    var response =
        await ref.read(openApiProvider).getWishApi().apiWishV2WishOtherGet(
              offsetWishId: state.requireValue.offsetWishId,
              limit: limit,
            );

    state = AsyncData(OtherWishUsers.from(state.requireValue, response.data!));
  }

  Future<void> refresh() async {
    state = AsyncData(OtherWishUsers.empty());

    var response =
        await ref.read(openApiProvider).getWishApi().apiWishV2WishOtherGet(
              offsetWishId: null,
              limit: limit,
            );

    state = AsyncData(OtherWishUsers.from(null, response.data!));
  }

  Future<void> removeUser(String userId) async {
    state = AsyncData(OtherWishUsers.removeUserId(state.requireValue, userId));
  }
}
