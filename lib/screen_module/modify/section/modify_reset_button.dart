import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/modify/provider/modify_profile_provider.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    List<MediaView> editMedias = ref.watch(editUserMediaProfile);
    String? editIntro = ref.watch(editUserIntroProfile);
    String? editContactId = ref.watch(editUserContactIdProfile);
    ContactType? editContactType = ref.watch(editUserContactTypeProfile);

    EditUserProfileRequest modifyUserProfileRequest = EditUserProfileRequest(
      (e) {
        e.medias.addAll(
          editMedias.mapIndexed(
            (index, element) => EditUserProfileRequestMediasInner(
              (b) {
                b.id = element.id;
                b.orderNum = index;
              },
            ),
          ),
        );
        e.intro = editIntro;
        e.contacts.add(
          EditUserProfileRequestContactsInner(
            (b) {
              b.contactId = editContactId;
              b.contactType = editContactType!.toContactEnumView();
            },
          ),
        );
      },
    );

    // 변경 api
    // print(editIntro);
    // print(editContactType);
    // print(editContactId);
    await ref
        .read(openApiProvider)
        .getMyApi()
        .apiUserV1MyProfilePut(
          editUserProfileRequest: modifyUserProfileRequest,
        )
        .then(
      (value) {
        context.pop();
      },
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
