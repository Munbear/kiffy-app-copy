import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/explore/widget/other_wish_preview_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class ExploreOtherWishPreviewSection extends ConsumerStatefulWidget {
  const ExploreOtherWishPreviewSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OtherWishPreviewSectionState();
}

class _OtherWishPreviewSectionState
    extends ConsumerState<ExploreOtherWishPreviewSection> {
  bool isLoading = true;
  List<UserProfileView> wishOtherProfiles = List.empty();

  void fillWishOtherProfiles() async {
    setState(() {
      isLoading = true;
    });
    var response =
        await ref.read(openApiProvider).getWishApi().apiWishV1WishOtherGet();

    setState(
      () {
        wishOtherProfiles = response.data!.list!.toList();
        isLoading = false;
      },
    );
  }

  List<Widget> LoadingOtherWishPreviewChips() {
    if (isLoading) {
      return [
        SizedBox(
          height: 95,
          child: OtherWishPreviewChipsSkeleton(),
        )
      ];
    }

    return wishOtherProfiles.isNotEmpty
        ? [
            SizedBox(
              height: 95,
              child: OtherWishPreviewChips(
                userProfiles: wishOtherProfiles,
                onTap: (userId) {},
              ),
            )
          ]
        : [];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fillWishOtherProfiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [...LoadingOtherWishPreviewChips()],
    );
  }
}
