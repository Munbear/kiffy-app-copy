enum OptionProfileType {
  relationship(
    text: "relationship",
    imagePath: "assets/images/relationship.png",
    title: "관계",
  ),
  personality(
    text: "personality",
    imagePath: "assets/images/personality.png",
    title: "성격",
  ),
  coffee(
    text: "coffee",
    imagePath: "assets/images/coffee.png",
    title: "커피",
  ),
  language(
    text: "language",
    imagePath: "assets/images/language.png",
    title: "언어",
  ),
  physical(
    text: "physical",
    imagePath: "assets/images/physical.png",
    title: "피지컬",
  ),
  mbti(
    text: "mbti",
    imagePath: "assets/images/mbti.png",
    title: "ㅇmbti",
  ),
  zodiac(
    text: "zodiac",
    imagePath: "assets/images/zodiac.png",
    title: "별자리",
  );

  const OptionProfileType({
    required this.text,
    required this.imagePath,
    required this.title,
  });

  final String text;
  final String imagePath;
  final String title;
}
