import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';

// 대문자에서 소문자로 바궈도 서버랑 잘 매칭 됨
// @JsonEnum(fieldRename: FieldRename.screamingSnake)
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

  static MBTI? enumViewToEnum(MBTITypeEnumView? enumView) {
    switch (enumView) {
      case MBTITypeEnumView.ISTJ:
        return MBTI.ISTJ;
      case MBTITypeEnumView.ISFJ:
        return MBTI.ISFJ;
      case MBTITypeEnumView.INFJ:
        return MBTI.INFJ;
      case MBTITypeEnumView.INTJ:
        return MBTI.INTJ;
      case MBTITypeEnumView.ISTP:
        return MBTI.ISTP;
      case MBTITypeEnumView.ISFP:
        return MBTI.ISFP;
      case MBTITypeEnumView.INFP:
        return MBTI.INFP;
      case MBTITypeEnumView.INTP:
        return MBTI.INTP;
      case MBTITypeEnumView.ESTP:
        return MBTI.ESTP;
      case MBTITypeEnumView.ESFP:
        return MBTI.ESFP;
      case MBTITypeEnumView.ENFP:
        return MBTI.ENFP;
      case MBTITypeEnumView.ENTP:
        return MBTI.ENTP;
      case MBTITypeEnumView.ESTJ:
        return MBTI.ESTJ;
      case MBTITypeEnumView.ESFJ:
        return MBTI.ESFJ;
      case MBTITypeEnumView.ENFJ:
        return MBTI.ENFJ;
      case MBTITypeEnumView.ENTJ:
        return MBTI.ENTJ;
      default:
        throw Exception();
    }
  }

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
