import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/skeleton/widget/skeleton.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class MyProfileCardSection extends ConsumerStatefulWidget {
  const MyProfileCardSection({super.key});

  @override
  ConsumerState<MyProfileCardSection> createState() =>
      _MyProfileCardSectionState();
}

class _MyProfileCardSectionState extends ConsumerState<MyProfileCardSection> {
  bool isLoading = true;
  late final UserProfileView myProfile;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        myProfile = ref.read(myProvider).getProfile();
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        width: double.infinity,
        height: 400,
        child: Skeleton(),
      );
    }

    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        height: 400,
        child: UserProfileCardPage(
          userProfile: myProfile,
        ),
      ),
    );
  }
}
