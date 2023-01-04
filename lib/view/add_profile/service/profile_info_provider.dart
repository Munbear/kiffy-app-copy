import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileInfoProvider = StateNotifierProvider<ProfileInfoText, TextEditingController>((ref) {
  return ProfileInfoText(ref);
});

class ProfileInfoText extends StateNotifier<TextEditingController> {
  ProfileInfoText(this.ref) : super(TextEditingController());

  final Ref ref;

  void profileCheckValidator() {}
}
