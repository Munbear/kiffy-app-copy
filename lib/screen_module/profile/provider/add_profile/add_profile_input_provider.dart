import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/retry.dart';
import 'package:openapi/openapi.dart';

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

  Future<void> save() async {
    await ref.read(openApiProvider).getMyApi().apiUserV2MyProfilePost(
      createUserProfileRequestV2: CreateUserProfileRequestV2(
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

class ProfileInputValue {
  String nickName;
  Gender? gender;
  DateTime? birthDay;
  ContactType? contactType;
  String contactId;
  String intro;
  List<MediaView> medias;
  CountryDialCodeAndPhoneNumber? phoneNumber;
  String? mbti;
  String? zodiac;
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
      mbti: "",
      zodiac: "",
      tags: [],
      tall: null,
      weight: null,
    );
  }
}
