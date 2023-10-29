import 'dart:async';

import 'package:Kiffy/screen_module/wish/provider/other_wish_users_reader.dart';
import 'package:Kiffy/screen_module/wish/provider/wish_remain_calculator.dart';
import 'package:Kiffy/screen_module/wish/widget/other_wish_user_profile_chip.dart';
import 'package:Kiffy/screen_module/wish/widget/other_wish_user_profile_chip_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

class OtherWishUserProfileChipSection extends ConsumerStatefulWidget {
  final OtherWishUserProfileView otherWish;
  const OtherWishUserProfileChipSection({super.key, required this.otherWish});

  @override
  ConsumerState<OtherWishUserProfileChipSection> createState() =>
      _OtherWishUserProfileChipSectionState();
}

class _OtherWishUserProfileChipSectionState
    extends ConsumerState<OtherWishUserProfileChipSection> {
  bool isLoading = true;
  Timer? _timer;
  WishRemained? remained;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remained = ref
            .read(wishRemainCalculatorProvider)
            .calculate(widget.otherWish.createdAt);
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        remained = ref
            .read(wishRemainCalculatorProvider)
            .calculate(widget.otherWish.createdAt);
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return OtherWishUserProfileChipSkeleton();
    }

    return OtherWishUserProfileChip(
      otherWish: widget.otherWish,
      remained: remained!,
      onRemainedProfileTap: () {
        context
            .push("/other-wish/wish/${widget.otherWish.id}/detail")
            .then((value) {
          ref.read(otherWishUsersReaderProvider.notifier).refresh();
        });
      },
    );
  }
}
