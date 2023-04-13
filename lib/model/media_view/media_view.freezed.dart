// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaView _$MediaViewFromJson(Map<String, dynamic> json) {
  return _MediaView.fromJson(json);
}

/// @nodoc
mixin _$MediaView {
  MediaType get type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaViewCopyWith<MediaView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaViewCopyWith<$Res> {
  factory $MediaViewCopyWith(MediaView value, $Res Function(MediaView) then) =
      _$MediaViewCopyWithImpl<$Res, MediaView>;
  @useResult
  $Res call({MediaType type, String id, String url});
}

/// @nodoc
class _$MediaViewCopyWithImpl<$Res, $Val extends MediaView>
    implements $MediaViewCopyWith<$Res> {
  _$MediaViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaViewCopyWith<$Res> implements $MediaViewCopyWith<$Res> {
  factory _$$_MediaViewCopyWith(
          _$_MediaView value, $Res Function(_$_MediaView) then) =
      __$$_MediaViewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MediaType type, String id, String url});
}

/// @nodoc
class __$$_MediaViewCopyWithImpl<$Res>
    extends _$MediaViewCopyWithImpl<$Res, _$_MediaView>
    implements _$$_MediaViewCopyWith<$Res> {
  __$$_MediaViewCopyWithImpl(
      _$_MediaView _value, $Res Function(_$_MediaView) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_$_MediaView(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaView implements _MediaView {
  _$_MediaView({required this.type, required this.id, required this.url});

  factory _$_MediaView.fromJson(Map<String, dynamic> json) =>
      _$$_MediaViewFromJson(json);

  @override
  final MediaType type;
  @override
  final String id;
  @override
  final String url;

  @override
  String toString() {
    return 'MediaView(type: $type, id: $id, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaView &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, id, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaViewCopyWith<_$_MediaView> get copyWith =>
      __$$_MediaViewCopyWithImpl<_$_MediaView>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaViewToJson(
      this,
    );
  }
}

abstract class _MediaView implements MediaView {
  factory _MediaView(
      {required final MediaType type,
      required final String id,
      required final String url}) = _$_MediaView;

  factory _MediaView.fromJson(Map<String, dynamic> json) =
      _$_MediaView.fromJson;

  @override
  MediaType get type;
  @override
  String get id;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_MediaViewCopyWith<_$_MediaView> get copyWith =>
      throw _privateConstructorUsedError;
}
