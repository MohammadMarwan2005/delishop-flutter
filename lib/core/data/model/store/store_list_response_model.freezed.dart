// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreListResponseModel _$StoreListResponseModelFromJson(
    Map<String, dynamic> json) {
  return _StoreListResponseModel.fromJson(json);
}

/// @nodoc
mixin _$StoreListResponseModel {
  List<Store> get data => throw _privateConstructorUsedError;

  /// Serializes this StoreListResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreListResponseModelCopyWith<StoreListResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreListResponseModelCopyWith<$Res> {
  factory $StoreListResponseModelCopyWith(StoreListResponseModel value,
          $Res Function(StoreListResponseModel) then) =
      _$StoreListResponseModelCopyWithImpl<$Res, StoreListResponseModel>;
  @useResult
  $Res call({List<Store> data});
}

/// @nodoc
class _$StoreListResponseModelCopyWithImpl<$Res,
        $Val extends StoreListResponseModel>
    implements $StoreListResponseModelCopyWith<$Res> {
  _$StoreListResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreListResponseModel
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
              as List<Store>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreListResponseModelImplCopyWith<$Res>
    implements $StoreListResponseModelCopyWith<$Res> {
  factory _$$StoreListResponseModelImplCopyWith(
          _$StoreListResponseModelImpl value,
          $Res Function(_$StoreListResponseModelImpl) then) =
      __$$StoreListResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Store> data});
}

/// @nodoc
class __$$StoreListResponseModelImplCopyWithImpl<$Res>
    extends _$StoreListResponseModelCopyWithImpl<$Res,
        _$StoreListResponseModelImpl>
    implements _$$StoreListResponseModelImplCopyWith<$Res> {
  __$$StoreListResponseModelImplCopyWithImpl(
      _$StoreListResponseModelImpl _value,
      $Res Function(_$StoreListResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$StoreListResponseModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Store>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreListResponseModelImpl implements _StoreListResponseModel {
  const _$StoreListResponseModelImpl({required final List<Store> data})
      : _data = data;

  factory _$StoreListResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreListResponseModelImplFromJson(json);

  final List<Store> _data;
  @override
  List<Store> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'StoreListResponseModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreListResponseModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of StoreListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreListResponseModelImplCopyWith<_$StoreListResponseModelImpl>
      get copyWith => __$$StoreListResponseModelImplCopyWithImpl<
          _$StoreListResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreListResponseModelImplToJson(
      this,
    );
  }
}

abstract class _StoreListResponseModel implements StoreListResponseModel {
  const factory _StoreListResponseModel({required final List<Store> data}) =
      _$StoreListResponseModelImpl;

  factory _StoreListResponseModel.fromJson(Map<String, dynamic> json) =
      _$StoreListResponseModelImpl.fromJson;

  @override
  List<Store> get data;

  /// Create a copy of StoreListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreListResponseModelImplCopyWith<_$StoreListResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
