import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final exploreUsersProvider =
    AutoDisposeAsyncNotifierProvider<ExploreUsersProvider, ExploreUsers>(
        ExploreUsersProvider.new);

class ExploreUsers {
  List<UserProfileView> userProfiles;

  ExploreUsers({
    required this.userProfiles,
  });
}

class ExploreUsersProvider extends AutoDisposeAsyncNotifier<ExploreUsers> {
  @override
  Future<ExploreUsers> build() async {
    final response = await ref
        .read(openApiProvider)
        .getExploreApi()
        .apiExploreV1UsersGet(offset: 0, limit: 5);

    return ExploreUsers(userProfiles: response.data!.list.toList());
  }

  Future<void> refresh() async {
    state = AsyncData(ExploreUsers(userProfiles: []));

    final response = await ref
        .read(openApiProvider)
        .getExploreApi()
        .apiExploreV1UsersGet(offset: 0, limit: 5);

    state = AsyncData(ExploreUsers(userProfiles: response.data!.list.toList()));
  }
}

final currentImagePage = StateProvider.autoDispose<double>((ref) => 0.0);
