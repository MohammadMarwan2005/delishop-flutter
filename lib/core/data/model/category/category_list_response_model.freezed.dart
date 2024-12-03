// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryListResponseModel _$CategoryListResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CategoryListResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryListResponseModel {
  List<Category> get data => throw _privateConstructorUsedError;

  /// Serializes this CategoryListResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryListResponseModelCopyWith<CategoryListResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListResponseModelCopyWith<$Res> {
  factory $CategoryListResponseModelCopyWith(CategoryListResponseModel value,
          $Res Function(CategoryListResponseModel) then) =
      _$CategoryListResponseModelCopyWithImpl<$Res, CategoryListResponseModel>;
  @useResult
  $Res call({List<Category> data});
}

/// @nodoc
class _$CategoryListResponseModelCopyWithImpl<$Res,
        $Val extends CategoryListResponseModel>
    implements $CategoryListResponseModelCopyWith<$Res> {
  _$CategoryListResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryListResponseModel
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
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryListResponseModelImplCopyWith<$Res>
    implements $CategoryListResponseModelCopyWith<$Res> {
  factory _$$CategoryListResponseModelImplCopyWith(
          _$CategoryListResponseModelImpl value,
          $Res Function(_$CategoryListResponseModelImpl) then) =
      __$$CategoryListResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Category> data});
}

/// @nodoc
class __$$CategoryListResponseModelImplCopyWithImpl<$Res>
    extends _$CategoryListResponseModelCopyWithImpl<$Res,
        _$CategoryListResponseModelImpl>
    implements _$$CategoryListResponseModelImplCopyWith<$Res> {
  __$$CategoryListResponseModelImplCopyWithImpl(
      _$CategoryListResponseModelImpl _value,
      $Res Function(_$CategoryListResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CategoryListResponseModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryListResponseModelImpl implements _CategoryListResponseModel {
  const _$CategoryListResponseModelImpl({required final List<Category> data})
      : _data = data;

  factory _$CategoryListResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryListResponseModelImplFromJson(json);

  final List<Category> _data;
  @override
  List<Category> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CategoryListResponseModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryListResponseModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CategoryListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryListResponseModelImplCopyWith<_$CategoryListResponseModelImpl>
      get copyWith => __$$CategoryListResponseModelImplCopyWithImpl<
          _$CategoryListResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryListResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryListResponseModel implements CategoryListResponseModel {
  const factory _CategoryListResponseModel(
      {required final List<Category> data}) = _$CategoryListResponseModelImpl;

  factory _CategoryListResponseModel.fromJson(Map<String, dynamic> json) =
      _$CategoryListResponseModelImpl.fromJson;

  @override
  List<Category> get data;

  /// Create a copy of CategoryListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryListResponseModelImplCopyWith<_$CategoryListResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
