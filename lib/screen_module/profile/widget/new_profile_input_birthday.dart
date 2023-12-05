import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_header.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileInputBirthday extends ConsumerWidget {
  final Function(DateTime birthday) onNext;

  const ProfileInputBirthday({super.key, required this.onNext});

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
  Widget build(BuildContext context, WidgetRef ref) => Column(
        children: [
          ProfileInputBirthdayHeader(),
          Space(height: 20),
          ProfileInputBirthdayExample(),
          KiffyTextField(
            hintText: "YYYYMMDD",
            onChanged: (t) {
              ref.read(birthdayProvider.notifier).state = t;
            },
          ),
          Space(height: 20),
          ProfileInputNextButton(
            onPressed: () {
              if (!_verify(ref)) {
                return;
              }
              onNext(DateTime.parse(ref.read(birthdayProvider)));
            },
          ),
        ],
      );
}

final birthdayProvider = StateProvider((ref) => "");

class ProfileInputBirthdayHeader extends StatelessWidget {
  const ProfileInputBirthdayHeader({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileInputHeaderTitle(text: tr("text.profile.birthday")),
            ProfileInputHeaderSubTitle(
                text: tr("text.profile.input_profile.last_process")),
          ],
        ),
      );
}

class ProfileInputBirthdayExample extends StatelessWidget {
  const ProfileInputBirthdayExample({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: Text(
            "example : ${DateFormat("yyyyMMdd").format(DateTime.now())}",
            style: TextStyle(fontSize: 12, color: Color(0xff6c6c6c))),
      );
}
