// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationListResponseModel _$LocationListResponseModelFromJson(
    Map<String, dynamic> json) {
  return _LocationListResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LocationListResponseModel {
  List<Location> get data => throw _privateConstructorUsedError;

  /// Serializes this LocationListResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationListResponseModelCopyWith<LocationListResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationListResponseModelCopyWith<$Res> {
  factory $LocationListResponseModelCopyWith(LocationListResponseModel value,
          $Res Function(LocationListResponseModel) then) =
      _$LocationListResponseModelCopyWithImpl<$Res, LocationListResponseModel>;
  @useResult
  $Res call({List<Location> data});
}

/// @nodoc
class _$LocationListResponseModelCopyWithImpl<$Res,
        $Val extends LocationListResponseModel>
    implements $LocationListResponseModelCopyWith<$Res> {
  _$LocationListResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationListResponseModel
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
              as List<Location>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationListResponseModelImplCopyWith<$Res>
    implements $LocationListResponseModelCopyWith<$Res> {
  factory _$$LocationListResponseModelImplCopyWith(
          _$LocationListResponseModelImpl value,
          $Res Function(_$LocationListResponseModelImpl) then) =
      __$$LocationListResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Location> data});
}

/// @nodoc
class __$$LocationListResponseModelImplCopyWithImpl<$Res>
    extends _$LocationListResponseModelCopyWithImpl<$Res,
        _$LocationListResponseModelImpl>
    implements _$$LocationListResponseModelImplCopyWith<$Res> {
  __$$LocationListResponseModelImplCopyWithImpl(
      _$LocationListResponseModelImpl _value,
      $Res Function(_$LocationListResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LocationListResponseModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Location>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationListResponseModelImpl implements _LocationListResponseModel {
  const _$LocationListResponseModelImpl({required final List<Location> data})
      : _data = data;

  factory _$LocationListResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationListResponseModelImplFromJson(json);

  final List<Location> _data;
  @override
  List<Location> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LocationListResponseModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationListResponseModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of LocationListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationListResponseModelImplCopyWith<_$LocationListResponseModelImpl>
      get copyWith => __$$LocationListResponseModelImplCopyWithImpl<
          _$LocationListResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationListResponseModelImplToJson(
      this,
    );
  }
}

abstract class _LocationListResponseModel implements LocationListResponseModel {
  const factory _LocationListResponseModel(
      {required final List<Location> data}) = _$LocationListResponseModelImpl;

  factory _LocationListResponseModel.fromJson(Map<String, dynamic> json) =
      _$LocationListResponseModelImpl.fromJson;

  @override
  List<Location> get data;

  /// Create a copy of LocationListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationListResponseModelImplCopyWith<_$LocationListResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
