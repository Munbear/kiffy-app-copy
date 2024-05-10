import 'package:Kiffy/screen_module/match/provider/community_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FeedFilterContainer extends ConsumerWidget {
  const FeedFilterContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: FeedFilter.values.map(
        (item) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 8),
            child: Material(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  ref
                      .read(communityProvider.notifier)
                      .feedFilter(item)
                      .then((value) => context.pop());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    item.text.tr(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

enum FeedFilter {
  all(text: "text.tag.all"),
  my(text: "text.tag.my");

  final String text;

  const FeedFilter({required this.text});
}
