import 'package:Kiffy/screen_module/common/input/section/kiffy_image_field_section.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/edit_profile/provider/edit_profile_provider.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/edit_profile_input_header.dart';
import 'package:dartlin/collections.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileInputImages extends ConsumerWidget {
  const EditProfileInputImages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditProfileHeaderTitle(text: tr("text.profile.media")),
        const Space(height: 8),
        const EditProfileInputImagesSelect(),
      ],
    );
  }
}

/// ***********************************
///          이미지 선택 아이콘
/// **********************************
class EditProfileInputImagesSelect extends ConsumerWidget {
  const EditProfileInputImagesSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var medias = ref.watch(
      editProfileProvider.select((value) => value.medias),
    );

    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: List.generate(
        6,
        (index) {
          return KiffyImageFieldSection(
            media: medias.getOrNull(index),
            onDeleted: () {
              ref.read(editProfileProvider.notifier).deleteMedia(index);
            },
            onAdded: (media) =>
                ref.read(editProfileProvider.notifier).addMedia(media),
          );
        },
      ),
    );
  }
}
