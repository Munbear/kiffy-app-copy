// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileView _$$_UserProfileViewFromJson(Map<String, dynamic> json) =>
    _$_UserProfileView(
      id: json['id'] as String,
      status: $enumDecode(_$UserStatusEnumMap, json['status']),
      name: json['name'] as String,
      intro: json['intro'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      birthDate: json['birthDate'] as String,
      medias: (json['medias'] as List<dynamic>)
          .map((e) => MediaView.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => UserProfileContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserProfileViewToJson(_$_UserProfileView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$UserStatusEnumMap[instance.status]!,
      'name': instance.name,
      'intro': instance.intro,
      'gender': _$GenderEnumMap[instance.gender]!,
      'birthDate': instance.birthDate,
      'medias': instance.medias,
      'contacts': instance.contacts,
    };

const _$UserStatusEnumMap = {
  UserStatus.JOINER: 'JOINER',
  UserStatus.APPROVED: 'APPROVED',
  UserStatus.PENDING: 'PENDING',
  UserStatus.REJECTED: 'REJECTED',
};

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
};
