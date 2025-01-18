// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_money_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DepositMoneyRequest _$DepositMoneyRequestFromJson(Map<String, dynamic> json) {
  return _DepositMoneyRequest.fromJson(json);
}

/// @nodoc
mixin _$DepositMoneyRequest {
  @JsonKey(name: "phone_number")
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "balance")
  double? get amount => throw _privateConstructorUsedError;

  /// Serializes this DepositMoneyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DepositMoneyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepositMoneyRequestCopyWith<DepositMoneyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositMoneyRequestCopyWith<$Res> {
  factory $DepositMoneyRequestCopyWith(
          DepositMoneyRequest value, $Res Function(DepositMoneyRequest) then) =
      _$DepositMoneyRequestCopyWithImpl<$Res, DepositMoneyRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "phone_number") String phoneNumber,
      @JsonKey(name: "balance") double? amount});
}

/// @nodoc
class _$DepositMoneyRequestCopyWithImpl<$Res, $Val extends DepositMoneyRequest>
    implements $DepositMoneyRequestCopyWith<$Res> {
  _$DepositMoneyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DepositMoneyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepositMoneyRequestImplCopyWith<$Res>
    implements $DepositMoneyRequestCopyWith<$Res> {
  factory _$$DepositMoneyRequestImplCopyWith(_$DepositMoneyRequestImpl value,
          $Res Function(_$DepositMoneyRequestImpl) then) =
      __$$DepositMoneyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "phone_number") String phoneNumber,
      @JsonKey(name: "balance") double? amount});
}

/// @nodoc
class __$$DepositMoneyRequestImplCopyWithImpl<$Res>
    extends _$DepositMoneyRequestCopyWithImpl<$Res, _$DepositMoneyRequestImpl>
    implements _$$DepositMoneyRequestImplCopyWith<$Res> {
  __$$DepositMoneyRequestImplCopyWithImpl(_$DepositMoneyRequestImpl _value,
      $Res Function(_$DepositMoneyRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of DepositMoneyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? amount = freezed,
  }) {
    return _then(_$DepositMoneyRequestImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepositMoneyRequestImpl implements _DepositMoneyRequest {
  const _$DepositMoneyRequestImpl(
      {@JsonKey(name: "phone_number") required this.phoneNumber,
      @JsonKey(name: "balance") required this.amount});

  factory _$DepositMoneyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepositMoneyRequestImplFromJson(json);

  @override
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @override
  @JsonKey(name: "balance")
  final double? amount;

  @override
  String toString() {
    return 'DepositMoneyRequest(phoneNumber: $phoneNumber, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositMoneyRequestImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, amount);

  /// Create a copy of DepositMoneyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositMoneyRequestImplCopyWith<_$DepositMoneyRequestImpl> get copyWith =>
      __$$DepositMoneyRequestImplCopyWithImpl<_$DepositMoneyRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepositMoneyRequestImplToJson(
      this,
    );
  }
}

abstract class _DepositMoneyRequest implements DepositMoneyRequest {
  const factory _DepositMoneyRequest(
          {@JsonKey(name: "phone_number") required final String phoneNumber,
          @JsonKey(name: "balance") required final double? amount}) =
      _$DepositMoneyRequestImpl;

  factory _DepositMoneyRequest.fromJson(Map<String, dynamic> json) =
      _$DepositMoneyRequestImpl.fromJson;

  @override
  @JsonKey(name: "phone_number")
  String get phoneNumber;
  @override
  @JsonKey(name: "balance")
  double? get amount;

  /// Create a copy of DepositMoneyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepositMoneyRequestImplCopyWith<_$DepositMoneyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
