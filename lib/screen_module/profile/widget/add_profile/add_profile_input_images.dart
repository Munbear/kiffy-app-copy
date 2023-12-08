import 'package:Kiffy/screen_module/common/input/section/kiffy_image_field_section.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_image_tip_bottom_sheet.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_header.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:dartlin/dartlin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:openapi/openapi.dart';

final _mediaViewsProvider = StateProvider<List<MediaView>>((ref) => []);

class AddProfileInputImages extends ConsumerWidget {
  final Function(List<MediaView> medias) onNext;

  const AddProfileInputImages({super.key, required this.onNext});

  bool _verify(WidgetRef ref) {
    var isValidated = ref
        .read(profileInputValidatorProvider)
        .verifyMedias(ref.read(_mediaViewsProvider));

    if (!isValidated) {
      Fluttertoast.showToast(
        msg: tr("text.profile.profile_input.media"),
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const ProfileInputImagesHeader(),
        const Space(height: 20),
        const ProfileInputImagesSelect(),
        const Space(height: 20),
        ProfileInputNextButton(onPressed: () {
          _verify(ref);
          onNext(ref.read(_mediaViewsProvider));
        }),
      ],
    );
  }
}

/// ***********************************
///         이미지 입력 화면 헤더
/// **********************************
class ProfileInputImagesHeader extends ConsumerWidget {
  const ProfileInputImagesHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileInputHeaderTitle(
          text: tr("text.profile.media"),
        ),
      ],
    );
  }
}

/// ***********************************
///       이미지 팁 아이콘 (바텀시트 염)
/// **********************************
class ProfileInputImagesTipIcon extends ConsumerWidget {
  const ProfileInputImagesTipIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 18,
      height: 18,
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 2,
          ),
          builder: (BuildContext context) {
            return ExampleProfileImageTipBottomSheet();
          },
        ),
        child: Image.asset(
          "assets/icons/alert_icon.png",
        ),
      ),
    );
  }
}

/// ***********************************
///          이미지 선택 아이콘
/// **********************************
class ProfileInputImagesSelect extends ConsumerWidget {
  const ProfileInputImagesSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(_mediaViewsProvider);

    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: List.generate(6, (index) {
        return KiffyImageFieldSection(
          media: ref.read(_mediaViewsProvider).getOrNull(index),
          onDeleted: () {
            var medias = ref.read(_mediaViewsProvider);
            medias.removeAt(index);
            ref.read(_mediaViewsProvider.notifier).state = [...medias];
          },
          onAdded: (media) => ref.read(_mediaViewsProvider.notifier).state = [
            ...ref.read(_mediaViewsProvider),
            media,
          ],
        );
      }),
    );
  }
}
