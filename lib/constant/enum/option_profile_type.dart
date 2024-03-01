enum OptionProfileType {
  relationship(
    text: "relationship",
    imagePath: "assets/images/relationship.png",
    title: "What kind of relationship are you looking for?",
  ),
  personality(
    text: "personality",
    imagePath: "assets/images/personality.png",
    title: "What kind of personality do you hear from others?",
  ),
  coffee(
    text: "coffee",
    imagePath: "assets/images/coffee.png",
    title: "What kind of coffee do you like?",
  ),
  language(
    text: "language",
    imagePath: "assets/images/language.png",
    title: "언어",
  ),
  physical(
    text: "physical",
    imagePath: "assets/images/physical.png",
    title: "How tall are you?",
  ),
  mbti(
    text: "mbti",
    imagePath: "assets/images/mbti.png",
    title: "select your MBTI",
  ),
  zodiac(
    text: "zodiac",
    imagePath: "assets/images/zodiac.png",
    title: "What's your zodiac sign?",
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
