import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:collection/collection.dart';
import 'package:dartlin/control_flow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final modifyProfileInputValueProvider = StateNotifierProvider.autoDispose<
    ModifyProfileInputValueNotifier, ModifyProfileInputValue>(
  (ref) => ModifyProfileInputValueNotifier(
    ModifyProfileInputValue.from(ref.read(myProvider).requireValue.profile!),
    ref,
  ),
);

class ModifyProfileInputValueNotifier
    extends StateNotifier<ModifyProfileInputValue> {
  final Ref ref;

  ModifyProfileInputValueNotifier(super.state, this.ref);

  void addMedia(MediaView media) {
    state = state.copyWith(medias: [...state.medias, media]);
  }

  void deleteMedia(int index) {
    final medias = state.copyWith().medias;
    medias.removeAt(index);
    state = state.copyWith(medias: [...medias]);
  }

  void setIntro(String intro) {
    state = state.copyWith(intro: intro);
  }

  void setContactType(ContactType contactType) {
    state = state.copyWith(contactType: contactType);
  }

  void setContactId(String contactId) {
    state = state.copyWith(contactId: contactId);
  }

  bool isIntroValidated() {
    return state.intro != "";
  }

  bool isContactTypeValidated() {
    return ref
        .read(profileInputValidatorProvider)
        .verifyContactType(state.contactType);
  }

  bool isContactIdValidated() {
    return ref
        .read(profileInputValidatorProvider)
        .verifyContactId(state.contactId);
  }

  bool isMediaValidated() {
    return ref.read(profileInputValidatorProvider).verifyMedias(state.medias);
  }

  Future<void> save() async {
    await ref.read(openApiProvider).getMyApi().apiUserV1MyProfilePut(
      editUserProfileRequest: EditUserProfileRequest((b) {
        b.intro = state.intro;
        b.medias.addAll(state.medias.mapIndexed(
            (index, media) => EditUserProfileRequestMediasInner((b) {
                  b.id = media.id;
                  b.orderNum = index;
                })));

        if (state.contactType != null &&
            state.contactId != null &&
            state.contactId!.isNotEmpty) {
          b.contacts.add(EditUserProfileRequestContactsInner((cb) {
            cb.contactId = state.contactId;
            cb.contactType = state.contactType!.toContactEnumView();
          }));
        }
      }),
    );

    await ref.read(myProvider.notifier).init();
  }
}

class ModifyProfileInputValue {
  ContactType? contactType;
  String? contactId;
  String intro;
  List<MediaView> medias;

  ModifyProfileInputValue({
    required this.intro,
    required this.medias,
    this.contactType,
    this.contactId,
  });

  factory ModifyProfileInputValue.from(UserProfileView myProfile) {
    return ModifyProfileInputValue(
      intro: myProfile.intro,
      medias: myProfile.medias.toList(growable: true),
      contactType: myProfile.contacts.firstOrNull
          ?.let((it) => ContactType.fromEnumView(it.contactType)),
      contactId: myProfile.contacts.firstOrNull?.contactId,
    );
  }

  factory ModifyProfileInputValue.empty() {
    return ModifyProfileInputValue(
      intro: "",
      medias: [],
      contactType: null,
      contactId: "",
    );
  }

  ModifyProfileInputValue copyWith({
    ContactType? contactType,
    String? contactId,
    String? intro,
    List<MediaView>? medias,
  }) {
    return ModifyProfileInputValue(
      contactType: contactType ?? this.contactType,
      contactId: contactId ?? this.contactId,
      intro: intro ?? this.intro,
      medias: medias ?? this.medias,
    );
  }
}
