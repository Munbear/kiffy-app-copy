import 'dart:async';

import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/add_profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/screen_module/add_profile/widget/add_profile_input_header.dart';
import 'package:Kiffy/screen_module/edit_profile/widget/profile_input_next_button.dart';
import 'package:Kiffy/screen_module/sign/provider/auth_storage_provider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:openapi/openapi.dart';

final _processProvider = StateProvider<ProfileInputPhoneProcess>(
  (ref) => ProfileInputPhoneProcess.VERIFY_PHONE_NUMBER,
);
final _verificationIdProvider = StateProvider((ref) => "");
final _smsCodeProvider = StateProvider((ref) => "");

final _phoneAuthProvider = Provider((ref) => _PhoneAuthProvider(ref: ref));
final _phoneAuthCodeSentRemainDurationProvider = StateProvider(
  (ref) => const Duration(seconds: 100),
);
final phoneNumberProvider = StateProvider<String>((ref) => "");
final countryDialCodeProvider = StateProvider<String>((ref) => "+62");
final countryCodeProvider = StateProvider<String>((ref) => "ID");

class AddProfileInputPhone extends ConsumerWidget {
  // final Function(CountryDialCodeAndPhoneNumber phoneNumber) onNext;
  final ValueChanged<CountryDialCodeAndPhoneNumber> onNext;

  const AddProfileInputPhone({super.key, required this.onNext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var process = ref.watch(_processProvider);

    switch (process) {
      // 전화 번호 입력 화면
      case ProfileInputPhoneProcess.VERIFY_PHONE_NUMBER:
        return ProfileInputPhoneVerifyPhoneNumberProcess(
          onSuccess: () => onNext(
            CountryDialCodeAndPhoneNumber.of(
              countryDialCode: ref.read(countryDialCodeProvider),
              phoneNumber: ref.read(phoneNumberProvider),
            ),
          ),
        );
      case ProfileInputPhoneProcess.VERIFY_CODE:
        return ProfileInputPhoneVerifyCodeProcess(
          onSuccess: () => onNext(
            CountryDialCodeAndPhoneNumber.of(
              countryDialCode: ref.read(countryDialCodeProvider),
              phoneNumber: ref.read(phoneNumberProvider),
            ),
          ),
        );
    }
  }
}

enum ProfileInputPhoneProcess {
  VERIFY_PHONE_NUMBER,
  VERIFY_CODE;
}

/// ***********************************
///      전화번호 입력 및 코드 전송 화면
/// **********************************
class ProfileInputPhoneVerifyPhoneNumberProcess extends ConsumerWidget {
  final VoidCallback onSuccess;

  const ProfileInputPhoneVerifyPhoneNumberProcess(
      {super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Space(height: 16),
          const ProfileInputPhoneHeader(),
          const Space(height: 20),
          ProfileInputPhoneCountryAndNumber(),
          const Space(height: 20),
          ProfileInputNextButton(
            text: tr("text.profile.input_profile.phone.submit"),
            onPressed: () async {
              var phoneNumber = ref
                  .read(phoneNumberProvider)
                  .replaceAll(RegExp(r'^0+'), '')
                  .replaceAll(" ", "")
                  .replaceAll("-", "");
              if (await ref.read(_phoneAuthProvider).isAlreadyRegistered(
                    ref.read(countryDialCodeProvider),
                    phoneNumber,
                  )) {
                Fluttertoast.showToast(
                  msg: tr("text.profile.input_profile.phone.already_exists"),
                  fontSize: 16,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );

                return;
              }

              ref.read(_phoneAuthProvider).verifyPhoneNumber(
                    dialCode: ref.read(countryDialCodeProvider),
                    phoneNumber: ref.read(phoneNumberProvider),
                    onSuccess: onSuccess,
                  );

              ref.read(_processProvider.notifier).state =
                  ProfileInputPhoneProcess.VERIFY_CODE;
            },
          ),
        ],
      ),
    );
  }
}

/// ***********************************
///           코드 확인 화면
/// **********************************
class ProfileInputPhoneVerifyCodeProcess extends ConsumerWidget {
  final VoidCallback onSuccess;

  const ProfileInputPhoneVerifyCodeProcess(
      {super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const ProfileInputPhoneHeader(),
          const Space(height: 20),
          ProfileInputPhoneCountryAndNumber(disable: true),
          const Space(height: 20),
          const ProfileInputPhoneVerifyCodeProcessTimer(),
          KiffyTextField(
            hintText: "XXXXXX",
            keyboardType: TextInputType.number,
            onChanged: (t) => ref.read(_smsCodeProvider.notifier).state = t,
          ),
          const Space(height: 20),
          ProfileInputNextButton(onPressed: () async {
            await ref.read(_phoneAuthProvider).verifyCode(
                  verificationId: ref.read(_verificationIdProvider),
                  smsCode: ref.read(_smsCodeProvider),
                  onSuccess: onSuccess,
                );
          }),
        ],
      ),
    );
  }
}

