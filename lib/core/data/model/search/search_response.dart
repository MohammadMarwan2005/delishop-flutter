import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/model/store/store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
class SearchResponse with _$SearchResponse {
  const factory SearchResponse({
    required List<Store> stores,
    required List<Product> products,
  }) = _SearchResponse;

  factory SearchResponse.fromJson(Map<String, Object?> json)
  => _$SearchResponseFromJson(json);
}