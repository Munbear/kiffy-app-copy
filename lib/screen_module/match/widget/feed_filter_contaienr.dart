import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                  print(item);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    item.text,
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
  all(text: "All"),
  my(text: "My");

  final String text;

  const FeedFilter({required this.text});
}
