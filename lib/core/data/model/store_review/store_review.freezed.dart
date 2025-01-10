// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreReview _$StoreReviewFromJson(Map<String, dynamic> json) {
  return _StoreReview.fromJson(json);
}

/// @nodoc
mixin _$StoreReview {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  int get productId => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  /// Serializes this StoreReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreReviewCopyWith<StoreReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreReviewCopyWith<$Res> {
  factory $StoreReviewCopyWith(
          StoreReview value, $Res Function(StoreReview) then) =
      _$StoreReviewCopyWithImpl<$Res, StoreReview>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "store_id") int productId,
      double rating,
      String comment});
}

/// @nodoc
class _$StoreReviewCopyWithImpl<$Res, $Val extends StoreReview>
    implements $StoreReviewCopyWith<$Res> {
  _$StoreReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? rating = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreReviewImplCopyWith<$Res>
    implements $StoreReviewCopyWith<$Res> {
  factory _$$StoreReviewImplCopyWith(
          _$StoreReviewImpl value, $Res Function(_$StoreReviewImpl) then) =
      __$$StoreReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "store_id") int productId,
      double rating,
      String comment});
}

/// @nodoc
class __$$StoreReviewImplCopyWithImpl<$Res>
    extends _$StoreReviewCopyWithImpl<$Res, _$StoreReviewImpl>
    implements _$$StoreReviewImplCopyWith<$Res> {
  __$$StoreReviewImplCopyWithImpl(
      _$StoreReviewImpl _value, $Res Function(_$StoreReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? rating = null,
    Object? comment = null,
  }) {
    return _then(_$StoreReviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreReviewImpl implements _StoreReview {
  const _$StoreReviewImpl(
      {required this.id,
      @JsonKey(name: "store_id") required this.productId,
      required this.rating,
      required this.comment});

  factory _$StoreReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreReviewImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "store_id")
  final int productId;
  @override
  final double rating;
  @override
  final String comment;

  @override
  String toString() {
    return 'StoreReview(id: $id, productId: $productId, rating: $rating, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, rating, comment);

  /// Create a copy of StoreReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreReviewImplCopyWith<_$StoreReviewImpl> get copyWith =>
      __$$StoreReviewImplCopyWithImpl<_$StoreReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreReviewImplToJson(
      this,
    );
  }
}

abstract class _StoreReview implements StoreReview {
  const factory _StoreReview(
      {required final int id,
      @JsonKey(name: "store_id") required final int productId,
      required final double rating,
      required final String comment}) = _$StoreReviewImpl;

  factory _StoreReview.fromJson(Map<String, dynamic> json) =
      _$StoreReviewImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "store_id")
  int get productId;
  @override
  double get rating;
  @override
  String get comment;

  /// Create a copy of StoreReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreReviewImplCopyWith<_$StoreReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
