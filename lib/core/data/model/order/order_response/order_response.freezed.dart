// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return _OrderResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderResponse {
  @JsonKey(name: "order_id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  int get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: "location_id")
  int get locationId => throw _privateConstructorUsedError;
  @JsonKey(name: "total_amount")
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "order_date")
  String get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  List<ProductOrder> get productOrder => throw _privateConstructorUsedError;

  /// Serializes this OrderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderResponseCopyWith<OrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderResponseCopyWith<$Res> {
  factory $OrderResponseCopyWith(
          OrderResponse value, $Res Function(OrderResponse) then) =
      _$OrderResponseCopyWithImpl<$Res, OrderResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "order_id") int id,
      @JsonKey(name: "store_id") int storeId,
      @JsonKey(name: "location_id") int locationId,
      @JsonKey(name: "total_amount") double totalAmount,
      @JsonKey(name: "order_date") String orderDate,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "content") List<ProductOrder> productOrder});
}

/// @nodoc
class _$OrderResponseCopyWithImpl<$Res, $Val extends OrderResponse>
    implements $OrderResponseCopyWith<$Res> {
  _$OrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storeId = null,
    Object? locationId = null,
    Object? totalAmount = null,
    Object? orderDate = null,
    Object? status = null,
    Object? description = freezed,
    Object? productOrder = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      productOrder: null == productOrder
          ? _value.productOrder
          : productOrder // ignore: cast_nullable_to_non_nullable
              as List<ProductOrder>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderResponseImplCopyWith<$Res>
    implements $OrderResponseCopyWith<$Res> {
  factory _$$OrderResponseImplCopyWith(
          _$OrderResponseImpl value, $Res Function(_$OrderResponseImpl) then) =
      __$$OrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "order_id") int id,
      @JsonKey(name: "store_id") int storeId,
      @JsonKey(name: "location_id") int locationId,
      @JsonKey(name: "total_amount") double totalAmount,
      @JsonKey(name: "order_date") String orderDate,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "content") List<ProductOrder> productOrder});
}

/// @nodoc
class __$$OrderResponseImplCopyWithImpl<$Res>
    extends _$OrderResponseCopyWithImpl<$Res, _$OrderResponseImpl>
    implements _$$OrderResponseImplCopyWith<$Res> {
  __$$OrderResponseImplCopyWithImpl(
      _$OrderResponseImpl _value, $Res Function(_$OrderResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storeId = null,
    Object? locationId = null,
    Object? totalAmount = null,
    Object? orderDate = null,
    Object? status = null,
    Object? description = freezed,
    Object? productOrder = null,
  }) {
    return _then(_$OrderResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      productOrder: null == productOrder
          ? _value._productOrder
          : productOrder // ignore: cast_nullable_to_non_nullable
              as List<ProductOrder>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderResponseImpl implements _OrderResponse {
  const _$OrderResponseImpl(
      {@JsonKey(name: "order_id") required this.id,
      @JsonKey(name: "store_id") required this.storeId,
      @JsonKey(name: "location_id") required this.locationId,
      @JsonKey(name: "total_amount") required this.totalAmount,
      @JsonKey(name: "order_date") required this.orderDate,
      @JsonKey(name: "status") required this.status,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "content") required final List<ProductOrder> productOrder})
      : _productOrder = productOrder;

  factory _$OrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderResponseImplFromJson(json);

  @override
  @JsonKey(name: "order_id")
  final int id;
  @override
  @JsonKey(name: "store_id")
  final int storeId;
  @override
  @JsonKey(name: "location_id")
  final int locationId;
  @override
  @JsonKey(name: "total_amount")
  final double totalAmount;
  @override
  @JsonKey(name: "order_date")
  final String orderDate;
  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "description")
  final String? description;
  final List<ProductOrder> _productOrder;
  @override
  @JsonKey(name: "content")
  List<ProductOrder> get productOrder {
    if (_productOrder is EqualUnmodifiableListView) return _productOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productOrder);
  }

  @override
  String toString() {
    return 'OrderResponse(id: $id, storeId: $storeId, locationId: $locationId, totalAmount: $totalAmount, orderDate: $orderDate, status: $status, description: $description, productOrder: $productOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._productOrder, _productOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      storeId,
      locationId,
      totalAmount,
      orderDate,
      status,
      description,
      const DeepCollectionEquality().hash(_productOrder));

  /// Create a copy of OrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderResponseImplCopyWith<_$OrderResponseImpl> get copyWith =>
      __$$OrderResponseImplCopyWithImpl<_$OrderResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderResponseImplToJson(
      this,
    );
  }
}

abstract class _OrderResponse implements OrderResponse {
  const factory _OrderResponse(
      {@JsonKey(name: "order_id") required final int id,
      @JsonKey(name: "store_id") required final int storeId,
      @JsonKey(name: "location_id") required final int locationId,
      @JsonKey(name: "total_amount") required final double totalAmount,
      @JsonKey(name: "order_date") required final String orderDate,
      @JsonKey(name: "status") required final String status,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "content")
      required final List<ProductOrder> productOrder}) = _$OrderResponseImpl;

  factory _OrderResponse.fromJson(Map<String, dynamic> json) =
      _$OrderResponseImpl.fromJson;

  @override
  @JsonKey(name: "order_id")
  int get id;
  @override
  @JsonKey(name: "store_id")
  int get storeId;
  @override
  @JsonKey(name: "location_id")
  int get locationId;
  @override
  @JsonKey(name: "total_amount")
  double get totalAmount;
  @override
  @JsonKey(name: "order_date")
  String get orderDate;
  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "content")
  List<ProductOrder> get productOrder;

  /// Create a copy of OrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderResponseImplCopyWith<_$OrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
