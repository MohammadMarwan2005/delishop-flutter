// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionListResponse _$TransactionListResponseFromJson(
    Map<String, dynamic> json) {
  return _TransactionListResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionListResponse {
  List<Transaction> get data => throw _privateConstructorUsedError;

  /// Serializes this TransactionListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionListResponseCopyWith<TransactionListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionListResponseCopyWith<$Res> {
  factory $TransactionListResponseCopyWith(TransactionListResponse value,
          $Res Function(TransactionListResponse) then) =
      _$TransactionListResponseCopyWithImpl<$Res, TransactionListResponse>;
  @useResult
  $Res call({List<Transaction> data});
}

/// @nodoc
class _$TransactionListResponseCopyWithImpl<$Res,
        $Val extends TransactionListResponse>
    implements $TransactionListResponseCopyWith<$Res> {
  _$TransactionListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionListResponseImplCopyWith<$Res>
    implements $TransactionListResponseCopyWith<$Res> {
  factory _$$TransactionListResponseImplCopyWith(
          _$TransactionListResponseImpl value,
          $Res Function(_$TransactionListResponseImpl) then) =
      __$$TransactionListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Transaction> data});
}

/// @nodoc
class __$$TransactionListResponseImplCopyWithImpl<$Res>
    extends _$TransactionListResponseCopyWithImpl<$Res,
        _$TransactionListResponseImpl>
    implements _$$TransactionListResponseImplCopyWith<$Res> {
  __$$TransactionListResponseImplCopyWithImpl(
      _$TransactionListResponseImpl _value,
      $Res Function(_$TransactionListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$TransactionListResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionListResponseImpl implements _TransactionListResponse {
  const _$TransactionListResponseImpl({required final List<Transaction> data})
      : _data = data;

  factory _$TransactionListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionListResponseImplFromJson(json);

  final List<Transaction> _data;
  @override
  List<Transaction> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TransactionListResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionListResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of TransactionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionListResponseImplCopyWith<_$TransactionListResponseImpl>
      get copyWith => __$$TransactionListResponseImplCopyWithImpl<
          _$TransactionListResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionListResponseImplToJson(
      this,
    );
  }
}

abstract class _TransactionListResponse implements TransactionListResponse {
  const factory _TransactionListResponse(
      {required final List<Transaction> data}) = _$TransactionListResponseImpl;

  factory _TransactionListResponse.fromJson(Map<String, dynamic> json) =
      _$TransactionListResponseImpl.fromJson;

  @override
  List<Transaction> get data;

  /// Create a copy of TransactionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionListResponseImplCopyWith<_$TransactionListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
