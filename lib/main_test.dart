void main() {
  var str = "+62 123456789";

  var regex = RegExp("^\\+[^ ]+ [\\d ]+\$");

  print(regex.hasMatch(str));
}
