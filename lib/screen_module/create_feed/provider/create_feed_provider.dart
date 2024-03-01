import 'package:Kiffy/model/create_feed_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

// final createFeedProvider =
//     StateNotifierProvider.autoDispose<CreateFeed, CreateFeedModel>(
//         (ref) => );

// class CreateFeed extends StateNotifier<CreateFeedModel> {

// }

final mediaProvider = StateProvider<MediaView>((ref) {
  return MediaView();
});
