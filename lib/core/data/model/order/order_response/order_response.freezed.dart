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
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "store")
  Store get store => throw _privateConstructorUsedError;
  @JsonKey(name: "location")
  Location get location => throw _privateConstructorUsedError;
  @JsonKey(name: "total_amount")
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "order_date")
  String get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  OrderStatus get status =>
      throw _privateConstructorUsedError; // the status should
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "products_order")
  List<ProductOrder> get productOrders => throw _privateConstructorUsedError;

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
      {int id,
      @JsonKey(name: "store") Store store,
      @JsonKey(name: "location") Location location,
      @JsonKey(name: "total_amount") double totalAmount,
      @JsonKey(name: "order_date") String orderDate,
      @JsonKey(name: "status") OrderStatus status,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "products_order") List<ProductOrder> productOrders});

  $StoreCopyWith<$Res> get store;
  $LocationCopyWith<$Res> get location;
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
    Object? store = null,
    Object? location = null,
    Object? totalAmount = null,
    Object? orderDate = null,
    Object? status = null,
    Object? description = freezed,
    Object? productOrders = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
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
              as OrderStatus,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      productOrders: null == productOrders
          ? _value.productOrders
          : productOrders // ignore: cast_nullable_to_non_nullable
              as List<ProductOrder>,
    ) as $Val);
  }

  /// Create a copy of OrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoreCopyWith<$Res> get store {
    return $StoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }

  /// Create a copy of OrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
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
      {int id,
      @JsonKey(name: "store") Store store,
      @JsonKey(name: "location") Location location,
      @JsonKey(name: "total_amount") double totalAmount,
      @JsonKey(name: "order_date") String orderDate,
      @JsonKey(name: "status") OrderStatus status,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "products_order") List<ProductOrder> productOrders});

  @override
  $StoreCopyWith<$Res> get store;
  @override
  $LocationCopyWith<$Res> get location;
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
    Object? store = null,
    Object? location = null,
    Object? totalAmount = null,
    Object? orderDate = null,
    Object? status = null,
    Object? description = freezed,
    Object? productOrders = null,
  }) {
    return _then(_$OrderResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
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
              as OrderStatus,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      productOrders: null == productOrders
          ? _value._productOrders
          : productOrders // ignore: cast_nullable_to_non_nullable
              as List<ProductOrder>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderResponseImpl implements _OrderResponse {
  const _$OrderResponseImpl(
      {required this.id,
      @JsonKey(name: "store") required this.store,
      @JsonKey(name: "location") required this.location,
      @JsonKey(name: "total_amount") required this.totalAmount,
      @JsonKey(name: "order_date") required this.orderDate,
      @JsonKey(name: "status") required this.status,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "products_order")
      required final List<ProductOrder> productOrders})
      : _productOrders = productOrders;

  factory _$OrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderResponseImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "store")
  final Store store;
  @override
  @JsonKey(name: "location")
  final Location location;
  @override
  @JsonKey(name: "total_amount")
  final double totalAmount;
  @override
  @JsonKey(name: "order_date")
  final String orderDate;
  @override
  @JsonKey(name: "status")
  final OrderStatus status;
// the status should
  @override
  @JsonKey(name: "description")
  final String? description;
  final List<ProductOrder> _productOrders;
  @override
  @JsonKey(name: "products_order")
  List<ProductOrder> get productOrders {
    if (_productOrders is EqualUnmodifiableListView) return _productOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productOrders);
  }

  @override
  String toString() {
    return 'OrderResponse(id: $id, store: $store, location: $location, totalAmount: $totalAmount, orderDate: $orderDate, status: $status, description: $description, productOrders: $productOrders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._productOrders, _productOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      store,
      location,
      totalAmount,
      orderDate,
      status,
      description,
      const DeepCollectionEquality().hash(_productOrders));

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
      {required final int id,
      @JsonKey(name: "store") required final Store store,
      @JsonKey(name: "location") required final Location location,
      @JsonKey(name: "total_amount") required final double totalAmount,
      @JsonKey(name: "order_date") required final String orderDate,
      @JsonKey(name: "status") required final OrderStatus status,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "products_order")
      required final List<ProductOrder> productOrders}) = _$OrderResponseImpl;

  factory _OrderResponse.fromJson(Map<String, dynamic> json) =
      _$OrderResponseImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "store")
  Store get store;
  @override
  @JsonKey(name: "location")
  Location get location;
  @override
  @JsonKey(name: "total_amount")
  double get totalAmount;
  @override
  @JsonKey(name: "order_date")
  String get orderDate;
  @override
  @JsonKey(name: "status")
  OrderStatus get status; // the status should
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "products_order")
  List<ProductOrder> get productOrders;

  /// Create a copy of OrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderResponseImplCopyWith<_$OrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
