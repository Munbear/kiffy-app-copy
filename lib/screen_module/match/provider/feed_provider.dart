import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:openapi/openapi.dart';

final feedListProvider =
    AsyncNotifierProvider.autoDispose<FeedList, List<PostViewV1>>(FeedList.new);

class FeedList extends AutoDisposeAsyncNotifier<List<PostViewV1>> {
  @override
  Future<List<PostViewV1>> build() async {
    /// logic here
    return [];
  }

  /// methods herer
  Future<void> getFeedList({String? nexyKey}) async {
    final res = await ref.read(openApiProvider).getPostApi().getFeed();
    print(res);
  }
}
