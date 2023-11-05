import 'package:Kiffy/screen_module/common/input/section/kiffy_image_field_section.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_image_tip_bottom_sheet.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class ProfileInputImages extends ConsumerStatefulWidget {
  final List<MediaView> medias;
  final ValueChanged<MediaView> onAdded;
  final ValueChanged<int> onDeleted;
  final bool isModifyScreen;

  const ProfileInputImages({
    super.key,
    required this.medias,
    required this.onAdded,
    required this.onDeleted,
    this.isModifyScreen = false,
  });

  @override
  ConsumerState<ProfileInputImages> createState() =>
      _ProfileInputImageSectionState();
}

class _ProfileInputImageSectionState extends ConsumerState<ProfileInputImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        inputProfileImageTitle(),
        const Space(height: 20),
        inputProfileImageFields(),
        const Space(height: 8),
        inputValidationCheck(),
      ],
    );
  }

  // 프로필 사진 팁 바텀 시트
  imageTipBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      builder: (BuildContext context) {
        return ExampleProfileImageTipBottomSheet();
      },
    );
  }

  inputProfileImageTitle() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: widget.isModifyScreen
              ? Text(tr("text.profile.media"))
              : Text(
                  tr("text.profile.media"),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
        ),
        if (!widget.isModifyScreen)
          SizedBox(
            width: 18,
            height: 18,
            child: GestureDetector(
              onTap: () => imageTipBottomSheet(context),
              child: Image.asset(
                "assets/icons/alert_icon.png",
              ),
            ),
          ),
        const Space(width: 10)
      ],
    );
  }

  Widget inputProfileImageFields() {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: List.generate(6, (index) {
        return KiffyImageFieldSection(
          media: widget.medias.elementAtOrNull(index),
          onDeleted: () => widget.onDeleted(index),
          onAdded: (media) => widget.onAdded(media),
        );
      }),
    );
  }

  Widget inputValidationCheck() {
    return ProfileInputValidationText(
      normalText: tr("text.profile.media"),
      violatedText: "* ${tr("text.profile.profile_input.media")}",
      check: () =>
          ref.read(profileInputValidatorProvider).verifyMedias(widget.medias),
    );
  }
}
