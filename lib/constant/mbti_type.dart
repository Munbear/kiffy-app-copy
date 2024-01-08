import 'package:openapi/openapi.dart';

enum MBTI {
  ISTJ(text: "ISTJ"),
  ISFJ(text: "ISFJ"),
  INFJ(text: "INFJ"),
  INTJ(text: "INTJ"),
  ISTP(text: "ISTP"),
  ISFP(text: "ISFP"),
  INFP(text: "INFP"),
  INTP(text: "INTP"),
  ESTP(text: "ESTP"),
  ESFP(text: "ESFP"),
  ENFP(text: "ENFP"),
  ENTP(text: "ENTP"),
  ESTJ(text: "ESTJ"),
  ESFJ(text: "ESFJ"),
  ENFJ(text: "ENFJ"),
  ENTJ(text: "ENTJ");

  const MBTI({required this.text});

  final String text;

  MBTITypeEnumView convertToEnumView() {
    switch (this) {
      case MBTI.ISTJ:
        return MBTITypeEnumView.ISTJ;
      case MBTI.ISFJ:
        return MBTITypeEnumView.ISFJ;
      case MBTI.INFJ:
        return MBTITypeEnumView.INFJ;
      case MBTI.INTJ:
        return MBTITypeEnumView.INTJ;
      case MBTI.ISTP:
        return MBTITypeEnumView.ISTP;
      case MBTI.ISFP:
        return MBTITypeEnumView.ISFP;
      case MBTI.INFP:
        return MBTITypeEnumView.INFP;
      case MBTI.INTP:
        return MBTITypeEnumView.INTP;
      case MBTI.ESTP:
        return MBTITypeEnumView.ESTP;
      case MBTI.ESFP:
        return MBTITypeEnumView.ESFP;
      case MBTI.ENFP:
        return MBTITypeEnumView.ENFP;
      case MBTI.ENTP:
        return MBTITypeEnumView.ENTP;
      case MBTI.ESTJ:
        return MBTITypeEnumView.ESTJ;
      case MBTI.ESFJ:
        return MBTITypeEnumView.ESFJ;
      case MBTI.ENFJ:
        return MBTITypeEnumView.ENFJ;
      case MBTI.ENTJ:
        return MBTITypeEnumView.ENTJ;
      default:
        throw Exception();
    }
  }
}
