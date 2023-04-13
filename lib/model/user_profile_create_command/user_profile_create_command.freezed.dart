// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_create_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileCreateCommand _$UserProfileCreateCommandFromJson(
    Map<String, dynamic> json) {
  return _UserProfileCreateCommand.fromJson(json);
}

/// @nodoc
mixin _$UserProfileCreateCommand {
  String get name => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;
  String get intro => throw _privateConstructorUsedError;
  UserProfileCreateAndEditCommandProfileMedia get medias =>
      throw _privateConstructorUsedError;
  UserProfileCreateAndEditCommanProfileContact get contacts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCreateCommandCopyWith<UserProfileCreateCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCreateCommandCopyWith<$Res> {
  factory $UserProfileCreateCommandCopyWith(UserProfileCreateCommand value,
          $Res Function(UserProfileCreateCommand) then) =
      _$UserProfileCreateCommandCopyWithImpl<$Res, UserProfileCreateCommand>;
  @useResult
  $Res call(
      {String name,
      Gender gender,
      DateTime birthDate,
      String intro,
      UserProfileCreateAndEditCommandProfileMedia medias,
      UserProfileCreateAndEditCommanProfileContact contacts});

  $UserProfileCreateAndEditCommandProfileMediaCopyWith<$Res> get medias;
  $UserProfileCreateAndEditCommanProfileContactCopyWith<$Res> get contacts;
}

/// @nodoc
class _$UserProfileCreateCommandCopyWithImpl<$Res,
        $Val extends UserProfileCreateCommand>
    implements $UserProfileCreateCommandCopyWith<$Res> {
  _$UserProfileCreateCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? gender = null,
    Object? birthDate = null,
    Object? intro = null,
    Object? medias = null,
    Object? contacts = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
      medias: null == medias
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as UserProfileCreateAndEditCommandProfileMedia,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as UserProfileCreateAndEditCommanProfileContact,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCreateAndEditCommandProfileMediaCopyWith<$Res> get medias {
    return $UserProfileCreateAndEditCommandProfileMediaCopyWith<$Res>(
        _value.medias, (value) {
      return _then(_value.copyWith(medias: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCreateAndEditCommanProfileContactCopyWith<$Res> get contacts {
    return $UserProfileCreateAndEditCommanProfileContactCopyWith<$Res>(
        _value.contacts, (value) {
      return _then(_value.copyWith(contacts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserProfileCreateCommandCopyWith<$Res>
    implements $UserProfileCreateCommandCopyWith<$Res> {
  factory _$$_UserProfileCreateCommandCopyWith(
          _$_UserProfileCreateCommand value,
          $Res Function(_$_UserProfileCreateCommand) then) =
      __$$_UserProfileCreateCommandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      Gender gender,
      DateTime birthDate,
      String intro,
      UserProfileCreateAndEditCommandProfileMedia medias,
      UserProfileCreateAndEditCommanProfileContact contacts});

  @override
  $UserProfileCreateAndEditCommandProfileMediaCopyWith<$Res> get medias;
  @override
  $UserProfileCreateAndEditCommanProfileContactCopyWith<$Res> get contacts;
}

/// @nodoc
class __$$_UserProfileCreateCommandCopyWithImpl<$Res>
    extends _$UserProfileCreateCommandCopyWithImpl<$Res,
        _$_UserProfileCreateCommand>
    implements _$$_UserProfileCreateCommandCopyWith<$Res> {
  __$$_UserProfileCreateCommandCopyWithImpl(_$_UserProfileCreateCommand _value,
      $Res Function(_$_UserProfileCreateCommand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? gender = null,
    Object? birthDate = null,
    Object? intro = null,
    Object? medias = null,
    Object? contacts = null,
  }) {
    return _then(_$_UserProfileCreateCommand(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
      medias: null == medias
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as UserProfileCreateAndEditCommandProfileMedia,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as UserProfileCreateAndEditCommanProfileContact,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileCreateCommand implements _UserProfileCreateCommand {
  _$_UserProfileCreateCommand(
      {required this.name,
      required this.gender,
      required this.birthDate,
      required this.intro,
      required this.medias,
      required this.contacts});

  factory _$_UserProfileCreateCommand.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileCreateCommandFromJson(json);

  @override
  final String name;
  @override
  final Gender gender;
  @override
  final DateTime birthDate;
  @override
  final String intro;
  @override
  final UserProfileCreateAndEditCommandProfileMedia medias;
  @override
  final UserProfileCreateAndEditCommanProfileContact contacts;

  @override
  String toString() {
    return 'UserProfileCreateCommand(name: $name, gender: $gender, birthDate: $birthDate, intro: $intro, medias: $medias, contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileCreateCommand &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.intro, intro) || other.intro == intro) &&
            (identical(other.medias, medias) || other.medias == medias) &&
            (identical(other.contacts, contacts) ||
                other.contacts == contacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, gender, birthDate, intro, medias, contacts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileCreateCommandCopyWith<_$_UserProfileCreateCommand>
      get copyWith => __$$_UserProfileCreateCommandCopyWithImpl<
          _$_UserProfileCreateCommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileCreateCommandToJson(
      this,
    );
  }
}

abstract class _UserProfileCreateCommand implements UserProfileCreateCommand {
  factory _UserProfileCreateCommand(
      {required final String name,
      required final Gender gender,
      required final DateTime birthDate,
      required final String intro,
      required final UserProfileCreateAndEditCommandProfileMedia medias,
      required final UserProfileCreateAndEditCommanProfileContact
          contacts}) = _$_UserProfileCreateCommand;

  factory _UserProfileCreateCommand.fromJson(Map<String, dynamic> json) =
      _$_UserProfileCreateCommand.fromJson;

  @override
  String get name;
  @override
  Gender get gender;
  @override
  DateTime get birthDate;
  @override
  String get intro;
  @override
  UserProfileCreateAndEditCommandProfileMedia get medias;
  @override
  UserProfileCreateAndEditCommanProfileContact get contacts;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileCreateCommandCopyWith<_$_UserProfileCreateCommand>
      get copyWith => throw _privateConstructorUsedError;
}
