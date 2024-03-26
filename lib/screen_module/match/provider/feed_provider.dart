import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final feedListProvider =
    AsyncNotifierProvider.autoDispose<FeedList, FeedPageViewV1>(FeedList.new);

// List<PostViewV1>
class FeedList extends AutoDisposeAsyncNotifier<FeedPageViewV1> {
  @override
  Future<FeedPageViewV1> build() async {
    final res = await ref.read(openApiProvider).getPostApi().getFeed(
          getFeedRequestV1: GetFeedRequestV1(),
        );
    return res.data!;
  }

  // 업데이트 리스트
  Future<void> updateFeedList({String? nextPage}) async {
    final res = await ref.read(openApiProvider).getPostApi().getFeed(
          getFeedRequestV1: GetFeedRequestV1(),
        );
    print(res.data);
    List<PostViewV1> itemList = res.data!.posts.toList();
    // state = AsyncValue.data([...state, ...itemList]);
    print(state);
  }
}
