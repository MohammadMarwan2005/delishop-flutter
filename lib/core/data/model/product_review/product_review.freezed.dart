// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReview _$ProductReviewFromJson(Map<String, dynamic> json) {
  return _ProductReview.fromJson(json);
}

/// @nodoc
mixin _$ProductReview {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "product_id")
  int get productId => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  /// Serializes this ProductReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductReviewCopyWith<ProductReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReviewCopyWith<$Res> {
  factory $ProductReviewCopyWith(
          ProductReview value, $Res Function(ProductReview) then) =
      _$ProductReviewCopyWithImpl<$Res, ProductReview>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "product_id") int productId,
      double rating,
      String comment});
}

/// @nodoc
class _$ProductReviewCopyWithImpl<$Res, $Val extends ProductReview>
    implements $ProductReviewCopyWith<$Res> {
  _$ProductReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductReview
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
abstract class _$$ProductReviewImplCopyWith<$Res>
    implements $ProductReviewCopyWith<$Res> {
  factory _$$ProductReviewImplCopyWith(
          _$ProductReviewImpl value, $Res Function(_$ProductReviewImpl) then) =
      __$$ProductReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "product_id") int productId,
      double rating,
      String comment});
}

/// @nodoc
class __$$ProductReviewImplCopyWithImpl<$Res>
    extends _$ProductReviewCopyWithImpl<$Res, _$ProductReviewImpl>
    implements _$$ProductReviewImplCopyWith<$Res> {
  __$$ProductReviewImplCopyWithImpl(
      _$ProductReviewImpl _value, $Res Function(_$ProductReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? rating = null,
    Object? comment = null,
  }) {
    return _then(_$ProductReviewImpl(
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
class _$ProductReviewImpl implements _ProductReview {
  const _$ProductReviewImpl(
      {required this.id,
      @JsonKey(name: "product_id") required this.productId,
      required this.rating,
      required this.comment});

  factory _$ProductReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReviewImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "product_id")
  final int productId;
  @override
  final double rating;
  @override
  final String comment;

  @override
  String toString() {
    return 'ProductReview(id: $id, productId: $productId, rating: $rating, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, rating, comment);

  /// Create a copy of ProductReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReviewImplCopyWith<_$ProductReviewImpl> get copyWith =>
      __$$ProductReviewImplCopyWithImpl<_$ProductReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReviewImplToJson(
      this,
    );
  }
}

abstract class _ProductReview implements ProductReview {
  const factory _ProductReview(
      {required final int id,
      @JsonKey(name: "product_id") required final int productId,
      required final double rating,
      required final String comment}) = _$ProductReviewImpl;

  factory _ProductReview.fromJson(Map<String, dynamic> json) =
      _$ProductReviewImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "product_id")
  int get productId;
  @override
  double get rating;
  @override
  String get comment;

  /// Create a copy of ProductReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductReviewImplCopyWith<_$ProductReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
