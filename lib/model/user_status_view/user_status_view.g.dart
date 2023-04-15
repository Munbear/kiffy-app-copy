// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_status_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserStatusView _$$_UserStatusViewFromJson(Map<String, dynamic> json) =>
    _$_UserStatusView(
      id: json['id'] as String,
      email: json['email'] as String,
      status: $enumDecode(_$UserStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_UserStatusViewToJson(_$_UserStatusView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'status': _$UserStatusEnumMap[instance.status]!,
    };

const _$UserStatusEnumMap = {
  UserStatus.JOINER: 'JOINER',
  UserStatus.APPROVED: 'APPROVED',
  UserStatus.PENDING: 'PENDING',
  UserStatus.REJECTED: 'REJECTED',
};
