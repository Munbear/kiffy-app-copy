// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_user_profiles_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExploreUserProfilesView _$$_ExploreUserProfilesViewFromJson(
        Map<String, dynamic> json) =>
    _$_ExploreUserProfilesView(
      list: (json['list'] as List<dynamic>)
          .map((e) => UserProfileView.fromJson(e as Map<String, dynamic>))
          .toList(),
      paging: PagingView.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ExploreUserProfilesViewToJson(
        _$_ExploreUserProfilesView instance) =>
    <String, dynamic>{
      'list': instance.list,
      'paging': instance.paging,
    };
