import 'package:Kiffy/constant/enum/contact_type.dart';
import 'package:Kiffy/constant/enum/edit_profile_type.dart';
import 'package:Kiffy/constant/enum/mbti_type.dart';
import 'package:Kiffy/constant/enum/zodiac_type.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/add_profile/provider/profile_input_validator_provider.dart';
import 'package:collection/collection.dart';
import 'package:dartlin/control_flow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final editProfileProvider = StateNotifierProvider.autoDispose<
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

  void resetWeight(String weight) {
    state = state.copyWith(weight: weight);
  }

  void resetHeight(String height) {
    state = state.copyWith(height: height);
  }

  Future<void> resetProfile(
    List<int> multiTags,
    int? tag,
    MBTI? mbti,
    Zodiac? zodiac,
  ) async {
    List<int> newTags = List.from(multiTags);
    if (tag != null) {
      newTags.add(tag);
    }

    state = state.copyWith(
      tags: newTags,
      mbti: mbti,
      zodiac: zodiac,
    );
  }

  Future<void> save() async {
    await ref.read(openApiProvider).getMyApi().apiUserV2MyProfilePut(
      editUserProfileRequestV2: EditUserProfileRequestV2((b) {
        b.intro = state.intro;
        b.medias.addAll(
          state.medias.mapIndexed(
            (index, media) => EditUserProfileRequestMediasInner(
              (b) {
                b.id = media.id;
                b.orderNum = index;
              },
            ),
          ),
        );
        b.height = state.height;
        b.weight = state.weight;
        b.mbti = state.mbti?.convertToEnumView();
        b.zodiac = state.zodiac?.convertToEnumView();
        if (state.tags != null) {
          b.tags.addAll(
            state.tags!.map(
              (e) => TagRequestInner((b) => b.id = e),
            ),
          );
        }

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

// 프로필 텝바 상태
final currentEditProfileSectionState =
    StateProvider.autoDispose<EditProfileType>((ref) => EditProfileType.basic);

// 프로필 수정 하기 모델
class ModifyProfileInputValue {
  ContactType? contactType;
  String? contactId;
  String intro;
  List<MediaView> medias;
  String? height;
  String? weight;
  MBTI? mbti;
  Zodiac? zodiac;
  List<int>? tags;

  ModifyProfileInputValue({
    required this.intro,
    required this.medias,
    this.contactType,
    this.contactId,
    this.height,
    this.weight,
    this.mbti,
    this.zodiac,
    this.tags,
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
      height: "",
      weight: "",
      mbti: null,
      zodiac: null,
      tags: [],
    );
  }

  ModifyProfileInputValue copyWith({
    ContactType? contactType,
    String? contactId,
    String? intro,
    List<MediaView>? medias,
    String? height,
    String? weight,
    MBTI? mbti,
    Zodiac? zodiac,
    List<int>? tags,
  }) {
    return ModifyProfileInputValue(
      contactType: contactType ?? this.contactType,
      contactId: contactId ?? this.contactId,
      intro: intro ?? this.intro,
      medias: medias ?? this.medias,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      mbti: mbti ?? this.mbti,
      zodiac: zodiac ?? this.zodiac,
      tags: tags ?? this.tags,
    );
  }
}
