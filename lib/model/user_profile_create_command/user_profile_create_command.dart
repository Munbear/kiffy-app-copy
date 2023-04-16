import 'package:Kiffy/domain/core/model/gender_type.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_contact/user_profile_create_and_edit_command_profile_contact.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_media/user_profile_create_and_edit_command_profile_media.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_create_command.freezed.dart';
part 'user_profile_create_command.g.dart';

@freezed
class UserProfileCreateCommand with _$UserProfileCreateCommand {
  factory UserProfileCreateCommand({
    required String name,
    required Gender gender,
    required String birthDate,
    required String intro,
    required List<UserProfileCreateAndEditCommandProfileMedia> medias,
    required List<UserProfileCreateAndEditCommanProfileContact> contacts,
  }) = _UserProfileCreateCommand;

  factory UserProfileCreateCommand.fromJson(Map<String, dynamic> json) => _$UserProfileCreateCommandFromJson(json);
}
