// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wish_other_profiles_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WishOtherProfilesView _$WishOtherProfilesViewFromJson(
    Map<String, dynamic> json) {
  return _WishOtherProfilesView.fromJson(json);
}

/// @nodoc
mixin _$WishOtherProfilesView {
  List<UserProfileView> get list => throw _privateConstructorUsedError;
  PagingView get paging => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WishOtherProfilesViewCopyWith<WishOtherProfilesView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishOtherProfilesViewCopyWith<$Res> {
  factory $WishOtherProfilesViewCopyWith(WishOtherProfilesView value,
          $Res Function(WishOtherProfilesView) then) =
      _$WishOtherProfilesViewCopyWithImpl<$Res, WishOtherProfilesView>;
  @useResult
  $Res call({List<UserProfileView> list, PagingView paging});

  $PagingViewCopyWith<$Res> get paging;
}

/// @nodoc
class _$WishOtherProfilesViewCopyWithImpl<$Res,
        $Val extends WishOtherProfilesView>
    implements $WishOtherProfilesViewCopyWith<$Res> {
  _$WishOtherProfilesViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? paging = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<UserProfileView>,
      paging: null == paging
          ? _value.paging
          : paging // ignore: cast_nullable_to_non_nullable
              as PagingView,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PagingViewCopyWith<$Res> get paging {
    return $PagingViewCopyWith<$Res>(_value.paging, (value) {
      return _then(_value.copyWith(paging: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WishOtherProfilesViewCopyWith<$Res>
    implements $WishOtherProfilesViewCopyWith<$Res> {
  factory _$$_WishOtherProfilesViewCopyWith(_$_WishOtherProfilesView value,
          $Res Function(_$_WishOtherProfilesView) then) =
      __$$_WishOtherProfilesViewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserProfileView> list, PagingView paging});

  @override
  $PagingViewCopyWith<$Res> get paging;
}

/// @nodoc
class __$$_WishOtherProfilesViewCopyWithImpl<$Res>
    extends _$WishOtherProfilesViewCopyWithImpl<$Res, _$_WishOtherProfilesView>
    implements _$$_WishOtherProfilesViewCopyWith<$Res> {
  __$$_WishOtherProfilesViewCopyWithImpl(_$_WishOtherProfilesView _value,
      $Res Function(_$_WishOtherProfilesView) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? paging = null,
  }) {
    return _then(_$_WishOtherProfilesView(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<UserProfileView>,
      paging: null == paging
          ? _value.paging
          : paging // ignore: cast_nullable_to_non_nullable
              as PagingView,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WishOtherProfilesView implements _WishOtherProfilesView {
  _$_WishOtherProfilesView(
      {required final List<UserProfileView> list, required this.paging})
      : _list = list;

  factory _$_WishOtherProfilesView.fromJson(Map<String, dynamic> json) =>
      _$$_WishOtherProfilesViewFromJson(json);

  final List<UserProfileView> _list;
  @override
  List<UserProfileView> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final PagingView paging;

  @override
  String toString() {
    return 'WishOtherProfilesView(list: $list, paging: $paging)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WishOtherProfilesView &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.paging, paging) || other.paging == paging));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), paging);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WishOtherProfilesViewCopyWith<_$_WishOtherProfilesView> get copyWith =>
      __$$_WishOtherProfilesViewCopyWithImpl<_$_WishOtherProfilesView>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WishOtherProfilesViewToJson(
      this,
    );
  }
}

abstract class _WishOtherProfilesView implements WishOtherProfilesView {
  factory _WishOtherProfilesView(
      {required final List<UserProfileView> list,
      required final PagingView paging}) = _$_WishOtherProfilesView;

  factory _WishOtherProfilesView.fromJson(Map<String, dynamic> json) =
      _$_WishOtherProfilesView.fromJson;

  @override
  List<UserProfileView> get list;
  @override
  PagingView get paging;
  @override
  @JsonKey(ignore: true)
  _$$_WishOtherProfilesViewCopyWith<_$_WishOtherProfilesView> get copyWith =>
      throw _privateConstructorUsedError;
}
