import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/skeleton/widget/skeleton.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfileCardSection extends ConsumerStatefulWidget {
  const MyProfileCardSection({super.key});

  @override
  ConsumerState<MyProfileCardSection> createState() =>
      _MyProfileCardSectionState();
}

class _MyProfileCardSectionState extends ConsumerState<MyProfileCardSection> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var my = ref.watch(myProvider);

    if (my.isLoading) {
      return const SizedBox(
        width: double.infinity,
        height: 400,
        child: Skeleton(),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 400,
        child: my.requireValue.profile != null
            ? UserProfileCardPage(
                userProfile: my.requireValue.profile!,
              )
            : const Space(),
      ),
    );
  }
}
