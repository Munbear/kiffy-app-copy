import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:Kiffy/screen_module/sign/provider/auth_storage_provider.dart';
import 'package:Kiffy/screen_module/sign/provider/phone_auth_provider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:openapi/openapi.dart';

class FlagAndCountryNumber {
  final String countryNumber;

  const FlagAndCountryNumber({
    required this.countryNumber,
  });
}

class CountryAndPhoneNumber {
  final String countryNumber;
  final String phoneNumber;

  const CountryAndPhoneNumber({
    required this.countryNumber,
    required this.phoneNumber,
  });

  static CountryAndPhoneNumber of(
      {required String countryNumber, required String phoneNumber}) {
    String zeroStripPhoneNumber = phoneNumber;
    while (zeroStripPhoneNumber.startsWith("0")) {
      zeroStripPhoneNumber.substring(0, 1);
    }
    zeroStripPhoneNumber = zeroStripPhoneNumber.replaceAll(" ", "");

    return CountryAndPhoneNumber(
        countryNumber: countryNumber, phoneNumber: phoneNumber);
  }

  static CountryAndPhoneNumber empty() {
    return const CountryAndPhoneNumber(countryNumber: "", phoneNumber: "");
  }
}

final flagsAndCountryNumbers = [
  FlagAndCountryNumber(countryNumber: "+62"),
];

class ProfileInputPhone extends ConsumerStatefulWidget {
  final Function(CountryAndPhoneNumber countryAndPhoneNumber) onNext;

  const ProfileInputPhone({super.key, required this.onNext});

  @override
  ConsumerState<ProfileInputPhone> createState() => _ProfileInputPhoneState();
}

class _ProfileInputPhoneState extends ConsumerState<ProfileInputPhone> {
  String phoneNumber = "";
  String smsCode = "";
  bool isCodeSent = false;
  String verificationId = "";
  FlagAndCountryNumber selectedCountry = flagsAndCountryNumbers[0];

  Widget birthdayTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(tr("text.profile.input_profile.phone.title"),
              style: TextStyle(fontSize: 20)),
          Text(
            tr("text.profile.input_profile.phone.subtitle"),
            style: TextStyle(fontSize: 12, color: const Color(0xff0031AA)),
          )
        ],
      ),
    );
  }

  void sendCode() async {
    var response = await ref
        .read(openApiProvider)
        .getMyApi()
        .apiUserV1MyPhoneExistPost(apiUserV1MyPhoneExistPostRequest:
            ApiUserV1MyPhoneExistPostRequest((b) {
      b.countryNumber = selectedCountry.countryNumber;
      b.phoneNumber = phoneNumber;
    }));

    if (response.data!.isAlreadyRegistered) {
      Fluttertoast.showToast(
        msg: tr("text.profile.input_profile.phone.already_exists"),
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } else {
      try {
        ref.read(phoneAuthManagerProvider).sendPhoneVerificationCode(
              phoneNumber: "${selectedCountry.countryNumber} ${phoneNumber}",
              codeSent: (verificationId) {
                setState(() {
                  this.isCodeSent = true;
                  this.verificationId = verificationId;
                });
              },
            );
      } catch (exception) {
        print(exception);

        Fluttertoast.showToast(
          msg: tr("text.profile.input_profile.phone.send_fail"),
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    }
  }

  void verifyCode() async {
    try {
      var credentials = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      var email = ref.read(myProvider).requireValue.status!.email;
      var accessToken = await AuthStorage.getAccessToken();

      var userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: accessToken!);

      await userCredentials.user?.updatePhoneNumber(credentials);

      widget.onNext(CountryAndPhoneNumber(
        countryNumber: selectedCountry.countryNumber,
        phoneNumber: userCredentials.user!.phoneNumber!
            .replaceAll(selectedCountry.countryNumber, ""),
      ));
    } catch (exception) {
      print(exception);

      Fluttertoast.showToast(
        msg: tr("text.profile.input_profile.phone.code_fail"),
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  Widget processButton() {
    if (verificationId == "") {
      return ProfileInputNextButton(
        text: tr("text.profile.input_profile.phone.submit"),
        onPressed: () => sendCode(),
      );
    } else {
      return Column(
        children: [
          ProfileInputNextButton(
            onPressed: () => verifyCode(),
          ),
          Space(height: 8),
          ProfileInputNextButton(
            text: tr("text.profile.input_profile.phone.submit_again"),
            color: Colors.grey,
            onPressed: () => sendCode(),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        birthdayTitle(),
        Space(
          height: 8,
        ),
        Row(
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffcecece), width: 2.0),
              ),
              child: CountryCodePicker(
                onChanged: (v) {
                  selectedCountry = FlagAndCountryNumber(
                    countryNumber: v.dialCode!,
                  );
                },
                initialSelection: "ID",
                showFlag: true,
              ),
            ),
            Space(width: 8),
            Expanded(
              child: KiffyTextField(
                hintText: "",
                onChanged: (t) {
                  setState(() {
                    this.phoneNumber =
                        t.replaceAll(" ", "").replaceAll("-", "");
                  });
                },
                value: phoneNumber,
              ),
            ),
          ],
        ),
        ...verificationId != ""
            ? [
                Space(height: 8),
                KiffyTextField(
                  hintText: "",
                  onChanged: (t) => setState(() => this.smsCode = t),
                  value: this.smsCode,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    tr("text.profile.input_profile.phone.code"),
                    style:
                        TextStyle(fontSize: 12, color: const Color(0xff0031AA)),
                  ),
                )
              ]
            : [],
        Space(height: 20),
        processButton()
      ],
    );
  }
}
