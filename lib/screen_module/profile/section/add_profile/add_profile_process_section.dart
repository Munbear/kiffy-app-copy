import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/screen_module/profile/provider/add_profile/add_profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/section/add_profile/add_profile_complete_section.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_birthday.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_images.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_phone.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_loading.dart';
import 'package:Kiffy/screen_module/profile/widget/new_profile_input_contact.dart';
import 'package:Kiffy/screen_module/profile/widget/new_profile_input_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProfileProcessSection extends ConsumerStatefulWidget {
  const AddProfileProcessSection({super.key});

  @override
  ConsumerState<AddProfileProcessSection> createState() =>
      _ProfileInputProcessSectionState();
}

class _ProfileInputProcessSectionState
    extends ConsumerState<AddProfileProcessSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var process = ref.watch(profileInputProcessProvider);

    return Container(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: ref.read(profileInputProcessWidgets)[process],
      ),
    );
  }
}

final profileInputProcessProvider = StateProvider((ref) => 0);
final profileInputProcessWidgets = StateProvider(
  (ref) => [
    AddProfileInputPhone(
      onNext: (phoneNumber) {
        ref.read(profileInputValueProvider.notifier).setPhoneNumber(
            phoneNumber.countryDialCode, phoneNumber.phoneNumber);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    AddProfileInputImages(
      onNext: (medias) {
        ref.read(profileInputValueProvider.notifier).setMedias(medias);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    ProfileInputUser(
      onNext: (name, gender) {
        ref.read(profileInputValueProvider.notifier).setNickName(name);
        ref.read(profileInputValueProvider.notifier).setGender(gender);

        switch (gender) {
          case Gender.MALE:
            ref.read(profileInputProcessProvider.notifier).state += 1;
            break;
          case Gender.FEMALE:
            ref.read(profileInputProcessProvider.notifier).state += 2;
            break;
        }
      },
    ),
    ProfileInputContact(
      onNext: (contactType, contactId) {
        ref
            .read(profileInputValueProvider.notifier)
            .setContactType(contactType);
        ref.read(profileInputValueProvider.notifier).setContactId(contactId);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    AddProfileInputBirthday(
      onNext: (birthday) {
        ref.read(profileInputValueProvider.notifier).setBirthday(birthday);
        ref.read(profileInputProcessProvider.notifier).state += 1;
      },
    ),
    AddProfileLoading(
      onNext: () => ref.read(profileInputProcessProvider.notifier).state += 1,
    ),
    AddProfileCompleteSection(),
  ],
);

// void next() {
//   switch (process) {
//     case 1:
//       if (profileInputUserVerify()) {
//         setState(() => process++);
//       }
//       break;
//     case 2:
//       if (ref
//           .read(profileInputValidatorProvider)
//           .verifyPhoneNumber(countryAndPhoneNumber)) {
//         setState(() => process++);
//       }
//       break;
//     // case 3:
//     //   if (profileInputContactVerify()) {
//     //     setState(() => process++);
//     //   }
//     //   break;
//     case 3:
//       setState(() => process++);
//       break;
//     case 4:
//       if (ref.read(profileInputValidatorProvider).verifyMedias(medias)) {
//         complete();
//       }
//       break;
//   }
// }
//
// void complete() async {
//   final createUserProfileRequest = CreateUserProfileRequestV2((b) {
//     b.name = nickname;
//     b.gender = gender!.toGenderEnumView();
//     b.birthDate = birthday!.toUtc();
//     b.intro = intro;
//     b.medias.addAll(medias
//         .mapIndexed((index, media) => EditUserProfileRequestMediasInner((b) {
//               b.id = media.id;
//               b.orderNum = index;
//             })));
//     // b.contacts.add(EditUserProfileRequestContactsInner((b) {
//     //   b.contactId = contactId;
//     //   b.contactType = contactType!.toContactEnumView();
//     // }));
//     b.countryNumber = countryAndPhoneNumber.countryNumber;
//     b.phoneNumber = countryAndPhoneNumber.phoneNumber;
//   });
//
//   await ref.read(openApiProvider).getMyApi().apiUserV2MyProfilePost(
//       createUserProfileRequestV2: createUserProfileRequest);
//
//   await ref.read(myProvider.notifier).init();
//   ref.read(routerProvider).replace(AddProfileCompleteScreen.routeLocation);
// }
//
// // 프로필 입력 화면 들
// Widget processBuilder() {
//   switch (process) {
//     case 1:
//       return Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
//             child: profileInputUser(),
//           ),
//           profileInputUserVerify()
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 39),
//                   child: ProfileInputNextButton(onPressed: () {
//                     next();
//                   }),
//                 )
//               : Space(),
//         ],
//       );
//     case 2:
//       return Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
//             child: profileInputPhone(),
//           ),
//         ],
//       );
//     // case 3:
//     //   return Column(
//     //     children: [
//     //       Padding(
//     //         padding: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
//     //         child: profileInputContact(),
//     //       ),
//     //       profileInputContactVerify()
//     //           ? Padding(
//     //               padding: const EdgeInsets.symmetric(horizontal: 39),
//     //               child: ProfileInputNextButton(
//     //                 onPressed: () {
//     //                   next();
//     //                 },
//     //               ),
//     //             )
//     //           : Space()
//     //     ],
//     //   );
//     case 3:
//       return Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
//             child: profileInputIntro(),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 39),
//             child: ProfileInputNextButton(onPressed: () {
//               next();
//             }),
//           )
//         ],
//       );
//     case 4:
//       return Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 39, right: 39, bottom: 39),
//             child: profileInputImages(),
//           ),
//           ref.read(profileInputValidatorProvider).verifyMedias(medias)
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 39),
//                   child: ProfileInputNextButton(onPressed: () {
//                     next();
//                   }),
//                 )
//               : Space()
//         ],
//       );
//     default:
//       throw Exception();
//   }
// }
//
// Widget profileInputPhone() {
//   return Column(
//     children: [
//       ProfileInputPhone(
//         onNext: (countryAndPhoneNumber) {
//           setState(() => this.countryAndPhoneNumber = countryAndPhoneNumber);
//           next();
//         },
//       ),
//     ],
//   );
// }
//
// /// 프로필 입력 화면
// Widget profileInputUser() {
//   return Column(
//     children: [
//       ProfileInputNickname(
//         nickname: nickname ?? "",
//         onChanged: (inputNickname) => setState(() {
//           nickname = inputNickname;
//         }),
//       ),
//       Space(height: 20),
//       ProfileInputGender(
//         gender: gender,
//         onChanged: (inputGender) => setState(() {
//           gender = inputGender;
//         }),
//       ),
//       Space(height: 20),
//       ProfileInputBirthday(
//         birthday: birthday,
//         onChanged: (inputBirthday) => setState(() {
//           birthday = inputBirthday;
//         }),
//       ),
//     ],
//   );
// }
//
// bool profileInputUserVerify() {
//   return ref.read(profileInputValidatorProvider).verifyNickname(nickname) &&
//       ref.read(profileInputValidatorProvider).verifyBirthday(birthday) &&
//       ref.read(profileInputValidatorProvider).verifyGender(gender);
// }
//
// ///sns 선택
// Widget profileInputContact() {
//   return Column(
//     children: [
//       ProfileInputContactType(
//         contactType: contactType,
//         onChanged: (inputContactType) => setState(() {
//           contactType = inputContactType;
//         }),
//       ),
//       Space(height: 20),
//       ProfileInputContactId(
//         contactId: contactId,
//         gender: gender,
//         onChanged: (inputContactId) => setState(() {
//           contactId = inputContactId;
//         }),
//       ),
//     ],
//   );
// }
//
// bool profileInputContactVerify() {
//   return ref
//           .read(profileInputValidatorProvider)
//           .verifyContactType(contactType) &&
//       ref.read(profileInputValidatorProvider).verifyContactId(contactId);
// }
//
// // 자기소개
// Widget profileInputIntro() {
//   return Column(
//     children: [
//       ProfileInputIntro(
//           onChanged: (inputIntro) => setState(() {
//                 intro = inputIntro;
//               }))
//     ],
//   );
// }
//
// // 이미지 선택 UI
// Widget profileInputImages() {
//   return Column(
//     children: [
//       ProfileInputImages(
//           medias: medias,
//           onAdded: (media) {
//             setState(() {
//               medias.add(media);
//             });
//           },
//           onDeleted: (index) {
//             setState(() {
//               medias.removeAt(index);
//             });
//           })
//     ],
//   );
// }
