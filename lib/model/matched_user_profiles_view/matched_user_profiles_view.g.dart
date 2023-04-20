// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_user_profiles_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatchedUserProfilesView _$$_MatchedUserProfilesViewFromJson(
        Map<String, dynamic> json) =>
    _$_MatchedUserProfilesView(
      list: (json['list'] as List<dynamic>)
          .map((e) => UserProfileView.fromJson(e as Map<String, dynamic>))
          .toList(),
      paging: PagingView.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MatchedUserProfilesViewToJson(
        _$_MatchedUserProfilesView instance) =>
    <String, dynamic>{
      'list': instance.list,
      'paging': instance.paging,
    };
