import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/constant/mbti_type.dart';
import 'package:Kiffy/constant/zodiac_type.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/add_profile/provider/profile_input_validator_provider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

// 프로필 생성
final profileInputValueProvider =
    NotifierProvider<ProfileInputValueNotifier, ProfileInputValue>(
  () => ProfileInputValueNotifier(),
);

class ProfileInputValueNotifier extends Notifier<ProfileInputValue> {
  @override
  ProfileInputValue build() {
    return ProfileInputValue.empty();
  }

  void setNickName(String nickName) {
    state.nickName = nickName;
    state = state;
  }

  bool isNicknameValidated() {
    return ref
        .read(profileInputValidatorProvider)
        .verifyNickname(state.nickName);
  }

  void setGender(Gender gender) {
    state.gender = gender;
    state = state;
  }

  bool isGenderValidated() {
    return ref.read(profileInputValidatorProvider).verifyGender(state.gender);
  }

  void setBirthday(DateTime birthday) {
    state.birthDay = birthday;
    state = state;
  }

  bool isBirthdayValidated() {
    return ref
        .read(profileInputValidatorProvider)
        .verifyBirthday(state.birthDay);
  }

  void setContactType(ContactType contactType) {
    state.contactType = contactType;
    state = state;
  }

  bool isContactTypeValidated() {
    return ref
        .read(profileInputValidatorProvider)
        .verifyContactType(state.contactType);
  }

  void setContactId(String contactId) {
    state.contactId = contactId;
    state = state;
  }

  bool isContactIdValidated() {
    return ref
        .read(profileInputValidatorProvider)
        .verifyContactId(state.contactId);
  }

  void setIntro(String intro) {
    state.intro = intro;
    state = state;
  }

  bool isIntroValidated() {
    return true;
  }

  void setMedias(List<MediaView> medias) {
    state.medias = medias;
    state = state;
  }

  bool isMediasValidated() {
    return ref.read(profileInputValidatorProvider).verifyMedias(state.medias);
  }

  void setPhoneNumber(String countryDialCode, String phoneNumber) {
    state.phoneNumber = CountryDialCodeAndPhoneNumber(
      countryDialCode: countryDialCode,
      phoneNumber: phoneNumber,
    );
    state = state;
  }

  bool isPhoneNumberValidated() {
    if (state.phoneNumber?.countryDialCode == null ||
        state.phoneNumber?.phoneNumber == null) {
      return false;
    }

    return ref.read(profileInputValidatorProvider).verifyPhoneNumber(
          state.phoneNumber!.countryDialCode,
          state.phoneNumber!.phoneNumber,
        );
  }

  // 키 정보 받아오기
  void setTall(tall) {
    state.tall = tall;
    state = state;
  }

  // 몸무게 정보 받아오기
  void setWeight(weight) {
    state.weight = weight;
    state = state;
  }

  // mbti 받아오기
  void setMbti(MBTI? mbti) {
    state.mbti = mbti;
    state = state;
  }

  // 별자리 받아오기
  void setZodiac(Zodiac? zodiac) {
    state.zodiac = zodiac;
    state = state;
  }

  // tags 아디 값 받아오기
  void setTags(List<int> multiTags, int? tag) {
    List<int> newTags = List.from(multiTags);
    if (tag != null) {
      newTags.add(tag);
    }

    state.tags = newTags;
    state = state;
  }

  Future<void> save() async {
    await ref.read(openApiProvider).getMyApi().apiUserV3MyProfilePost(
      createUserProfileRequestV3: CreateUserProfileRequestV3(
        (b) {
          b.name = state.nickName;
          b.gender = state.gender!.toGenderEnumView();
          b.medias.addAll(state.medias.mapIndexed(
              (index, media) => EditUserProfileRequestMediasInner((b) {
                    b.id = media.id;
                    b.orderNum = index;
                  })));

          if (state.contactType != null && state.contactId.isNotEmpty) {
            b.contacts.add(EditUserProfileRequestContactsInner((b) {
              b.contactId = state.contactId;
              b.contactType = state.contactType!.toContactEnumView();
            }));
          }

          b.birthDate = state.birthDay!.toUtc();
          b.intro = "";

          b.countryNumber = state.phoneNumber!.countryDialCode;
          b.phoneNumber = state.phoneNumber!.phoneNumber;

          b.tags.addAll(state.tags!.map((e) => TagRequestInner((b) {
                b.id = e;
              })));
          b.mbti = state.mbti!.convertToEnumView();
          b.zodiac = state.zodiac!.convertToEnumView();
          //TODO
          // 키몸무게 필요
          // b.tall = state.tall
          // b.weight = state.weight
        },
      ),
    );
  }
}

class CountryDialCodeAndPhoneNumber {
  final String countryDialCode;
  final String phoneNumber;

  const CountryDialCodeAndPhoneNumber({
    required this.countryDialCode,
    required this.phoneNumber,
  });

  static CountryDialCodeAndPhoneNumber of(
      {required String countryDialCode, required String phoneNumber}) {
    String zeroStripPhoneNumber = phoneNumber.replaceAll(RegExp(r'^0+'), '');

    zeroStripPhoneNumber = zeroStripPhoneNumber.replaceAll(" ", "");
    zeroStripPhoneNumber = zeroStripPhoneNumber.replaceAll("-", "");

    return CountryDialCodeAndPhoneNumber(
      countryDialCode: countryDialCode,
      phoneNumber: zeroStripPhoneNumber,
    );
  }
}

// 프로필 생성 객체
class ProfileInputValue {
  String nickName;
  Gender? gender;
  DateTime? birthDay;
  ContactType? contactType;
  String contactId;
  String intro;
  List<MediaView> medias;
  CountryDialCodeAndPhoneNumber? phoneNumber;
  MBTI? mbti;
  Zodiac? zodiac;
  List<int>? tags;
  String? tall;
  String? weight;

  ProfileInputValue({
    required this.nickName,
    required this.contactId,
    required this.intro,
    required this.medias,
    required this.mbti,
    required this.zodiac,
    required this.tags,
    required this.tall,
    required this.weight,
  });

  factory ProfileInputValue.empty() {
    return ProfileInputValue(
      nickName: "",
      contactId: "",
      intro: "",
      medias: List.empty(growable: true),
      mbti: null,
      zodiac: null,
      tags: [],
      tall: null,
      weight: null,
    );
  }
}
