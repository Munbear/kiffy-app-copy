import 'package:openapi/openapi.dart';

class MediaModel {
  String id;
  MediaTypeEnumView type;
  String url;

  MediaModel({
    required this.id,
    required this.type,
    required this.url,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'] as String,
      type: json['type'] as MediaTypeEnumView,
      url: json['url'] as String,
    );
  }
}
