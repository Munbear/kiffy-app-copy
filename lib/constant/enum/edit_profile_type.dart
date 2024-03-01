enum EditProfileType {
  basic(text: "Identify"),
  option(text: "Appeal");

  const EditProfileType({required this.text});

  final String text;
}
