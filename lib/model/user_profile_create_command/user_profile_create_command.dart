import 'package:Kiffy/domain/core/model/Gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_create_command.freezed.dart';
part 'user_profile_create_command.g.dart';

@freezed
class UserProfileCreateCommand with _$UserProfileCreateCommand {
  factory UserProfileCreateCommand({
    required String name,
    required Gender gender,
    required DateTime birthDate,
    required String intro,
    required List<Map<String, dynamic>> medias,
    required List<Map<String, dynamic>> contacts,
  }) = _UserProfileCreateCommand;

  factory UserProfileCreateCommand.fromJson(Map<String, dynamic> json) => _$UserProfileCreateCommandFromJson(json);
}
