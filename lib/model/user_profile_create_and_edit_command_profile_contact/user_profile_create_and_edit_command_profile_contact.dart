import 'package:Kiffy/domain/core/model/contact_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_create_and_edit_command_profile_contact.freezed.dart';
part 'user_profile_create_and_edit_command_profile_contact.g.dart';

@freezed
class UserProfileCreateAndEditCommanProfileContact with _$UserProfileCreateAndEditCommanProfileContact {
  factory UserProfileCreateAndEditCommanProfileContact({
    required String contactId,
    required ContactType orderNum,
  }) = _UserProfileCreateAndEditCommanProfileContact;

  factory UserProfileCreateAndEditCommanProfileContact.fromJson(Map<String, dynamic> json) =>
      _$UserProfileCreateAndEditCommanProfileContactFromJson(json);
}
