import 'package:Kiffy/screen_module/match/provider/community_provider.dart';
import 'package:Kiffy/screen_module/my/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FeedOptionBottomSheetContainer extends ConsumerWidget {
  final String feedId;
  final String authorId;

  const FeedOptionBottomSheetContainer({
    super.key,
    required this.feedId,
    required this.authorId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myInfo = ref.read(myProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Material(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                myInfo.value!.profile!.id == authorId
                    ? ref
                        .read(communityProvider.notifier)
                        .deleteFeed(feedId)
                        .then(
                          (value) => context.pop(),
                        )
                    : ref
                        .read(communityProvider.notifier)
                        .cancelMatching(authorId)
                        .then(
                          (value) => context.pop(),
                        );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  myInfo.value!.profile!.id == authorId
                      ? "Deleted"
                      : "Cancel Matching",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
