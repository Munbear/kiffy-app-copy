import 'package:Kiffy/domain/core/enum/contact_type.dart';
import 'package:Kiffy/domain/core/enum/gender_type.dart';
import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_contact/user_profile_create_and_edit_command_profile_contact.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_media/user_profile_create_and_edit_command_profile_media.dart';
import 'package:Kiffy/model/user_profile_create_command/user_profile_create_command.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
final addProfileInputProvider =
    StateNotifierProvider<AddProfileInputState, UserProfileCreateCommand>(
        (ref) => AddProfileInputState(ref));

// 유저 프로필 상태
class AddProfileInputState extends StateNotifier<UserProfileCreateCommand> {
  final Ref ref;
  // Dio dio = ApiClient().dio;

  AddProfileInputState(this.ref)
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
      return AddProfileInputItemValidation.fail("* 연락처를 입력해주세요");
    if (contactType == null)
      return AddProfileInputItemValidation.fail("* 연락처를 선택해주세요");
    state.contacts;
    return AddProfileInputItemValidation.success();
  }

  // 프로필 자기소개 유효성 검사
  AddProfileInputItemValidation setIntro(String intro) {
    if (intro.isEmpty)
      return AddProfileInputItemValidation.fail("* 자기소개를 입력해주세요");
    if (intro.length >= 500)
      return AddProfileInputItemValidation.fail("* 500자 이내로 작성해주세요");
    state.intro;
    return AddProfileInputItemValidation.success();
  }

  // 프로필 사진 유효성 검사
  AddProfileInputItemValidation setMedias(
      List<UserProfileCreateAndEditCommandProfileMedia> medias) {
    if (medias.length < 2)
      return AddProfileInputItemValidation.fail("최소 2장 이상의 사진을 등록해주세요");
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
    // final index = newContacts.indexWhere((contact) => contact.contactId == contactId);
    // if (index != -1) {
    //   newContacts[index] = newContact;
    // } else {
    //   newContacts.add(newContact);
    // }

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
  addProfile() async {
    final userProfile = UserProfileCreateCommand(
            name: state.name,
            gender: state.gender,
            birthDate: state.birthDate,
            intro: state.intro,
            medias: state.medias,
            contacts: state.contacts)
        .toJson();
    Response response = await ref
        .read(dioProvider)
        .post("/api/view/user/v1/my/profile", data: userProfile);

    // return response.data.map<UserProfileView>((profile) => UserProfileView.fromJson(profile));
    return UserProfileView.fromJson(response.data);
  }
}
