import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class ModifyResetButton extends ConsumerStatefulWidget {
  const ModifyResetButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ModifyResetButtonState();
}

class _ModifyResetButtonState extends ConsumerState<ModifyResetButton> {
  // ref.read(profileInputValidatorProvider).verifyContactType(contactType)
  // ref.read(profileInputValidatorProvider).verifyContactId(contactId)
  // ref.read(profileInputValidatorProvider).verifyMedias(medias)

  void completeModifyProfile() async {
    //TODO 유효성 검사
    // 변경된 값 넣기만 하면 됨
    final modifyUserProfileRequest = CreateUserProfileRequest();
    ref.read(openApiProvider).getMyApi().apiUserV1MyProfilePost(
          createUserProfileRequest: modifyUserProfileRequest,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: ElevatedButton(
        onPressed: () {
          //  ref.read(profileInputValidatorProvider).verifyMedias(widget.medias)
          completeModifyProfile();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff0031AA),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Modify",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
