enum OptionProfileType {
  relationship(
    text: "relationship",
    imagePath: "assets/images/relationship.png",
  ),
  personality(
    text: "personality",
    imagePath: "assets/images/personality.png",
  ),
  coffee(
    text: "coffee",
    imagePath: "assets/images/coffee.png",
  ),
  language(
    text: "language",
    imagePath: "assets/images/language.png",
  ),
  physical(
    text: "physical",
    imagePath: "assets/images/physical.png",
  ),
  mbti(
    text: "mbti",
    imagePath: "assets/images/mbti.png",
  ),
  zodiac(
    text: "zodiac",
    imagePath: "assets/images/zodiac.png",
  );

  const OptionProfileType({
    required this.text,
    required this.imagePath,
  });

  final String text;
  final String imagePath;
}
