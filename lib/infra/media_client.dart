import 'dart:math';

import 'package:Kiffy/config/constants/contstants.dart';
import 'package:Kiffy/infra/api_client.dart';
import 'package:dio/dio.dart';

Future<UploadImageResponse> uploadImage(String path) async {
  var dio = ApiClient().dio;

  var formData = FormData.fromMap({"file": await MultipartFile.fromFile(path)});

  Response response = await dio.post("/api/view/media/v1/upload/image", data: formData);

  return UploadImageResponse.fromMap(response.data!);
}

class UploadImageResponse {
  String id;
  String type;
  String url;

  UploadImageResponse({
    required this.id,
    required this.url,
    required this.type,
  });

  static UploadImageResponse fromMap(Map<String, dynamic> d) => UploadImageResponse(id: d["id"], url: d["url"], type: d["type"]);
}
