import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/explore_user_profiles_view/explore_user_profiles_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final exploreProvider = Provider<ExploreHandler>((ref) => ExploreHandler(ref));

class ExploreHandler {
  final Ref ref;

  ExploreHandler(this.ref);

  // 탐색할 유저 불러오기
  getExpolreUserCard() async {
    if (ref.read(userCardLoading.notifier).state) return;

    ref.read(userCardLoading.notifier).update((state) => state = true);

    // 함수 호출
    final response = await ApiClient().dio.get("/api/explore/v1/users?offset=0&limit=5");

    await Future.delayed(const Duration(milliseconds: 1500));

    List<UserProfileView>? items = ExploreUserProfilesView.fromJson(response.data).list;

    ref.read(userCardsProvider.notifier).update((state) => items);

    ref.read(userCardLoading.notifier).update((state) => false);
  }
}

final userCardsProvider = StateProvider<List<UserProfileView>>((ref) => []);

final userCardLoading = StateProvider<bool>((ref) => false);

final wishCount = StateProvider<int>((ref) => 0);

final currentPictureIndex = StateProvider.autoDispose<int>((ref) => 0);

// final profilePicturePageController = StateProvider.autoDispose<PageController>((ref) => PageController(initialPage: 0));
