// // import 'package:hooks_riverpod/hooks_riverpod.dart';

// // class ProcessStepState extends StateNotifier {
// //   ProcessStepState() : super([]);
// //   // 프로바이더 작업중
// // }

// import 'package:hooks_riverpod/hooks_riverpod.dart';

// ///////////
// ///
// enum ProfileEditProcess {
//   name,
//   birthday,
//   gender,
//   media,
//   intro,
// }

// class ProfileEditProcessContent extends StateNotifier {
//   late String title;
//   late String guideText;

//   ProfileEditProcessContent({required this.title, required this.guideText}) : super([]);

//   factory ProfileEditProcessContent.of(ProfileEditProcess process) {
//     switch (process) {
//       case ProfileEditProcess.name:
//         return ProfileEditProcessContent(title: "name", guideText: "이름을 입력해주세요");
//       case ProfileEditProcess.gender:
//         return ProfileEditProcessContent(title: "gender", guideText: "성별을 입력해주세요");
//       case ProfileEditProcess.birthday:
//         return ProfileEditProcessContent(title: "birthday", guideText: "생일을 입력해주세요");
//       case ProfileEditProcess.media:
//         return ProfileEditProcessContent(title: "Photos", guideText: "사진을 선택해주세요");
//       case ProfileEditProcess.intro:
//         return ProfileEditProcessContent(title: "Introduction", guideText: "자기소개서를 작성해 주세요");
//     }
//   }
// }
