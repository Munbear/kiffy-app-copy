import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen/profile/add_profile_complete_screen.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile_header.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_birthday.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_contact_id.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_contact_type.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_gender.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_images.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_intro.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_nickname.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_phone.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class ProfileInputProcessSection extends ConsumerStatefulWidget {
  const ProfileInputProcessSection({super.key});

  @override
  ConsumerState<ProfileInputProcessSection> createState() =>
      _ProfileInputProcessSectionState();
}

class _ProfileInputProcessSectionState
    extends ConsumerState<ProfileInputProcessSection> {
  int process = 1;

  String? nickname = "";
  Gender? gender;
  DateTime? birthday;
  ContactType? contactType;
  String? contactId;
  String intro = "";
  CountryAndPhoneNumber countryAndPhoneNumber = CountryAndPhoneNumber.empty();
  List<MediaView> medias = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(39),
          child: AddProfileHeader(),
        ),
        processBuilder(),
      ],
    );
  }

  void next() {
    switch (process) {
      case 1:
        if (profileInputUserVerify()) {
          setState(() => process++);
        }
        break;
      case 2:
        if (ref
            .read(profileInputValidatorProvider)
            .verifyPhoneNumber(countryAndPhoneNumber)) {
          setState(() => process++);
        }
        break;
      // case 3:
      //   if (profileInputContactVerify()) {
      //     setState(() => process++);
      //   }
      //   break;
      case 3:
        setState(() => process++);
        break;
      case 4:
        if (ref.read(profileInputValidatorProvider).verifyMedias(medias)) {
          complete();
        }
        break;
    }
  }

  void complete() async {
    final createUserProfileRequest = CreateUserProfileRequestV2((b) {
      b.name = nickname;
      b.gender = gender!.toGenderEnumView();
      b.birthDate = birthday!.toUtc();
      b.intro = intro;
      b.medias.addAll(medias
          .mapIndexed((index, media) => EditUserProfileRequestMediasInner((b) {
                b.id = media.id;
                b.orderNum = index;
              })));
      // b.contacts.add(EditUserProfileRequestContactsInner((b) {
      //   b.contactId = contactId;
      //   b.contactType = contactType!.toContactEnumView();
      // }));
      b.countryNumber = countryAndPhoneNumber.countryNumber;
      b.phoneNumber = countryAndPhoneNumber.phoneNumber;
    });

    await ref.read(openApiProvider).getMyApi().apiUserV2MyProfilePost(
        createUserProfileRequestV2: createUserProfileRequest);

    await ref.read(myProvider.notifier).init();
    ref.read(routerProvider).replace(AddProfileCompleteScreen.routeLocation);
  }

  // 프로필 입력 화면 들
  Widget processBuilder() {
    switch (process) {
      case 1:
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
              child: profileInputUser(),
            ),
            profileInputUserVerify()
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 39),
                    child: ProfileInputNextButton(onPressed: () {
                      next();
                    }),
                  )
                : Space(),
          ],
        );
      case 2:
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
              child: profileInputPhone(),
            ),
          ],
        );
      // case 3:
      //   return Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
      //         child: profileInputContact(),
      //       ),
      //       profileInputContactVerify()
      //           ? Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 39),
      //               child: ProfileInputNextButton(
      //                 onPressed: () {
      //                   next();
      //                 },
      //               ),
      //             )
      //           : Space()
      //     ],
      //   );
      case 3:
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
              child: profileInputIntro(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 39),
              child: ProfileInputNextButton(onPressed: () {
                next();
              }),
            )
          ],
        );
      case 4:
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
              child: profileInputImages(),
            ),
            ref.read(profileInputValidatorProvider).verifyMedias(medias)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 39),
                    child: ProfileInputNextButton(onPressed: () {
                      next();
                    }),
                  )
                : Space()
          ],
        );
      default:
        throw Exception();
    }
  }

  Widget profileInputPhone() {
    return Column(
      children: [
        ProfileInputPhone(
          onNext: (countryAndPhoneNumber) {
            setState(() => this.countryAndPhoneNumber = countryAndPhoneNumber);
            next();
          },
        ),
      ],
    );
  }

  /// 프로필 입력 화면
  Widget profileInputUser() {
    return Column(
      children: [
        ProfileInputNickname(
          nickname: nickname ?? "",
          onChanged: (inputNickname) => setState(() {
            nickname = inputNickname;
          }),
        ),
        Space(height: 20),
        ProfileInputGender(
          gender: gender,
          onChanged: (inputGender) => setState(() {
            gender = inputGender;
          }),
        ),
        Space(height: 20),
        ProfileInputBirthday(
          birthday: birthday,
          onChanged: (inputBirthday) => setState(() {
            birthday = inputBirthday;
          }),
        ),
      ],
    );
  }

  bool profileInputUserVerify() {
    return ref.read(profileInputValidatorProvider).verifyNickname(nickname) &&
        ref.read(profileInputValidatorProvider).verifyBirthday(birthday) &&
        ref.read(profileInputValidatorProvider).verifyGender(gender);
  }

  ///sns 선택
  Widget profileInputContact() {
    return Column(
      children: [
        ProfileInputContactType(
          contactType: contactType,
          onChanged: (inputContactType) => setState(() {
            contactType = inputContactType;
          }),
        ),
        Space(height: 20),
        ProfileInputContactId(
          contactId: contactId,
          gender: gender,
          onChanged: (inputContactId) => setState(() {
            contactId = inputContactId;
          }),
        ),
      ],
    );
  }

  bool profileInputContactVerify() {
    return ref
            .read(profileInputValidatorProvider)
            .verifyContactType(contactType) &&
        ref.read(profileInputValidatorProvider).verifyContactId(contactId);
  }

  // 자기소개
  Widget profileInputIntro() {
    return Column(
      children: [
        ProfileInputIntro(
            onChanged: (inputIntro) => setState(() {
                  intro = inputIntro;
                }))
      ],
    );
  }

  // 이미지 선택 UI
  Widget profileInputImages() {
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
            })
      ],
    );
  }
}
