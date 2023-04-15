// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_create_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileCreateCommand _$$_UserProfileCreateCommandFromJson(
        Map<String, dynamic> json) =>
    _$_UserProfileCreateCommand(
      name: json['name'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      birthDate: json['birthDate'] as String,
      intro: json['intro'] as String,
      medias: UserProfileCreateAndEditCommandProfileMedia.fromJson(
          json['medias'] as Map<String, dynamic>),
      contacts: UserProfileCreateAndEditCommanProfileContact.fromJson(
          json['contacts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserProfileCreateCommandToJson(
        _$_UserProfileCreateCommand instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': _$GenderEnumMap[instance.gender]!,
      'birthDate': instance.birthDate,
      'intro': instance.intro,
      'medias': instance.medias,
      'contacts': instance.contacts,
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
};
