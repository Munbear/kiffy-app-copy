enum Zodiac {
  aquarius(text: "Aquarius : 1/20 ~ 2/18"),
  pisces(text: "Pisces : 2/19 ~ 3/20"),
  aries(text: "Aries : 3/21 ~ 4/19"),
  taurus(text: "Taurus : 4/20 ~ 5/20"),
  gemini(text: "Gemini : 5/21 ~ 6/21"),
  cancer(text: "Cancer : 6/22 ~ 7/22"),
  leo(text: "Leo : 7/23 ~ 8/22"),
  virgo(text: "Virgo : 8/23 ~ 9/22"),
  libra(text: "Libra : 9/23 ~ 10/23"),
  scorpio(text: "Scorpio : 10/24 ~ 11/22"),
  sagittarius(text: "Sagittarius : 11/23 ~ 12/21"),
  capricorn(text: "Capricorn : 12/22 ~ 1/19");

  const Zodiac({required this.text});

  final String text;
}
