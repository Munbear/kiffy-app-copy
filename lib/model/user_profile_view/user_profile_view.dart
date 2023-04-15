import 'package:Kiffy/domain/core/model/gender_type.dart';
import 'package:Kiffy/domain/core/model/media_type.dart';
import 'package:Kiffy/domain/core/model/user_status.dart';
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
    required MediaType medias,
  }) = _UserProfileView;

  factory UserProfileView.fromJson(Map<String, dynamic> json) => _$UserProfileViewFromJson(json);
}
