import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<void> test(String accessToken) async {
  var url = Uri.http("api-dev.kiffy.club", "/product/api/view/sign/v1/in/google");

  var body = {"accessToken": accessToken};

  var res = await http.post(url, headers: {"Content-Type": "application/json"}, body: convert.json.encode(body));

  print("Hello, world!! token ===");
  print(res.body);
  print("Hello, world!! === token");
}
