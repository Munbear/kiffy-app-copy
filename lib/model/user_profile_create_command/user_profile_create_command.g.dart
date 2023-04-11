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
      birthDate: DateTime.parse(json['birthDate'] as String),
      intro: json['intro'] as String,
      medias: (json['medias'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_UserProfileCreateCommandToJson(
        _$_UserProfileCreateCommand instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': _$GenderEnumMap[instance.gender]!,
      'birthDate': instance.birthDate.toIso8601String(),
      'intro': instance.intro,
      'medias': instance.medias,
      'contacts': instance.contacts,
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
};
