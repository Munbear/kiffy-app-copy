import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/screen_module/common/input/widget/kiffy_input_button.dart';
import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/add_profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/add_profile/widget/add_profile_input_header.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/profile_input_next_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final genderProvider = StateProvider<Gender?>((ref) => null);
final nameProvider = StateProvider((ref) => "");

class AddProfileInputUser extends ConsumerWidget {
  final Function(String name, Gender gender) onNext;

  const AddProfileInputUser({super.key, required this.onNext});

  bool _verify(WidgetRef ref) {
    if (!ref
        .read(profileInputValidatorProvider)
        .verifyGender(ref.read(genderProvider))) {
      Fluttertoast.showToast(
        msg: tr("text.profile.gender.rule"),
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return false;
    }

    if (!ref
        .read(profileInputValidatorProvider)
        .verifyNickname(ref.read(nameProvider))) {
      Fluttertoast.showToast(
        msg: tr("text.profile.nickname.rule"),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Space(height: 16),
          const ProfileInputUserHeader(),
          const Space(height: 20),
          const ProfileInputUserName(),
          const Space(height: 10),
          const ProfileInputUserGender(),
          const Space(height: 20),
          ProfileInputNextButton(onPressed: () {
            if (!_verify(ref)) {
              return;
            }
            onNext(ref.read(nameProvider), ref.read(genderProvider)!);
          }),
        ],
      ),
    );
  }
}

class ProfileInputUserHeader extends StatelessWidget {
  const ProfileInputUserHeader({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddProfileInputHeaderTitle(
              text: tr("text.profile.input_profile.intro_title"),
            ),
            AddProfileInputHeaderSubTitle(
              text: tr("text.profile.input_profile.sub_title"),
            ),
          ],
        ),
      );
}

/// ***********************************
///      이름 입력
/// **********************************
class ProfileInputUserName extends ConsumerWidget {
  const ProfileInputUserName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const ProfileInputUserNameTitle(),
        const Space(height: 8),
        KiffyTextField(
          hintText: tr("text.profile.input_profile.nickname.placeholder"),
          onChanged: (nickname) =>
              ref.read(nameProvider.notifier).state = nickname,
        ),
        const Space(height: 2),
      ],
    );
  }
}

class ProfileInputUserNameTitle extends StatelessWidget {
  const ProfileInputUserNameTitle({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: Text(tr("text.profile.nickname"),
            style: const TextStyle(fontSize: 20)),
      );
}

/// ***********************************
///      성별 선택
/// **********************************
class ProfileInputUserGender extends ConsumerWidget {
  const ProfileInputUserGender({super.key});

  String iconAsset(Gender gender) {
    switch (gender) {
      case Gender.MALE:
        return "assets/icons/man_icon.png";
      default:
        return "assets/icons/woman_icon.png";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var gender = ref.watch(genderProvider);

    return Column(
      children: [
        const ProfileInputUserGenderTitle(),
        const Space(height: 8),
        Row(
          children: [
            Expanded(
                child: KiffyInputButton(
              isSelected: gender == Gender.MALE,
              iconAsset: iconAsset(Gender.MALE),
              text: Gender.genderToString(Gender.MALE),
              onPressed: () =>
                  ref.read(genderProvider.notifier).state = Gender.MALE,
            )),
            const Space(width: 10),
            Expanded(
                child: KiffyInputButton(
              isSelected: gender == Gender.FEMALE,
              iconAsset: iconAsset(Gender.FEMALE),
              text: Gender.genderToString(Gender.FEMALE),
              onPressed: () =>
                  ref.read(genderProvider.notifier).state = Gender.FEMALE,
            )),
          ],
        ),
        const Space(height: 2),
      ],
    );
  }
}

class ProfileInputUserGenderTitle extends StatelessWidget {
  const ProfileInputUserGenderTitle({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: Text(
          tr("text.profile.gender"),
          style: const TextStyle(fontSize: 20),
        ),
      );
}
