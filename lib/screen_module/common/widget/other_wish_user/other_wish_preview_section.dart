import 'package:Kiffy/screen_module/common/widget/other_wish_user/other_wish_preview_chips.dart';
import 'package:Kiffy/screen_module/wish/provider/other_wish_users_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherWishPreviewSection extends ConsumerStatefulWidget {
  const OtherWishPreviewSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OtherWishPreviewSectionState();
}

class _OtherWishPreviewSectionState
    extends ConsumerState<OtherWishPreviewSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final otherWishState = ref.watch(otherWishUsersReaderProvider);

    if (otherWishState.isLoading) {
      return Stack(
        children: [
          SizedBox(
            height: 95,
            child: OtherWishPreviewChipsSkeleton(),
          )
        ],
      );
    }

    return otherWishState.requireValue.otherWishes.isNotEmpty
        ? Stack(
            children: [
              SizedBox(
                height: 95,
                child: OtherWishPreviewChips(
                  userProfiles: otherWishState.requireValue.otherWishes
                      .take(10)
                      .map((e) => e.userProfile)
                      .toList(),
                  onTap: (userId) {},
                ),
              )
            ],
          )
        : const Stack(
            children: [
              SizedBox(
                height: 95,
                child: Center(
                  child: Text("아직 위시를 보낸 사용자가 없습니다."),
                ),
              )
            ],
          );
  }
}
