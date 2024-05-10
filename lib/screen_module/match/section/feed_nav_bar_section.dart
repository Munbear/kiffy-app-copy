import 'package:Kiffy/screen_module/match/provider/community_provider.dart';
import 'package:Kiffy/util/screen_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedNavBarSection extends ConsumerStatefulWidget {
  const FeedNavBarSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeedNavBarSectionState();
}

class _FeedNavBarSectionState extends ConsumerState<FeedNavBarSection>
    with ScreenMixin {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final currentFeedFilter = ref.watch(communityFilter);
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "community".tr(),
            style: textStyle.titleMedium!.apply(
              color: const Color(0xff0031AA),
            ),
          ),

          // 필터 버튼
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                showFeedFilterBottomSheet();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6)
                    .add(const EdgeInsets.only(left: 4)),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff0031AA)),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Text(
                      currentFeedFilter.text.tr(),
                      style: textStyle.labelMedium!.apply(
                        color: const Color(0xff0031AA),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff0031AA),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
