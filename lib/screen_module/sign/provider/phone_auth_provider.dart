import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/sign/provider/auth_storage_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final phoneAuthManagerProvider = Provider((ref) => PhoneAuthManager(ref: ref));

class PhoneAuthManager {
  Ref ref;

  PhoneAuthManager({
    required this.ref,
  });

  Future<bool> isAlreadyRegistered(String phoneNumber) async {
    var response = await ref
        .read(openApiProvider)
        .getMyApi()
        .apiUserV1MyPhoneExistPost(apiUserV1MyPhoneExistPostRequest:
            ApiUserV1MyPhoneExistPostRequest((b) {
      b.phoneNumber = phoneNumber;
    }));

    return response.data!.isAlreadyRegistered;
  }

  Future<void> phoneAuth(String verificationId, String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    var userCredentials =
        await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> sendPhoneVerificationCode({
    required String phoneNumber,
    required Function(
      String verificationId,
    ) codeSent,
  }) async {
    var email = ref.read(myProvider).requireValue.status!.email;
    var accessToken = await AuthStorage.getAccessToken();

    // var userCredentials = await FirebaseAuth.instance
    //     .signInWithEmailAndPassword(email: email, password: accessToken!);

    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print('Hello?');

        // userCredentials.user?.updatePhoneNumber(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        codeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
