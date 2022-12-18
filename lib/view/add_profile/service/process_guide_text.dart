import '../screen/add_profile.dart';

class ProcessGuideText {
  late String title;
  late String guideText;

  ProcessGuideText({required this.title, required this.guideText});

  factory ProcessGuideText.of(ProfileEditProcess process) {
    switch (process) {
      case ProfileEditProcess.name:
        return ProcessGuideText(title: "name", guideText: "이름을 입력해주세요");
      case ProfileEditProcess.gender:
        return ProcessGuideText(title: "gender", guideText: "성별을 입력해주세요");
      case ProfileEditProcess.birthday:
        return ProcessGuideText(title: "birthday", guideText: "생일을 입력해주세요");
      case ProfileEditProcess.media:
        return ProcessGuideText(title: "Photos", guideText: "사진을 선택해주세요");
      case ProfileEditProcess.intro:
        return ProcessGuideText(title: "Introduction", guideText: "자기소개서를 작성해 주세요");
    }
  }
}
