import 'package:Kiffy/screen_module/create_feed/provider/create_feed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedSubmitSection extends ConsumerWidget {
  const FeedSubmitSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final textController = ref.watch(feedTextController);
    final uploadImageIds = ref.watch(imageUploadState);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ElevatedButton(
        onPressed: () {
          ref
              .read(createFeedProvider.notifier)
              .postFeed(textController.text, uploadImageIds);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          backgroundColor: const Color(0xff0031AA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          "Share",
          style: textStyle.titleSmall!.apply(color: Colors.white),
        ),
      ),
    );
  }
}
