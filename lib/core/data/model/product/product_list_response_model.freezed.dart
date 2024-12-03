// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductListResponseModel _$ProductListResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ProductListResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ProductListResponseModel {
  List<Product> get data => throw _privateConstructorUsedError;

  /// Serializes this ProductListResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductListResponseModelCopyWith<ProductListResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListResponseModelCopyWith<$Res> {
  factory $ProductListResponseModelCopyWith(ProductListResponseModel value,
          $Res Function(ProductListResponseModel) then) =
      _$ProductListResponseModelCopyWithImpl<$Res, ProductListResponseModel>;
  @useResult
  $Res call({List<Product> data});
}

/// @nodoc
class _$ProductListResponseModelCopyWithImpl<$Res,
        $Val extends ProductListResponseModel>
    implements $ProductListResponseModelCopyWith<$Res> {
  _$ProductListResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductListResponseModel
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
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductListResponseModelImplCopyWith<$Res>
    implements $ProductListResponseModelCopyWith<$Res> {
  factory _$$ProductListResponseModelImplCopyWith(
          _$ProductListResponseModelImpl value,
          $Res Function(_$ProductListResponseModelImpl) then) =
      __$$ProductListResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Product> data});
}

/// @nodoc
class __$$ProductListResponseModelImplCopyWithImpl<$Res>
    extends _$ProductListResponseModelCopyWithImpl<$Res,
        _$ProductListResponseModelImpl>
    implements _$$ProductListResponseModelImplCopyWith<$Res> {
  __$$ProductListResponseModelImplCopyWithImpl(
      _$ProductListResponseModelImpl _value,
      $Res Function(_$ProductListResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ProductListResponseModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductListResponseModelImpl implements _ProductListResponseModel {
  const _$ProductListResponseModelImpl({required final List<Product> data})
      : _data = data;

  factory _$ProductListResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductListResponseModelImplFromJson(json);

  final List<Product> _data;
  @override
  List<Product> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ProductListResponseModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListResponseModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ProductListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListResponseModelImplCopyWith<_$ProductListResponseModelImpl>
      get copyWith => __$$ProductListResponseModelImplCopyWithImpl<
          _$ProductListResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductListResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ProductListResponseModel implements ProductListResponseModel {
  const factory _ProductListResponseModel({required final List<Product> data}) =
      _$ProductListResponseModelImpl;

  factory _ProductListResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProductListResponseModelImpl.fromJson;

  @override
  List<Product> get data;

  /// Create a copy of ProductListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductListResponseModelImplCopyWith<_$ProductListResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
