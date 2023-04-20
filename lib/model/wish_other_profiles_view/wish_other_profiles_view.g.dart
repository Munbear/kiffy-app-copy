// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_other_profiles_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WishOtherProfilesView _$$_WishOtherProfilesViewFromJson(
        Map<String, dynamic> json) =>
    _$_WishOtherProfilesView(
      list: (json['list'] as List<dynamic>)
          .map((e) => UserProfileView.fromJson(e as Map<String, dynamic>))
          .toList(),
      paging: PagingView.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WishOtherProfilesViewToJson(
        _$_WishOtherProfilesView instance) =>
    <String, dynamic>{
      'list': instance.list,
      'paging': instance.paging,
    };
