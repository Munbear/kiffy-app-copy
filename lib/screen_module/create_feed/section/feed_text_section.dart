import 'package:Kiffy/screen_module/match/provider/community_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedTextSection extends ConsumerWidget {
  const FeedTextSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = ref.read(feedTextController);
    final textStyle = Theme.of(context).textTheme;
    return TextFormField(
      autofocus: true,
      controller: textController,
      onChanged: (v) {
        ref
            .read(feedTextLengthState.notifier)
            .update((state) => state = v.length);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(500),
      ],
      maxLines: null,
      decoration: InputDecoration(
        hintStyle: textStyle.bodyLarge!.apply(color: Colors.grey[400]),
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        hintText: "text.tag.write_here".tr(),
      ),
    );
  }
}
