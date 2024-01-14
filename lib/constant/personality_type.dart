enum Personality {
  friendly(text: "Bright and friendly"),
  cold(text: "Chic but secretly caring"),
  introvert(text: "Timid but talkative"),
  shy(text: "Shy");

  const Personality({required this.text});

  final String text;
}
