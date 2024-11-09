// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_layouts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppLayouts _$AppLayoutsFromJson(Map<String, dynamic> json) {
  return _AppLayouts.fromJson(json);
}

/// @nodoc
mixin _$AppLayouts {
  String? get home => throw _privateConstructorUsedError;
  String? get videos => throw _privateConstructorUsedError;

  /// Serializes this AppLayouts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppLayouts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppLayoutsCopyWith<AppLayouts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLayoutsCopyWith<$Res> {
  factory $AppLayoutsCopyWith(
          AppLayouts value, $Res Function(AppLayouts) then) =
      _$AppLayoutsCopyWithImpl<$Res, AppLayouts>;
  @useResult
  $Res call({String? home, String? videos});
}

/// @nodoc
class _$AppLayoutsCopyWithImpl<$Res, $Val extends AppLayouts>
    implements $AppLayoutsCopyWith<$Res> {
  _$AppLayoutsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppLayouts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = freezed,
    Object? videos = freezed,
  }) {
    return _then(_value.copyWith(
      home: freezed == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLayoutsImplCopyWith<$Res>
    implements $AppLayoutsCopyWith<$Res> {
  factory _$$AppLayoutsImplCopyWith(
          _$AppLayoutsImpl value, $Res Function(_$AppLayoutsImpl) then) =
      __$$AppLayoutsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? home, String? videos});
}

/// @nodoc
class __$$AppLayoutsImplCopyWithImpl<$Res>
    extends _$AppLayoutsCopyWithImpl<$Res, _$AppLayoutsImpl>
    implements _$$AppLayoutsImplCopyWith<$Res> {
  __$$AppLayoutsImplCopyWithImpl(
      _$AppLayoutsImpl _value, $Res Function(_$AppLayoutsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppLayouts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = freezed,
    Object? videos = freezed,
  }) {
    return _then(_$AppLayoutsImpl(
      home: freezed == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppLayoutsImpl implements _AppLayouts {
  const _$AppLayoutsImpl({this.home, this.videos});

  factory _$AppLayoutsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppLayoutsImplFromJson(json);

  @override
  final String? home;
  @override
  final String? videos;

  @override
  String toString() {
    return 'AppLayouts(home: $home, videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLayoutsImpl &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.videos, videos) || other.videos == videos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, home, videos);

  /// Create a copy of AppLayouts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLayoutsImplCopyWith<_$AppLayoutsImpl> get copyWith =>
      __$$AppLayoutsImplCopyWithImpl<_$AppLayoutsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppLayoutsImplToJson(
      this,
    );
  }
}

abstract class _AppLayouts implements AppLayouts {
  const factory _AppLayouts({final String? home, final String? videos}) =
      _$AppLayoutsImpl;

  factory _AppLayouts.fromJson(Map<String, dynamic> json) =
      _$AppLayoutsImpl.fromJson;

  @override
  String? get home;
  @override
  String? get videos;

  /// Create a copy of AppLayouts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppLayoutsImplCopyWith<_$AppLayoutsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
