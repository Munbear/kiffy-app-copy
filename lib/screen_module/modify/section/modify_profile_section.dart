import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/modify/section/modify_reset_button.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_contact_id.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_contact_type.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_images.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_intro.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

class ModifyProfileSection extends ConsumerStatefulWidget {
  const ModifyProfileSection({super.key});

  @override
  ConsumerState<ModifyProfileSection> createState() =>
      _ModifyProfileSectionState();
}

class _ModifyProfileSectionState extends ConsumerState<ModifyProfileSection> {
  ContactType? contactType;
  String? contactId;
  String intro = "";
  List<MediaView> medias = [];

  Future<void> completeModifyProfile(WidgetRef ref) async {
    if (ref.read(profileInputValidatorProvider).verifyContactId(contactId) &&
        ref
            .read(profileInputValidatorProvider)
            .verifyContactType(contactType) &&
        ref.read(profileInputValidatorProvider).verifyMedias(medias)) {
      EditUserProfileRequest modifyUserProfileRequest = EditUserProfileRequest(
        (e) {
          e.medias.addAll(
            medias.mapIndexed(
              (index, element) => EditUserProfileRequestMediasInner(
                (b) {
                  b.id = element.id;
                  b.orderNum = index;
                },
              ),
            ),
          );
          e.intro = intro;
          e.contacts.add(
            EditUserProfileRequestContactsInner(
              (b) {
                b.contactId = contactId;
                b.contactType = contactType!.toContactEnumView();
              },
            ),
          );
        },
      );

      ref.read(openApiProvider).getMyApi().apiUserV1MyProfilePut(
            editUserProfileRequest: modifyUserProfileRequest,
          );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var myProfile = ref.read(myProvider).requireValue.profile;

      setState(() {
        contactType =
            ContactType.fromEnumView(myProfile!.contacts.first.contactType);
        contactId = myProfile.contacts.first.contactId;
        intro = myProfile.intro;
        medias = myProfile.medias.toList(growable: true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileInputImages(
          medias: medias,
          onAdded: (media) {
            setState(() {
              medias.add(media);
            });
          },
          onDeleted: (index) {
            setState(() {
              medias.removeAt(index);
            });
          },
        ),
        Space(height: 20),
        ProfileInputContactType(
          contactType: contactType,
          onChanged: (inputContactType) => setState(() {
            contactType = inputContactType;
          }),
        ),
        Space(height: 20),
        contactId != "" && contactId != null
            ? ProfileInputContactId(
                contactId: contactId,
                onChanged: (inputContactId) => setState(() {
                  contactId = inputContactId;
                }),
              )
            : Space(),
        Space(height: 20),
        intro != "" && intro != null
            ? ProfileInputIntro(
                textController: TextEditingController(text: intro),
                onChanged: (inputIntro) => setState(
                  () {
                    intro = inputIntro;
                  },
                ),
              )
            : Space(),
        Space(height: 20),
        ModifyResetButton(
          onPressed: () => completeModifyProfile(ref).then((_) {
            ref.read(myProvider.notifier).init();
            context.pop();
          }),
        ),
      ],
    );
  }
}
