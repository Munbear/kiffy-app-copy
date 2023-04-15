// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_status_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserStatusView _$UserStatusViewFromJson(Map<String, dynamic> json) {
  return _UserStatusView.fromJson(json);
}

/// @nodoc
mixin _$UserStatusView {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  UserStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatusViewCopyWith<UserStatusView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatusViewCopyWith<$Res> {
  factory $UserStatusViewCopyWith(
          UserStatusView value, $Res Function(UserStatusView) then) =
      _$UserStatusViewCopyWithImpl<$Res, UserStatusView>;
  @useResult
  $Res call({String id, String email, UserStatus status});
}

/// @nodoc
class _$UserStatusViewCopyWithImpl<$Res, $Val extends UserStatusView>
    implements $UserStatusViewCopyWith<$Res> {
  _$UserStatusViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserStatusViewCopyWith<$Res>
    implements $UserStatusViewCopyWith<$Res> {
  factory _$$_UserStatusViewCopyWith(
          _$_UserStatusView value, $Res Function(_$_UserStatusView) then) =
      __$$_UserStatusViewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email, UserStatus status});
}

/// @nodoc
class __$$_UserStatusViewCopyWithImpl<$Res>
    extends _$UserStatusViewCopyWithImpl<$Res, _$_UserStatusView>
    implements _$$_UserStatusViewCopyWith<$Res> {
  __$$_UserStatusViewCopyWithImpl(
      _$_UserStatusView _value, $Res Function(_$_UserStatusView) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? status = null,
  }) {
    return _then(_$_UserStatusView(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserStatusView implements _UserStatusView {
  _$_UserStatusView(
      {required this.id, required this.email, required this.status});

  factory _$_UserStatusView.fromJson(Map<String, dynamic> json) =>
      _$$_UserStatusViewFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final UserStatus status;

  @override
  String toString() {
    return 'UserStatusView(id: $id, email: $email, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserStatusView &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserStatusViewCopyWith<_$_UserStatusView> get copyWith =>
      __$$_UserStatusViewCopyWithImpl<_$_UserStatusView>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserStatusViewToJson(
      this,
    );
  }
}

abstract class _UserStatusView implements UserStatusView {
  factory _UserStatusView(
      {required final String id,
      required final String email,
      required final UserStatus status}) = _$_UserStatusView;

  factory _UserStatusView.fromJson(Map<String, dynamic> json) =
      _$_UserStatusView.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  UserStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_UserStatusViewCopyWith<_$_UserStatusView> get copyWith =>
      throw _privateConstructorUsedError;
}