/// ***********************************
///         코드 입력 타이머 화면
/// **********************************
class ProfileInputPhoneVerifyCodeProcessTimer extends ConsumerWidget {
  const ProfileInputPhoneVerifyCodeProcessTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var duration = ref.watch(_phoneAuthCodeSentRemainDurationProvider);
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        "${duration.inSeconds}",
        style: TextStyle(fontSize: 12, color: Color(0xff0031AA)),
      ),
    );
  }
}

/// ***********************************
///          전화번호 인증 Provider
/// **********************************
class _PhoneAuthProvider {
  final Ref ref;
  Timer? _timer;

  _PhoneAuthProvider({
    required this.ref,
  });

  Future<bool> isAlreadyRegistered(
      String countryDialCode, String phoneNumber) async {
    var response = await ref
        .read(openApiProvider)
        .getMyApi()
        .apiUserV1MyPhoneExistPost(apiUserV1MyPhoneExistPostRequest:
            ApiUserV1MyPhoneExistPostRequest((b) {
      b.countryNumber = countryDialCode;
      b.phoneNumber = phoneNumber;
    }));

    return response.data!.isAlreadyRegistered;
  }

  void verifyPhoneNumber(
      {required String dialCode,
      required String phoneNumber,
      required VoidCallback onSuccess}) async {
    var sendPhoneNumber = "$dialCode $phoneNumber";

    ref.read(_phoneAuthCodeSentRemainDurationProvider.notifier).state =
        const Duration(seconds: 100);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      ref
          .read(
            _phoneAuthCodeSentRemainDurationProvider.notifier,
          )
          .state -= const Duration(seconds: 1);

      if (ref.read(_phoneAuthCodeSentRemainDurationProvider).inSeconds < 0) {
        stopTimer();
        _fail();
      }
    });

    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: sendPhoneNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await success(credential);
        onSuccess();
      },
      verificationFailed: (FirebaseAuthException e) {
        stopTimer();
        _fail();
      },
      codeSent: (String verificationId, int? resendToken) async {
        ref.read(_verificationIdProvider.notifier).state = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        stopTimer();
        _fail();
      },
    );
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> verifyCode(
      {required String verificationId,
      required String smsCode,
      required VoidCallback onSuccess}) async {
    try {
      var credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await success(credential);
      onSuccess();
    } catch (e) {
      Fluttertoast.showToast(
        msg: tr("text.profile.input_profile.phone.code_fail"),
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  Future<void> success(PhoneAuthCredential credential) async {
    var userCredentials = await _userCredential();
    await userCredentials.user!.updatePhoneNumber(credential);
    stopTimer();
  }

  Future<void> _fail() async {
    Fluttertoast.showToast(
      msg: tr("text.profile.input_profile.phone.code_fail"),
      fontSize: 16,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
    ref.read(_processProvider.notifier).state =
        ProfileInputPhoneProcess.VERIFY_PHONE_NUMBER;
  }

  Future<UserCredential> _userCredential() async {
    var email = ref.read(myProvider).requireValue.status!.email;
    var accessToken = await AuthStorage.getAccessToken();

    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: accessToken!,
    );
  }
}

/// ***********************************
///          전화번호 입력 화면
/// **********************************
class ProfileInputPhoneCountryAndNumber extends ConsumerWidget {
  bool? disable;

  ProfileInputPhoneCountryAndNumber({
    super.key,
    this.disable,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            ProfileInputPhoneCountryCodePicker(
                disable: disable,
                initialSelection: ref.read(countryCodeProvider),
                onChanged: (country) {
                  ref.read(countryCodeProvider.notifier).state = country.code!;
                  ref.read(countryDialCodeProvider.notifier).state =
                      country.dialCode!;
                }),
            const Space(width: 10),
            Expanded(
              child: KiffyTextField(
                hintText: "",
                value: ref.read(phoneNumberProvider),
                readOnly: disable != null ? disable! : null,
                keyboardType: TextInputType.number,
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

/// ***********************************
///        국제번호 입력 Picker
/// **********************************
class ProfileInputPhoneCountryCodePicker extends StatelessWidget {
  bool? disable;
  String? initialSelection;

  final ValueChanged<CountryCode> onChanged;

  ProfileInputPhoneCountryCodePicker(
      {super.key,
      this.initialSelection,
      this.disable,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      decoration: BoxDecoration(
        color: disable != null && disable! ? Color(0xffe0e0e0) : Colors.white,
        border: Border.all(color: Color(0xffcecece), width: 2.0),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: CountryCodePicker(
        initialSelection: initialSelection ?? "ID",
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
        AddProfileInputHeaderTitle(
          text: tr("text.profile.input_profile.phone.title"),
        ),
        AddProfileInputHeaderSubTitle(
          text: tr("text.profile.input_profile.phone.subtitle"),
        ),
      ],
    );
  }
}
