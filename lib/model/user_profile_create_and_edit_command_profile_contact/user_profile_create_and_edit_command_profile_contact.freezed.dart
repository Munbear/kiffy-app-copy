// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_create_and_edit_command_profile_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileCreateAndEditCommanProfileContact
    _$UserProfileCreateAndEditCommanProfileContactFromJson(
        Map<String, dynamic> json) {
  return _UserProfileCreateAndEditCommanProfileContact.fromJson(json);
}

/// @nodoc
mixin _$UserProfileCreateAndEditCommanProfileContact {
  String get contactId => throw _privateConstructorUsedError;
  ContactType get contactType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCreateAndEditCommanProfileContactCopyWith<
          UserProfileCreateAndEditCommanProfileContact>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCreateAndEditCommanProfileContactCopyWith<$Res> {
  factory $UserProfileCreateAndEditCommanProfileContactCopyWith(
          UserProfileCreateAndEditCommanProfileContact value,
          $Res Function(UserProfileCreateAndEditCommanProfileContact) then) =
      _$UserProfileCreateAndEditCommanProfileContactCopyWithImpl<$Res,
          UserProfileCreateAndEditCommanProfileContact>;
  @useResult
  $Res call({String contactId, ContactType contactType});
}

/// @nodoc
class _$UserProfileCreateAndEditCommanProfileContactCopyWithImpl<$Res,
        $Val extends UserProfileCreateAndEditCommanProfileContact>
    implements $UserProfileCreateAndEditCommanProfileContactCopyWith<$Res> {
  _$UserProfileCreateAndEditCommanProfileContactCopyWithImpl(
      this._value, this._then);

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
              as ContactType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileCreateAndEditCommanProfileContactCopyWith<$Res>
    implements $UserProfileCreateAndEditCommanProfileContactCopyWith<$Res> {
  factory _$$_UserProfileCreateAndEditCommanProfileContactCopyWith(
          _$_UserProfileCreateAndEditCommanProfileContact value,
          $Res Function(_$_UserProfileCreateAndEditCommanProfileContact) then) =
      __$$_UserProfileCreateAndEditCommanProfileContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String contactId, ContactType contactType});
}

/// @nodoc
class __$$_UserProfileCreateAndEditCommanProfileContactCopyWithImpl<$Res>
    extends _$UserProfileCreateAndEditCommanProfileContactCopyWithImpl<$Res,
        _$_UserProfileCreateAndEditCommanProfileContact>
    implements _$$_UserProfileCreateAndEditCommanProfileContactCopyWith<$Res> {
  __$$_UserProfileCreateAndEditCommanProfileContactCopyWithImpl(
      _$_UserProfileCreateAndEditCommanProfileContact _value,
      $Res Function(_$_UserProfileCreateAndEditCommanProfileContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactId = null,
    Object? contactType = null,
  }) {
    return _then(_$_UserProfileCreateAndEditCommanProfileContact(
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      contactType: null == contactType
          ? _value.contactType
          : contactType // ignore: cast_nullable_to_non_nullable
              as ContactType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileCreateAndEditCommanProfileContact
    implements _UserProfileCreateAndEditCommanProfileContact {
  _$_UserProfileCreateAndEditCommanProfileContact(
      {required this.contactId, required this.contactType});

  factory _$_UserProfileCreateAndEditCommanProfileContact.fromJson(
          Map<String, dynamic> json) =>
      _$$_UserProfileCreateAndEditCommanProfileContactFromJson(json);

  @override
  final String contactId;
  @override
  final ContactType contactType;

  @override
  String toString() {
    return 'UserProfileCreateAndEditCommanProfileContact(contactId: $contactId, contactType: $contactType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileCreateAndEditCommanProfileContact &&
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
  _$$_UserProfileCreateAndEditCommanProfileContactCopyWith<
          _$_UserProfileCreateAndEditCommanProfileContact>
      get copyWith =>
          __$$_UserProfileCreateAndEditCommanProfileContactCopyWithImpl<
                  _$_UserProfileCreateAndEditCommanProfileContact>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileCreateAndEditCommanProfileContactToJson(
      this,
    );
  }
}

abstract class _UserProfileCreateAndEditCommanProfileContact
    implements UserProfileCreateAndEditCommanProfileContact {
  factory _UserProfileCreateAndEditCommanProfileContact(
          {required final String contactId,
          required final ContactType contactType}) =
      _$_UserProfileCreateAndEditCommanProfileContact;

  factory _UserProfileCreateAndEditCommanProfileContact.fromJson(
          Map<String, dynamic> json) =
      _$_UserProfileCreateAndEditCommanProfileContact.fromJson;

  @override
  String get contactId;
  @override
  ContactType get contactType;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileCreateAndEditCommanProfileContactCopyWith<
          _$_UserProfileCreateAndEditCommanProfileContact>
      get copyWith => throw _privateConstructorUsedError;
}
