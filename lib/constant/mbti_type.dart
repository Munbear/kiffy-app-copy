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
}
