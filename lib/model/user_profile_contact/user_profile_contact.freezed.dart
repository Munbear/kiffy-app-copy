// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileContact _$UserProfileContactFromJson(Map<String, dynamic> json) {
  return _UserProfileContact.fromJson(json);
}

/// @nodoc
mixin _$UserProfileContact {
  String get contactId => throw _privateConstructorUsedError;
  String get contactType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileContactCopyWith<UserProfileContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileContactCopyWith<$Res> {
  factory $UserProfileContactCopyWith(
          UserProfileContact value, $Res Function(UserProfileContact) then) =
      _$UserProfileContactCopyWithImpl<$Res, UserProfileContact>;
  @useResult
  $Res call({String contactId, String contactType});
}

/// @nodoc
class _$UserProfileContactCopyWithImpl<$Res, $Val extends UserProfileContact>
    implements $UserProfileContactCopyWith<$Res> {
  _$UserProfileContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactId = null,
    Object? contactType = null,
  }) {
    return _then(_value.copyWith(
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      contactType: null == contactType
          ? _value.contactType
          : contactType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileContactCopyWith<$Res>
    implements $UserProfileContactCopyWith<$Res> {
  factory _$$_UserProfileContactCopyWith(_$_UserProfileContact value,
          $Res Function(_$_UserProfileContact) then) =
      __$$_UserProfileContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String contactId, String contactType});
}

/// @nodoc
class __$$_UserProfileContactCopyWithImpl<$Res>
    extends _$UserProfileContactCopyWithImpl<$Res, _$_UserProfileContact>
    implements _$$_UserProfileContactCopyWith<$Res> {
  __$$_UserProfileContactCopyWithImpl(
      _$_UserProfileContact _value, $Res Function(_$_UserProfileContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactId = null,
    Object? contactType = null,
  }) {
    return _then(_$_UserProfileContact(
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      contactType: null == contactType
          ? _value.contactType
          : contactType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileContact implements _UserProfileContact {
  _$_UserProfileContact({required this.contactId, required this.contactType});

  factory _$_UserProfileContact.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileContactFromJson(json);

  @override
  final String contactId;
  @override
  final String contactType;

  @override
  String toString() {
    return 'UserProfileContact(contactId: $contactId, contactType: $contactType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileContact &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.contactType, contactType) ||
                other.contactType == contactType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contactId, contactType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileContactCopyWith<_$_UserProfileContact> get copyWith =>
      __$$_UserProfileContactCopyWithImpl<_$_UserProfileContact>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileContactToJson(
      this,
    );
  }
}

abstract class _UserProfileContact implements UserProfileContact {
  factory _UserProfileContact(
      {required final String contactId,
      required final String contactType}) = _$_UserProfileContact;

  factory _UserProfileContact.fromJson(Map<String, dynamic> json) =
      _$_UserProfileContact.fromJson;

  @override
  String get contactId;
  @override
  String get contactType;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileContactCopyWith<_$_UserProfileContact> get copyWith =>
      throw _privateConstructorUsedError;
}
