import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/modify_profile/modify_profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/modify_profile/modify_profile_input_contact.dart';
import 'package:Kiffy/screen_module/profile/widget/modify_profile/modify_profile_input_images.dart';
import 'package:Kiffy/screen_module/profile/widget/modify_profile/modify_profile_input_intro.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

class ModifyProfileSection extends ConsumerWidget {
  const ModifyProfileSection({super.key});

  bool _verify(WidgetRef ref, Gender gender) {
    if (!ref
        .read(modifyProfileInputValueProvider.notifier)
        .isMediaValidated()) {
      Fluttertoast.showToast(
        msg: tr("text.profile.profile_input.media"),
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );

      return false;
    }

    if (gender == Gender.MALE) {
      if (!ref
          .read(modifyProfileInputValueProvider.notifier)
          .isContactIdValidated()) {
        Fluttertoast.showToast(
          msg: tr("text.profile.contact.contact_id.validation"),
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );

        return false;
      }

      if (!ref
          .read(modifyProfileInputValueProvider.notifier)
          .isContactTypeValidated()) {
        Fluttertoast.showToast(
          msg: tr("text.profile.contact.contact_type.validation"),
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );

        return false;
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var myProfile = ref.watch(
      myProvider.select((value) => value.requireValue.profile),
    );

    return _ModifyProfileInputLoader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifyProfileInputImages(),
          Space(height: 20),
          ModifyProfileInputIntro(),
          Space(height: 20),
          myProfile!.gender == GenderEnumView.MALE
              ? ModifyProfileInputContact()
              : Space(),
          Space(height: 20),
          ProfileInputNextButton(onPressed: () {
            if (!_verify(ref, Gender.fromGenderEnumView(myProfile.gender))) {
              return;
            }

            ref
                .read(modifyProfileInputValueProvider.notifier)
                .save()
                .then((value) => context.pop());
          }),
        ],
      ),
    );
  }
}

/// ***********************************
///         상태 초기화 및 유지
/// **********************************
/// https://riverpod.dev/docs/essentials/eager_initialization
class _ModifyProfileInputLoader extends ConsumerWidget {
  final Widget child;

  const _ModifyProfileInputLoader({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(modifyProfileInputValueProvider);

    return child;
  }
}
