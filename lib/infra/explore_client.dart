import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final exploreProvider = Provider<ExploreHandler>((ref) => ExploreHandler(ref));

class ExploreHandler {
  Ref ref;
  Dio dio;

  ExploreHandler(this.ref) : dio = ref.read(dioProvider);

  // 탐색할 유저 불러오기
  getExpolreUserCard() async {
    var response = await ref.read(openApiProvider).getExploreApi().apiExploreV1UsersGet();

    ref.read(userCardsProvider.notifier).update((state) => response.data!.list!.toList());
    ref.read(userCardLoading.notifier).update((state) => false);
  }

  // 다음 카드
  void nextImage(
      int currentIndex, PageController pageController, int mediasLength) {
    if (currentIndex < mediasLength - 1) {
      currentIndex++;
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  // 이전 카드
  void prevImage(int currentIndex, PageController pageController) {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }
}

final userCardsProvider = StateProvider<List<UserProfileView>>((ref) => []);

final userCardLoading = StateProvider<bool>((ref) => false);

final wishCount = StateProvider<int>((ref) => 0);

final currentPictureIndex = StateProvider.autoDispose<int>((ref) => 0);

