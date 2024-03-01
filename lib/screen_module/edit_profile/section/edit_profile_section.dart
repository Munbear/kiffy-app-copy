import 'package:Kiffy/constant/enum/edit_profile_type.dart';
import 'package:Kiffy/constant/enum/gender_type.dart';
import 'package:Kiffy/constant/enum/option_profile_type.dart';
import 'package:Kiffy/screen/edit_option_profile/edit_option_profile_screen.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/edit_profile/provider/edit_profile_provider.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/edit_profile_input_contact.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/edit_profile_input_images.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/edit_profile_input_intro.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/profile_input_next_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:openapi/openapi.dart';

class EditProfileSection extends ConsumerWidget {
  const EditProfileSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageType = ref.watch(currentEditProfileSectionState);

    return _ModifyProfileInputLoader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: EditProfileType.values.map(
              (e) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(currentEditProfileSectionState.notifier)
                          .update((state) => state = e);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          Text(
                            e.text,
                            style: TextStyle(
                              color: currentPageType == e
                                  ? const Color(0xFF0031AA)
                                  : const Color(0xFFCECECE),
                              fontSize: 20,
                              fontFamily: 'AppleSDGothicNeoM00',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: currentPageType == e
                                  ? const Color(0xff0031AA)
                                  : const Color(0xFFF5F5F5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
          const SizedBox(height: 38),
          currentPageType == EditProfileType.basic
              ? const ModifyBasicProfileSection()
              : const ModifyOptionProfileSection()
        ],
      ),
    );
  }
}

class ModifyBasicProfileSection extends ConsumerWidget {
  const ModifyBasicProfileSection({super.key});

  bool _verify(WidgetRef ref, Gender gender) {
    if (!ref.read(editProfileProvider.notifier).isMediaValidated()) {
      Fluttertoast.showToast(
        msg: tr("text.profile.profile_input.media"),
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );

      return false;
    }

    if (gender == Gender.MALE) {
      if (!ref.read(editProfileProvider.notifier).isContactIdValidated()) {
        Fluttertoast.showToast(
          msg: tr("text.profile.contact.contact_id.validation"),
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );

        return false;
      }

      if (!ref.read(editProfileProvider.notifier).isContactTypeValidated()) {
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
    return Column(
      children: [
        const EditProfileInputImages(),
        const Space(height: 20),
        const EditProfileInputIntro(),
        const Space(height: 20),
        myProfile!.gender == GenderEnumView.MALE
            ? const EditProfileInputContact()
            : const Space(),
        const Space(height: 20),
        ProfileInputNextButton(
          text: tr("text.modify"),
          onPressed: () {
            if (!_verify(ref, Gender.fromGenderEnumView(myProfile.gender))) {
              return;
            }

            ref
                .read(editProfileProvider.notifier)
                .save()
                .then((value) => Navigator.of(context).pop());
          },
        ),
      ],
    );
  }
}

// 옵션 정보 버튼
class ModifyOptionProfileSection extends ConsumerWidget {
  const ModifyOptionProfileSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: OptionProfileType.values.map(
        (e) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return EditOptionProfileScreen(
                      editProfileType: e,
                      title: e.title,
                    );
                  },
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 16, left: 4, right: 4),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xffCFCFCF),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    e.imagePath,
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(e.text),
                  const Spacer(),
                  SvgPicture.asset("assets/svg/arrow_more_grey.svg")
                ],
              ),
            ),
          );
        },
      ).toList(),
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
    ref.watch(editProfileProvider);
    return child;
  }
}
