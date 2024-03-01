import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedTextSection extends ConsumerWidget {
  const FeedTextSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    return TextFormField(
      autofocus: true,
      inputFormatters: [
        LengthLimitingTextInputFormatter(500),
      ],
      maxLines: null,
      decoration: InputDecoration(
        hintStyle: textStyle.bodyLarge!.apply(color: Colors.grey[400]),
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        hintText: "write here",
      ),
    );
  }
}
