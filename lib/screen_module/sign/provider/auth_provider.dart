import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/sign/provider/auth_storage_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:openapi/openapi.dart';

final authProvider = Provider((ref) => AuthProvider(ref: ref));
final loginLoading = StateProvider.autoDispose<bool>((ref) => false);

enum AuthStatus {
  SUCCESS,
  NONE;
}

class AuthProvider {
  final Ref ref;

  AuthProvider({required this.ref});

  Future<AuthStatus> autoLogin() async {
    String? savedAccessToken = await AuthStorage.getAccessToken();

    if (savedAccessToken == null) {
      return AuthStatus.NONE;
    }

    try {
      // API 실패 잡기
      await ref.read(openApiProvider).getMyApi().apiUserV1MyStatusGet();
      return AuthStatus.SUCCESS;
    } catch (e) {
      print('autoLogin');
      print(e);
      return AuthStatus.NONE;
    }
  }

  Future<void> logout() async {
    await AuthStorage.deleteAccessToken();

    try {
      await GoogleSignIn().signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<AuthStatus> googleLogin() async {
    ref.read(loginLoading.notifier).update((state) => state = true);
    // Google 인증
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      var userCredentials =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final token = googleAuth?.accessToken;

      // Kiffy 서버 인증
      final response =
          await ref.read(openApiProvider).getSignApi().apiSignV1InProviderPost(
              provider: 'google',
              signInRequest: SignInRequest((b) {
                b.accessToken = token;
              }));

      if (response.statusCode == 200) {
        await AuthStorage.setAccessToken(response.data!.accessToken);
        await userCredentials.user?.updatePassword(response.data!.accessToken);
        return AuthStatus.SUCCESS;
      }
    } catch (e) {
      print('googleLogin');
      print(e);
      ref.read(loginLoading.notifier).update((state) => state = false);
      return AuthStatus.NONE;
    }

    return AuthStatus.NONE;
  }
}
