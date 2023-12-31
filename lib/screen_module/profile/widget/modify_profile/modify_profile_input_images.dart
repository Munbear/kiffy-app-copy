import 'package:Kiffy/screen_module/common/input/section/kiffy_image_field_section.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/modify_profile/modify_profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/modify_profile/modify_profile_input_header.dart';
import 'package:dartlin/collections.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModifyProfileInputImages extends ConsumerWidget {
  const ModifyProfileInputImages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ModifyProfileHeaderTitle(text: tr("text.profile.media")),
        const Space(height: 8),
        const ModifyProfileInputImagesSelect(),
      ],
    );
  }
}

/// ***********************************
///          이미지 선택 아이콘
/// **********************************
class ModifyProfileInputImagesSelect extends ConsumerWidget {
  const ModifyProfileInputImagesSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var medias = ref.watch(
      modifyProfileInputValueProvider.select((value) => value.medias),
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
              ref
                  .read(modifyProfileInputValueProvider.notifier)
                  .deleteMedia(index);
            },
            onAdded: (media) => ref
                .read(modifyProfileInputValueProvider.notifier)
                .addMedia(media),
          );
        },
      ),
    );
  }
}
