import 'package:Kiffy/domain/core/enum/media_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_contact.freezed.dart';
part 'user_profile_contact.g.dart';

@freezed
class UserProfileContact with _$UserProfileContact {
  factory UserProfileContact({
    required String contactId,
    required String contactType,
  }) = _UserProfileContact;

  factory UserProfileContact.fromJson(Map<String, dynamic> json) => _$UserProfileContactFromJson(json);
}
