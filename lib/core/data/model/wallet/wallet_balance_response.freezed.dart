// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_balance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletBalanceResponse _$WalletBalanceResponseFromJson(
    Map<String, dynamic> json) {
  return _WalletBalanceResponse.fromJson(json);
}

/// @nodoc
mixin _$WalletBalanceResponse {
  String get balance => throw _privateConstructorUsedError;

  /// Serializes this WalletBalanceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletBalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletBalanceResponseCopyWith<WalletBalanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletBalanceResponseCopyWith<$Res> {
  factory $WalletBalanceResponseCopyWith(WalletBalanceResponse value,
          $Res Function(WalletBalanceResponse) then) =
      _$WalletBalanceResponseCopyWithImpl<$Res, WalletBalanceResponse>;
  @useResult
  $Res call({String balance});
}

/// @nodoc
class _$WalletBalanceResponseCopyWithImpl<$Res,
        $Val extends WalletBalanceResponse>
    implements $WalletBalanceResponseCopyWith<$Res> {
  _$WalletBalanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletBalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletBalanceResponseImplCopyWith<$Res>
    implements $WalletBalanceResponseCopyWith<$Res> {
  factory _$$WalletBalanceResponseImplCopyWith(
          _$WalletBalanceResponseImpl value,
          $Res Function(_$WalletBalanceResponseImpl) then) =
      __$$WalletBalanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String balance});
}

/// @nodoc
class __$$WalletBalanceResponseImplCopyWithImpl<$Res>
    extends _$WalletBalanceResponseCopyWithImpl<$Res,
        _$WalletBalanceResponseImpl>
    implements _$$WalletBalanceResponseImplCopyWith<$Res> {
  __$$WalletBalanceResponseImplCopyWithImpl(_$WalletBalanceResponseImpl _value,
      $Res Function(_$WalletBalanceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletBalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
  }) {
    return _then(_$WalletBalanceResponseImpl(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletBalanceResponseImpl implements _WalletBalanceResponse {
  const _$WalletBalanceResponseImpl({required this.balance});

  factory _$WalletBalanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletBalanceResponseImplFromJson(json);

  @override
  final String balance;

  @override
  String toString() {
    return 'WalletBalanceResponse(balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletBalanceResponseImpl &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, balance);

  /// Create a copy of WalletBalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletBalanceResponseImplCopyWith<_$WalletBalanceResponseImpl>
      get copyWith => __$$WalletBalanceResponseImplCopyWithImpl<
          _$WalletBalanceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletBalanceResponseImplToJson(
      this,
    );
  }
}

abstract class _WalletBalanceResponse implements WalletBalanceResponse {
  const factory _WalletBalanceResponse({required final String balance}) =
      _$WalletBalanceResponseImpl;

  factory _WalletBalanceResponse.fromJson(Map<String, dynamic> json) =
      _$WalletBalanceResponseImpl.fromJson;

  @override
  String get balance;

  /// Create a copy of WalletBalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletBalanceResponseImplCopyWith<_$WalletBalanceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
