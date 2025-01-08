import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:delishop/core/data/model/location/location.dart';
part 'location_list_response_model.freezed.dart';
part 'location_list_response_model.g.dart';

@freezed
class LocationListResponseModel with _$LocationListResponseModel {
  const factory LocationListResponseModel({
    required List<Location> data,
  }) = _LocationListResponseModel;

  factory LocationListResponseModel.fromJson(Map<String, Object?> json)
  => _$LocationListResponseModelFromJson(json);
}