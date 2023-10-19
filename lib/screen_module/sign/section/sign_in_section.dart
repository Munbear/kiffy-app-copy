import 'package:Kiffy/screen_module/sign/provider/auth_provider.dart';
import 'package:Kiffy/screen_module/sign/widget/google_sgin_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInSection extends ConsumerStatefulWidget {
  const SignInSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInSectionState();
}

class _SignInSectionState extends ConsumerState<SignInSection> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).autoAuth();
    });
  }

  @override
  Widget build(BuildContext cntext) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/kiffy_logo_purple.png", width: 150),
          // 구글 아이콘
          GoogleSignInButton(
            onSgin: () => ref.read(authProvider.notifier).auth(),
          )
        ],
      ),
    );
  }
}
