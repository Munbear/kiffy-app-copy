// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileView _$UserProfileViewFromJson(Map<String, dynamic> json) {
  return _UserProfileView.fromJson(json);
}

/// @nodoc
mixin _$UserProfileView {
  String get id => throw _privateConstructorUsedError;
  UserStatus get status => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get intro => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  String get birthDate => throw _privateConstructorUsedError;
  MediaType get medias => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileViewCopyWith<UserProfileView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileViewCopyWith<$Res> {
  factory $UserProfileViewCopyWith(
          UserProfileView value, $Res Function(UserProfileView) then) =
      _$UserProfileViewCopyWithImpl<$Res, UserProfileView>;
  @useResult
  $Res call(
      {String id,
      UserStatus status,
      String name,
      String intro,
      Gender gender,
      String birthDate,
      MediaType medias});
}

/// @nodoc
class _$UserProfileViewCopyWithImpl<$Res, $Val extends UserProfileView>
    implements $UserProfileViewCopyWith<$Res> {
  _$UserProfileViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? name = null,
    Object? intro = null,
    Object? gender = null,
    Object? birthDate = null,
    Object? medias = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      medias: null == medias
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as MediaType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileViewCopyWith<$Res>
    implements $UserProfileViewCopyWith<$Res> {
  factory _$$_UserProfileViewCopyWith(
          _$_UserProfileView value, $Res Function(_$_UserProfileView) then) =
      __$$_UserProfileViewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      UserStatus status,
      String name,
      String intro,
      Gender gender,
      String birthDate,
      MediaType medias});
}

/// @nodoc
class __$$_UserProfileViewCopyWithImpl<$Res>
    extends _$UserProfileViewCopyWithImpl<$Res, _$_UserProfileView>
    implements _$$_UserProfileViewCopyWith<$Res> {
  __$$_UserProfileViewCopyWithImpl(
      _$_UserProfileView _value, $Res Function(_$_UserProfileView) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? name = null,
    Object? intro = null,
    Object? gender = null,
    Object? birthDate = null,
    Object? medias = null,
  }) {
    return _then(_$_UserProfileView(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      medias: null == medias
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as MediaType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileView implements _UserProfileView {
  _$_UserProfileView(
      {required this.id,
      required this.status,
      required this.name,
      required this.intro,
      required this.gender,
      required this.birthDate,
      required this.medias});

  factory _$_UserProfileView.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileViewFromJson(json);

  @override
  final String id;
  @override
  final UserStatus status;
  @override
  final String name;
  @override
  final String intro;
  @override
  final Gender gender;
  @override
  final String birthDate;
  @override
  final MediaType medias;

  @override
  String toString() {
    return 'UserProfileView(id: $id, status: $status, name: $name, intro: $intro, gender: $gender, birthDate: $birthDate, medias: $medias)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileView &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.intro, intro) || other.intro == intro) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.medias, medias) || other.medias == medias));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, status, name, intro, gender, birthDate, medias);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileViewCopyWith<_$_UserProfileView> get copyWith =>
      __$$_UserProfileViewCopyWithImpl<_$_UserProfileView>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileViewToJson(
      this,
    );
  }
}

abstract class _UserProfileView implements UserProfileView {
  factory _UserProfileView(
      {required final String id,
      required final UserStatus status,
      required final String name,
      required final String intro,
      required final Gender gender,
      required final String birthDate,
      required final MediaType medias}) = _$_UserProfileView;

  factory _UserProfileView.fromJson(Map<String, dynamic> json) =
      _$_UserProfileView.fromJson;

  @override
  String get id;
  @override
  UserStatus get status;
  @override
  String get name;
  @override
  String get intro;
  @override
  Gender get gender;
  @override
  String get birthDate;
  @override
  MediaType get medias;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileViewCopyWith<_$_UserProfileView> get copyWith =>
      throw _privateConstructorUsedError;
}
