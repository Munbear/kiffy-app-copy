import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_contact/user_profile_create_and_edit_command_profile_contact.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_media/user_profile_create_and_edit_command_profile_media.dart';
import 'package:Kiffy/model/user_profile_create_command/user_profile_create_command.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

// 프로필 유효성 검사
class AddProfileInputItemValidation {
  bool isValid;
  String validationMessage;

  AddProfileInputItemValidation({
    required this.isValid,
    required this.validationMessage,
  });

  static AddProfileInputItemValidation fail(String message) =>
      AddProfileInputItemValidation(isValid: false, validationMessage: message);

  static AddProfileInputItemValidation success() =>
      AddProfileInputItemValidation(isValid: true, validationMessage: "");
}

// 프로필 생성 상태
final profileInputProvider =
    StateNotifierProvider<profileInputState, UserProfileCreateCommand>(
        (ref) => profileInputState(ref));

// 유저 프로필 상태
class profileInputState extends StateNotifier<UserProfileCreateCommand> {
  final Ref ref;
  // Dio dio = ApiClient().dio;

  profileInputState(this.ref)
      : super(
          UserProfileCreateCommand(
            name: "",
            gender: Gender.MALE,
            birthDate: "",
            intro: "",
            medias: <UserProfileCreateAndEditCommandProfileMedia>[],
            contacts: <UserProfileCreateAndEditCommanProfileContact>[],
          ),
        );

  // 프로필 이름 유효성 검사
  AddProfileInputItemValidation setName(String name) {
    if (name.isEmpty) return AddProfileInputItemValidation.fail("* 이름을 입력해주세요");

    if (name.length >= 20)
      return AddProfileInputItemValidation.fail("* 이름은 20자 이내로 입력해주세요");

    return AddProfileInputItemValidation.success();
  }

  // 프로필 성벌 유효성 검사
  AddProfileInputItemValidation setGender(Gender? gender) {
    if (gender == null)
      return AddProfileInputItemValidation.fail("* 성별을 입력해주세요");

    state.gender;
    return AddProfileInputItemValidation.success();
  }

  // 프로필 생년월일 유효성 검사
  AddProfileInputItemValidation setBirthDate(String birthDate) {
    if (birthDate.isEmpty)
      return AddProfileInputItemValidation.fail("* 생년월일을 입력해주세요");

    try {
      var parsedBirthDate = DateTime.tryParse(birthDate);

      if (parsedBirthDate == null) {
        return AddProfileInputItemValidation.fail("* 예시와 맞게 입력해주세요");
      }

      if (parsedBirthDate.isBefore(DateTime(1950)) ||
          parsedBirthDate.isAfter(DateTime(2013))) {
        return AddProfileInputItemValidation.fail("* 가입할 수 없는 나이입니다");
      }
    } catch (e) {
      return AddProfileInputItemValidation.fail("* 예시와 맞게 입력해주세요");
    }

    state.birthDate;

    return AddProfileInputItemValidation.success();
  }

  // 프로필 연락처 유효성 검사
  AddProfileInputItemValidation setContact(
      String contactId, ContactType? contactType) {
    if (contactId.isEmpty)
      return AddProfileInputItemValidation.fail(
          "* ${tr("text.profile.contact.contact_id.validation")}");
    if (contactType == null)
      return AddProfileInputItemValidation.fail(
          "* ${tr("text.profile.contact.contact_type.validation")}");
    state.contacts;
    return AddProfileInputItemValidation.success();
  }

  // 프로필 자기소개 유효성 검사
  AddProfileInputItemValidation setIntro(String intro) {
    if (intro.isEmpty)
      return AddProfileInputItemValidation.fail(
          "* ${tr("text.profile.intro")}");
    if (intro.length >= 500) return AddProfileInputItemValidation.fail("> 500");
    state.intro;
    return AddProfileInputItemValidation.success();
  }

  // 프로필 사진 유효성 검사
  AddProfileInputItemValidation setMedias(
      List<UserProfileCreateAndEditCommandProfileMedia> medias) {
    if (medias.length < 2)
      return AddProfileInputItemValidation.fail(
          tr("text.profile.profile_input.media"));
    state.medias;
    return AddProfileInputItemValidation.success();
  }

  // 닉네임 업데이트
  updateName(String name) => state = state.copyWith(name: name);

  // 성별 업데이트
  updateGender(Gender? gender) {
    if (gender != null) state = state.copyWith(gender: gender);
  }

  // 생년월일 업데이트
  updateBirthdDate(String birthDate) =>
      state = state.copyWith(birthDate: birthDate);

  // 연락처 업데이트
  updateContact(String contactId, ContactType? contactType) {
    final newContact = UserProfileCreateAndEditCommanProfileContact(
        contactId: contactId, contactType: contactType!);
    final newContacts = [...state.contacts];
    newContacts.add(newContact);

    state = state.copyWith(contacts: newContacts);
  }

  // 자기소개 업데이트
  updateIntro(String intro) => state = state.copyWith(intro: intro);

  // 프로필 사진 없데이트
  updateMedia(String mediaId, int orderNum) {
    final addMedia = UserProfileCreateAndEditCommandProfileMedia(
        id: mediaId, orderNum: orderNum);
    final addMedias = [...state.medias];
    addMedias.add(addMedia);

    state = state.copyWith(medias: addMedias);
  }

  // 프로필 생성하기
  Future<Response<void>> addProfile() async {
    final createUserProfileRequest = CreateUserProfileRequest((b) {
      b.name = state.name;
      b.gender = state.gender.toGenderEnumView();
      b.birthDate = DateTime.tryParse(
          "${state.birthDate.substring(0, 4)}-${state.birthDate.substring(4, 6)}-${state.birthDate.substring(6, 8)}T00:00:00Z");
      b.intro = state.intro;
      b.medias.addAll(
          state.medias.map((media) => EditUserProfileRequestMediasInner((b) {
                b.id = media.id;
                b.orderNum = media.orderNum;
              })));
      b.contacts.addAll(state.contacts
          .map((contact) => EditUserProfileRequestContactsInner((b) {
                b.contactId = contact.contactId;
                b.contactType = contact.contactType.toContactEnumView();
              })));
    });

    return await ref.read(openApiProvider).getMyApi().apiUserV1MyProfilePost(
        createUserProfileRequest: createUserProfileRequest);
  }
}
