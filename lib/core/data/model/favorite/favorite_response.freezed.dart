// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavoriteResponse _$FavoriteResponseFromJson(Map<String, dynamic> json) {
  return _FavoriteResponse.fromJson(json);
}

/// @nodoc
mixin _$FavoriteResponse {
  String get message => throw _privateConstructorUsedError;

  /// Serializes this FavoriteResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteResponseCopyWith<FavoriteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteResponseCopyWith<$Res> {
  factory $FavoriteResponseCopyWith(
          FavoriteResponse value, $Res Function(FavoriteResponse) then) =
      _$FavoriteResponseCopyWithImpl<$Res, FavoriteResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FavoriteResponseCopyWithImpl<$Res, $Val extends FavoriteResponse>
    implements $FavoriteResponseCopyWith<$Res> {
  _$FavoriteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteResponseImplCopyWith<$Res>
    implements $FavoriteResponseCopyWith<$Res> {
  factory _$$FavoriteResponseImplCopyWith(_$FavoriteResponseImpl value,
          $Res Function(_$FavoriteResponseImpl) then) =
      __$$FavoriteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FavoriteResponseImplCopyWithImpl<$Res>
    extends _$FavoriteResponseCopyWithImpl<$Res, _$FavoriteResponseImpl>
    implements _$$FavoriteResponseImplCopyWith<$Res> {
  __$$FavoriteResponseImplCopyWithImpl(_$FavoriteResponseImpl _value,
      $Res Function(_$FavoriteResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FavoriteResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteResponseImpl implements _FavoriteResponse {
  const _$FavoriteResponseImpl({required this.message});

  factory _$FavoriteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteResponseImplFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'FavoriteResponse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteResponseImplCopyWith<_$FavoriteResponseImpl> get copyWith =>
      __$$FavoriteResponseImplCopyWithImpl<_$FavoriteResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteResponseImplToJson(
      this,
    );
  }
}

abstract class _FavoriteResponse implements FavoriteResponse {
  const factory _FavoriteResponse({required final String message}) =
      _$FavoriteResponseImpl;

  factory _FavoriteResponse.fromJson(Map<String, dynamic> json) =
      _$FavoriteResponseImpl.fromJson;

  @override
  String get message;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteResponseImplCopyWith<_$FavoriteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
