import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_header.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInputPhone extends ConsumerWidget {
  const ProfileInputPhone({super.key});

  void verifyPhoneNumber(String dialCode, String phoneNumber) {
    var sendPhoneNumber = "$dialCode $phoneNumber";

    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print('Hello?');

        // userCredentials.user?.updatePhoneNumber(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var process = ref.watch(_processProvider);

    switch (process) {
      case ProfileInputPhoneProcess.VERIFY_PHONE_NUMBER:
        return Column(
          children: [
            const ProfileInputPhoneHeader(),
            const Space(height: 20),
            ProfileInputPhoneCountryAndNumber(
              onSubmit: (dialCode, phoneNumber) {},
            ),
            const Space(height: 20),
            ProfileInputNextButton(onPressed: () {
              ref.read(_processProvider.notifier).state =
                  ProfileInputPhoneProcess.VERIFY_CODE;
            }),
          ],
        );
      case ProfileInputPhoneProcess.VERIFY_CODE:
        return Column(
          children: [
            const ProfileInputPhoneHeader(),
            const Space(height: 20),
            ProfileInputPhoneCountryAndNumber(
              disable: true,
              onSubmit: (dialCode, phoneNumber) {},
            ),
            const Space(height: 20),
            const Space(height: 20),
            const Space(height: 20),
            const Space(height: 20),
            ProfileInputNextButton(onPressed: () {}),
          ],
        );
    }
  }
}

enum ProfileInputPhoneProcess {
  VERIFY_PHONE_NUMBER,
  VERIFY_CODE;
}

final _processProvider = StateProvider<ProfileInputPhoneProcess>(
    (ref) => ProfileInputPhoneProcess.VERIFY_PHONE_NUMBER);

/// ***********************************
///     전화번호 입력 화면 전화번호 입력
/// **********************************
class ProfileInputPhoneCountryAndNumber extends ConsumerWidget {
  final Function(String countryDialCode, String phoneNumber) onSubmit;
  bool? disable;

  ProfileInputPhoneCountryAndNumber({
    super.key,
    this.disable,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            ProfileInputPhoneCountryCodePicker(
              disable: disable,
              onChanged: (country) => ref
                  .read(countryDialCodeProvider.notifier)
                  .state = country.dialCode!,
            ),
            const Space(width: 10),
            Expanded(
              child: KiffyTextField(
                hintText: "",
                readOnly: disable != null ? disable! : null,
                onChanged: (phoneNumber) =>
                    ref.read(phoneNumberProvider.notifier).state = phoneNumber,
              ),
            )
          ],
        ),
      ],
    );
  }
}

final phoneNumberProvider = StateProvider<String>((ref) => "");
final countryDialCodeProvider = StateProvider<String>((ref) => "+62");

class ProfileInputPhoneCountryCodePicker extends StatelessWidget {
  bool? disable;

  final ValueChanged<CountryCode> onChanged;

  ProfileInputPhoneCountryCodePicker(
      {super.key, this.disable, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffcecece), width: 2.0),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: CountryCodePicker(
        initialSelection: "ID",
        flagWidth: 40,
        enabled: disable == null ? true : !disable!,
        onChanged: (country) => onChanged(country),
      ),
    );
  }
}

/// ***********************************
///        전화번호 입력 화면 헤더
/// **********************************
class ProfileInputPhoneHeader extends StatelessWidget {
  const ProfileInputPhoneHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileInputHeaderTitle(
          text: tr("text.profile.input_profile.phone.title"),
        ),
        ProfileInputHeaderSubTitle(
          text: tr("text.profile.input_profile.phone.subtitle"),
        ),
      ],
    );
  }
}
