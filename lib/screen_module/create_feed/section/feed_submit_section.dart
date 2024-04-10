import 'package:Kiffy/screen_module/match/provider/feed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FeedSubmitSection extends ConsumerWidget {
  const FeedSubmitSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final textController = ref.watch(feedTextController);
    final uploadImageIds = ref.watch(imageUploadState);
    final selectedImages = ref.watch(imageFileState);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: selectedImages.isNotEmpty
          ? ElevatedButton(
              onPressed: uploadImageIds.isEmpty
                  ? null
                  : () {
                      ref
                          .read(communityProvider.notifier)
                          .postFeed(textController.text, uploadImageIds)
                          .then(
                        (statusCode) {
                          if (statusCode == 200) {
                            context.pop();
                          }
                        },
                      );
                    },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.zero,
                backgroundColor: const Color(0xff0031AA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: uploadImageIds.isEmpty
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      "Share",
                      style: textStyle.titleSmall!.apply(color: Colors.white),
                    ),
            )
          : ElevatedButton(
              onPressed: () {
                ref
                    .read(communityProvider.notifier)
                    .postFeed(textController.text, uploadImageIds)
                    .then(
                  (statusCode) {
                    if (statusCode == 200) {
                      context.pop(true);
                    }
                  },
                );
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
