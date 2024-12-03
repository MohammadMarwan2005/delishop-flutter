import 'package:delishop/core/data/model/store/store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'store_list_response_model.freezed.dart';
part 'store_list_response_model.g.dart';

@freezed
class StoreListResponseModel with _$StoreListResponseModel {
  const factory StoreListResponseModel({
    required List<Store> data
  }) = _StoreListResponseModel;

  factory StoreListResponseModel.fromJson(Map<String, Object?> json)
  => _$StoreListResponseModelFromJson(json);
}