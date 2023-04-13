// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaView _$$_MediaViewFromJson(Map<String, dynamic> json) => _$_MediaView(
      type: $enumDecode(_$MediaTypeEnumMap, json['type']),
      id: json['id'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_MediaViewToJson(_$_MediaView instance) =>
    <String, dynamic>{
      'type': _$MediaTypeEnumMap[instance.type]!,
      'id': instance.id,
      'url': instance.url,
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
};
