import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_header.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final birthdayProvider = StateProvider((ref) => "");

class AddProfileInputBirthday extends ConsumerWidget {
  final Function(DateTime birthday) onNext;

  const AddProfileInputBirthday({super.key, required this.onNext});

  bool _verify(WidgetRef ref) {
    try {
      DateTime.parse(ref.read(birthdayProvider));
    } catch (_) {
      Fluttertoast.showToast(
        msg: tr("text.profile.birthday.rule"),
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return false;
    }

    if (!ref
        .read(profileInputValidatorProvider)
        .verifyBirthday(DateTime.parse(ref.read(birthdayProvider)))) {
      Fluttertoast.showToast(
        msg: tr("text.profile.birthday.rule"),
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
          const ProfileInputBirthdayHeader(),
          const Space(height: 20),
          const ProfileInputBirthdayExample(),
          KiffyTextField(
            hintText: "YYYYMMDD",
            keyboardType: TextInputType.number,
            onChanged: (t) {
              ref.read(birthdayProvider.notifier).state = t;
            },
          ),
          const Space(height: 20),
          ProfileInputNextButton(
            onPressed: () {
              if (!_verify(ref)) {
                return;
              }
              onNext(DateTime.parse(ref.read(birthdayProvider)));
            },
          ),
        ],
      ),
    );
  }
}

class ProfileInputBirthdayHeader extends StatelessWidget {
  const ProfileInputBirthdayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddProfileInputHeaderTitle(text: tr("text.profile.birthday")),
          AddProfileInputHeaderSubTitle(
              text: tr("text.profile.input_profile.last_process")),
        ],
      ),
    );
  }
}

/// 생년월일 입력 예시
class ProfileInputBirthdayExample extends StatelessWidget {
  const ProfileInputBirthdayExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        "example : ${DateFormat("yyyyMMdd").format(DateTime.now())}",
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xff6c6c6c),
        ),
      ),
    );
  }
}
