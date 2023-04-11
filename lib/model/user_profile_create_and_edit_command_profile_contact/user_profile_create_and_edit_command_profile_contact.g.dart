// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_create_and_edit_command_profile_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileCreateAndEditCommanProfileContact
    _$$_UserProfileCreateAndEditCommanProfileContactFromJson(
            Map<String, dynamic> json) =>
        _$_UserProfileCreateAndEditCommanProfileContact(
          contactId: json['contactId'] as String,
          orderNum: $enumDecode(_$ContactTypeEnumMap, json['orderNum']),
        );

Map<String, dynamic> _$$_UserProfileCreateAndEditCommanProfileContactToJson(
        _$_UserProfileCreateAndEditCommanProfileContact instance) =>
    <String, dynamic>{
      'contactId': instance.contactId,
      'orderNum': _$ContactTypeEnumMap[instance.orderNum]!,
    };

const _$ContactTypeEnumMap = {
  ContactType.LINE: 'LINE',
  ContactType.WHATSAPP: 'WHATSAPP',
};
