// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PagingView _$PagingViewFromJson(Map<String, dynamic> json) {
  return _PagingView.fromJson(json);
}

/// @nodoc
mixin _$PagingView {
  String? get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PagingViewCopyWith<PagingView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagingViewCopyWith<$Res> {
  factory $PagingViewCopyWith(
          PagingView value, $Res Function(PagingView) then) =
      _$PagingViewCopyWithImpl<$Res, PagingView>;
  @useResult
  $Res call({String? next});
}

/// @nodoc
class _$PagingViewCopyWithImpl<$Res, $Val extends PagingView>
    implements $PagingViewCopyWith<$Res> {
  _$PagingViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PagingViewCopyWith<$Res>
    implements $PagingViewCopyWith<$Res> {
  factory _$$_PagingViewCopyWith(
          _$_PagingView value, $Res Function(_$_PagingView) then) =
      __$$_PagingViewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? next});
}

/// @nodoc
class __$$_PagingViewCopyWithImpl<$Res>
    extends _$PagingViewCopyWithImpl<$Res, _$_PagingView>
    implements _$$_PagingViewCopyWith<$Res> {
  __$$_PagingViewCopyWithImpl(
      _$_PagingView _value, $Res Function(_$_PagingView) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$_PagingView(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PagingView implements _PagingView {
  _$_PagingView({required this.next});

  factory _$_PagingView.fromJson(Map<String, dynamic> json) =>
      _$$_PagingViewFromJson(json);

  @override
  final String? next;

  @override
  String toString() {
    return 'PagingView(next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PagingView &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PagingViewCopyWith<_$_PagingView> get copyWith =>
      __$$_PagingViewCopyWithImpl<_$_PagingView>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PagingViewToJson(
      this,
    );
  }
}

abstract class _PagingView implements PagingView {
  factory _PagingView({required final String? next}) = _$_PagingView;

  factory _PagingView.fromJson(Map<String, dynamic> json) =
      _$_PagingView.fromJson;

  @override
  String? get next;
  @override
  @JsonKey(ignore: true)
  _$$_PagingViewCopyWith<_$_PagingView> get copyWith =>
      throw _privateConstructorUsedError;
}
