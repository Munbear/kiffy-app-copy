import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_create_and_edit_command_profile_media.freezed.dart';
part 'user_profile_create_and_edit_command_profile_media.g.dart';

@freezed
class UserProfileCreateAndEditCommandProfileMedia with _$UserProfileCreateAndEditCommandProfileMedia {
  factory UserProfileCreateAndEditCommandProfileMedia({
    required String id,
    required int orderNum,
  }) = _UserProfileCreateAndEditCommandProfileMedia;

  factory UserProfileCreateAndEditCommandProfileMedia.fromJson(Map<String, dynamic> json) =>
      _$UserProfileCreateAndEditCommandProfileMediaFromJson(json);
}
