import 'package:openapi/openapi.dart';

enum Zodiac {
  aquarius(text: "Aquarius : 1/20 ~ 2/18", value: "Aquarius"),
  pisces(text: "Pisces : 2/19 ~ 3/20", value: "Pisces"),
  aries(text: "Aries : 3/21 ~ 4/19", value: "Aries"),
  taurus(text: "Taurus : 4/20 ~ 5/20", value: "Taurus"),
  gemini(text: "Gemini : 5/21 ~ 6/21", value: "Gemini"),
  cancer(text: "Cancer : 6/22 ~ 7/22", value: "Cancer"),
  leo(text: "Leo : 7/23 ~ 8/22", value: "Leo"),
  virgo(text: "Virgo : 8/23 ~ 9/22", value: "Virgo"),
  libra(text: "Libra : 9/23 ~ 10/23", value: "Libra"),
  scorpio(text: "Scorpio : 10/24 ~ 11/22", value: "Scorpio"),
  sagittarius(text: "Sagittarius : 11/23 ~ 12/21", value: "Sagittarius"),
  capricorn(text: "Capricorn : 12/22 ~ 1/19", value: "Capricorn");

  const Zodiac({required this.text, required this.value});

  final String text;
  final String value;

  ZodiacTypeEnumView convertToEnumView() {
    switch (this) {
      case Zodiac.aquarius:
        return ZodiacTypeEnumView.AQUARIUS;
      case Zodiac.pisces:
        return ZodiacTypeEnumView.PISCES;
      case Zodiac.aries:
        return ZodiacTypeEnumView.ARIES;
      case Zodiac.taurus:
        return ZodiacTypeEnumView.TAURUS;
      case Zodiac.gemini:
        return ZodiacTypeEnumView.GEMINI;
      case Zodiac.cancer:
        return ZodiacTypeEnumView.CANCER;
      case Zodiac.leo:
        return ZodiacTypeEnumView.LEO;
      case Zodiac.virgo:
        return ZodiacTypeEnumView.VIRGO;
      case Zodiac.libra:
        return ZodiacTypeEnumView.LIBRA;
      case Zodiac.scorpio:
        return ZodiacTypeEnumView.SCORPIO;
      case Zodiac.sagittarius:
        return ZodiacTypeEnumView.SAGITTARIUS;
      case Zodiac.capricorn:
        return ZodiacTypeEnumView.CAPRICORN;
      default:
        throw Exception();
    }
  }

  static Zodiac? enumViewToEnum(ZodiacTypeEnumView? enumView) {
    switch (enumView) {
      case ZodiacTypeEnumView.AQUARIUS:
        return Zodiac.aquarius;
      case ZodiacTypeEnumView.PISCES:
        return Zodiac.pisces;
      case ZodiacTypeEnumView.ARIES:
        return Zodiac.aries;
      case ZodiacTypeEnumView.TAURUS:
        return Zodiac.taurus;
      case ZodiacTypeEnumView.GEMINI:
        return Zodiac.gemini;
      case ZodiacTypeEnumView.CANCER:
        return Zodiac.cancer;
      case ZodiacTypeEnumView.LEO:
        return Zodiac.leo;
      case ZodiacTypeEnumView.VIRGO:
        return Zodiac.virgo;
      case ZodiacTypeEnumView.LIBRA:
        return Zodiac.libra;
      case ZodiacTypeEnumView.SCORPIO:
        return Zodiac.scorpio;
      case ZodiacTypeEnumView.SAGITTARIUS:
        return Zodiac.sagittarius;
      case ZodiacTypeEnumView.CAPRICORN:
        return Zodiac.capricorn;
      default:
        throw Exception();
    }
  }
}
