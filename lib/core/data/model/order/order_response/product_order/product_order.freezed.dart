// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductOrder _$ProductOrderFromJson(Map<String, dynamic> json) {
  return _ProductOrder.fromJson(json);
}

/// @nodoc
mixin _$ProductOrder {
  @JsonKey(name: "product_id")
  int get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;

  /// Serializes this ProductOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductOrderCopyWith<ProductOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOrderCopyWith<$Res> {
  factory $ProductOrderCopyWith(
          ProductOrder value, $Res Function(ProductOrder) then) =
      _$ProductOrderCopyWithImpl<$Res, ProductOrder>;
  @useResult
  $Res call(
      {@JsonKey(name: "product_id") int productId,
      String name,
      String price,
      int quantity,
      double subtotal});
}

/// @nodoc
class _$ProductOrderCopyWithImpl<$Res, $Val extends ProductOrder>
    implements $ProductOrderCopyWith<$Res> {
  _$ProductOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? subtotal = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductOrderImplCopyWith<$Res>
    implements $ProductOrderCopyWith<$Res> {
  factory _$$ProductOrderImplCopyWith(
          _$ProductOrderImpl value, $Res Function(_$ProductOrderImpl) then) =
      __$$ProductOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "product_id") int productId,
      String name,
      String price,
      int quantity,
      double subtotal});
}

/// @nodoc
class __$$ProductOrderImplCopyWithImpl<$Res>
    extends _$ProductOrderCopyWithImpl<$Res, _$ProductOrderImpl>
    implements _$$ProductOrderImplCopyWith<$Res> {
  __$$ProductOrderImplCopyWithImpl(
      _$ProductOrderImpl _value, $Res Function(_$ProductOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? subtotal = null,
  }) {
    return _then(_$ProductOrderImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductOrderImpl implements _ProductOrder {
  const _$ProductOrderImpl(
      {@JsonKey(name: "product_id") required this.productId,
      required this.name,
      required this.price,
      required this.quantity,
      required this.subtotal});

  factory _$ProductOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductOrderImplFromJson(json);

  @override
  @JsonKey(name: "product_id")
  final int productId;
  @override
  final String name;
  @override
  final String price;
  @override
  final int quantity;
  @override
  final double subtotal;

  @override
  String toString() {
    return 'ProductOrder(productId: $productId, name: $name, price: $price, quantity: $quantity, subtotal: $subtotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductOrderImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, name, price, quantity, subtotal);

  /// Create a copy of ProductOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductOrderImplCopyWith<_$ProductOrderImpl> get copyWith =>
      __$$ProductOrderImplCopyWithImpl<_$ProductOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductOrderImplToJson(
      this,
    );
  }
}

abstract class _ProductOrder implements ProductOrder {
  const factory _ProductOrder(
      {@JsonKey(name: "product_id") required final int productId,
      required final String name,
      required final String price,
      required final int quantity,
      required final double subtotal}) = _$ProductOrderImpl;

  factory _ProductOrder.fromJson(Map<String, dynamic> json) =
      _$ProductOrderImpl.fromJson;

  @override
  @JsonKey(name: "product_id")
  int get productId;
  @override
  String get name;
  @override
  String get price;
  @override
  int get quantity;
  @override
  double get subtotal;

  /// Create a copy of ProductOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductOrderImplCopyWith<_$ProductOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
