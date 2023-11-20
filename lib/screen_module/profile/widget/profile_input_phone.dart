import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:Kiffy/screen_module/sign/provider/auth_storage_provider.dart';
import 'package:Kiffy/screen_module/sign/provider/phone_auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:openapi/openapi.dart';

class FlagAndCountryNumber {
  final String flag;
  final String countryNumber;

  const FlagAndCountryNumber({
    required this.flag,
    required this.countryNumber,
  });
}

final flagsAndCountryNumbers = [
  FlagAndCountryNumber(flag: "🇮🇩", countryNumber: "+62"),
];

class ProfileInputPhone extends ConsumerStatefulWidget {
  final Function(String phonenumber) onNext;

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
      b.phoneNumber = "${selectedCountry.countryNumber} ${phoneNumber}";
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

      widget.onNext("${selectedCountry.countryNumber} ${phoneNumber}");
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
              padding: EdgeInsets.all(10),
              child: Text(
                "🇮🇩",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: KiffyTextField(
                hintText: "",
                onChanged: (t) => setState(() => this.phoneNumber = t),
                value: phoneNumber,
              ),
            ),
          ],
        ),
        Space(height: 8),
        KiffyTextField(
          hintText: "",
          onChanged: (t) => setState(() => this.smsCode = t),
          value: this.smsCode,
        ),
        Space(height: 8),
        processButton()
      ],
    );
  }
}
