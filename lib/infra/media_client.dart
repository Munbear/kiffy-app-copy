import 'package:Kiffy/config/constants/contstants.dart';
import 'package:Kiffy/infra/api_client.dart';
import 'package:Kiffy/model/media_view/media_view.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Future<MediaView> uploadImage(String path) async {
//   var dio = ApiClient().dio;

//   var formData = FormData.fromMap({"file": await MultipartFile.fromFile(path)});

//   Response response = await dio.post("/api/view/media/v1/upload/image", data: formData);

//   // return response.data.map<MediaView>(() => MediaView).toList();
//   // :: 나중에 MediaView 로 변경
//   // return response.data.map<MediaView>((medias) => MediaView.fromJson(medias));
//   return MediaView.fromJson(response.data);
// }

final uploadMedia = Provider<Media>((ref) => Media(ref));

class Media {
  Ref ref;
  Dio dio;

  Media(this.ref) : dio = ref.read(dioProvider);

  Future<MediaView> uploadImage(String path) async {
    var formData = FormData.fromMap({"file": await MultipartFile.fromFile(path)});

    Response response = await dio.post("/api/view/media/v1/upload/image", data: formData);

    // return response.data.map<MediaView>(() => MediaView).toList();
    // :: 나중에 MediaView 로 변경
    // return response.data.map<MediaView>((medias) => MediaView.fromJson(medias));
    return MediaView.fromJson(response.data);
  }
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
