import 'package:Kiffy/domain/core/enum/gender_type.dart';
import 'package:Kiffy/domain/core/enum/media_type.dart';
import 'package:Kiffy/domain/core/enum/user_status.dart';
import 'package:Kiffy/model/media_view/media_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_view.freezed.dart';
part 'user_profile_view.g.dart';

@freezed
class UserProfileView with _$UserProfileView {
  factory UserProfileView({
    required String id,
    required UserStatus status,
    required String name,
    required String intro,
    required Gender gender,
    required String birthDate,
    required List<MediaView> medias,
  }) = _UserProfileView;

  factory UserProfileView.fromJson(Map<String, dynamic> json) => _$UserProfileViewFromJson(json);
}
