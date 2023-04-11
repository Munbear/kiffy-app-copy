// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_create_and_edit_command_profile_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileCreateAndEditCommandProfileMedia
    _$UserProfileCreateAndEditCommandProfileMediaFromJson(
        Map<String, dynamic> json) {
  return _UserProfileCreateAndEditCommandProfileMedia.fromJson(json);
}

/// @nodoc
mixin _$UserProfileCreateAndEditCommandProfileMedia {
  String get id => throw _privateConstructorUsedError;
  int get orderNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCreateAndEditCommandProfileMediaCopyWith<
          UserProfileCreateAndEditCommandProfileMedia>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCreateAndEditCommandProfileMediaCopyWith<$Res> {
  factory $UserProfileCreateAndEditCommandProfileMediaCopyWith(
          UserProfileCreateAndEditCommandProfileMedia value,
          $Res Function(UserProfileCreateAndEditCommandProfileMedia) then) =
      _$UserProfileCreateAndEditCommandProfileMediaCopyWithImpl<$Res,
          UserProfileCreateAndEditCommandProfileMedia>;
  @useResult
  $Res call({String id, int orderNum});
}

/// @nodoc
class _$UserProfileCreateAndEditCommandProfileMediaCopyWithImpl<$Res,
        $Val extends UserProfileCreateAndEditCommandProfileMedia>
    implements $UserProfileCreateAndEditCommandProfileMediaCopyWith<$Res> {
  _$UserProfileCreateAndEditCommandProfileMediaCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNum = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileCreateAndEditCommandProfileMediaCopyWith<$Res>
    implements $UserProfileCreateAndEditCommandProfileMediaCopyWith<$Res> {
  factory _$$_UserProfileCreateAndEditCommandProfileMediaCopyWith(
          _$_UserProfileCreateAndEditCommandProfileMedia value,
          $Res Function(_$_UserProfileCreateAndEditCommandProfileMedia) then) =
      __$$_UserProfileCreateAndEditCommandProfileMediaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int orderNum});
}

/// @nodoc
class __$$_UserProfileCreateAndEditCommandProfileMediaCopyWithImpl<$Res>
    extends _$UserProfileCreateAndEditCommandProfileMediaCopyWithImpl<$Res,
        _$_UserProfileCreateAndEditCommandProfileMedia>
    implements _$$_UserProfileCreateAndEditCommandProfileMediaCopyWith<$Res> {
  __$$_UserProfileCreateAndEditCommandProfileMediaCopyWithImpl(
      _$_UserProfileCreateAndEditCommandProfileMedia _value,
      $Res Function(_$_UserProfileCreateAndEditCommandProfileMedia) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNum = null,
  }) {
    return _then(_$_UserProfileCreateAndEditCommandProfileMedia(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileCreateAndEditCommandProfileMedia
    implements _UserProfileCreateAndEditCommandProfileMedia {
  _$_UserProfileCreateAndEditCommandProfileMedia(
      {required this.id, required this.orderNum});

  factory _$_UserProfileCreateAndEditCommandProfileMedia.fromJson(
          Map<String, dynamic> json) =>
      _$$_UserProfileCreateAndEditCommandProfileMediaFromJson(json);

  @override
  final String id;
  @override
  final int orderNum;

  @override
  String toString() {
    return 'UserProfileCreateAndEditCommandProfileMedia(id: $id, orderNum: $orderNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileCreateAndEditCommandProfileMedia &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNum, orderNum) ||
                other.orderNum == orderNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, orderNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileCreateAndEditCommandProfileMediaCopyWith<
          _$_UserProfileCreateAndEditCommandProfileMedia>
      get copyWith =>
          __$$_UserProfileCreateAndEditCommandProfileMediaCopyWithImpl<
              _$_UserProfileCreateAndEditCommandProfileMedia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileCreateAndEditCommandProfileMediaToJson(
      this,
    );
  }
}

abstract class _UserProfileCreateAndEditCommandProfileMedia
    implements UserProfileCreateAndEditCommandProfileMedia {
  factory _UserProfileCreateAndEditCommandProfileMedia(
          {required final String id, required final int orderNum}) =
      _$_UserProfileCreateAndEditCommandProfileMedia;

  factory _UserProfileCreateAndEditCommandProfileMedia.fromJson(
          Map<String, dynamic> json) =
      _$_UserProfileCreateAndEditCommandProfileMedia.fromJson;

  @override
  String get id;
  @override
  int get orderNum;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileCreateAndEditCommandProfileMediaCopyWith<
          _$_UserProfileCreateAndEditCommandProfileMedia>
      get copyWith => throw _privateConstructorUsedError;
}
