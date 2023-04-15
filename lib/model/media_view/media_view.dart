import 'package:Kiffy/domain/core/model/media_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_view.freezed.dart';
part 'media_view.g.dart';

@freezed
class MediaView with _$MediaView {
  factory MediaView({
    required MediaType type,
    required String id,
    required String url,
  }) = _MediaView;

  factory MediaView.fromJson(Map<String, dynamic> json) => _$MediaViewFromJson(json);
}
