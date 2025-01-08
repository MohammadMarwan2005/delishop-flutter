import 'package:freezed_annotation/freezed_annotation.dart';
part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    int? id,
    @JsonKey(name: "location_name") required String name,
    @JsonKey(name: "location_url") required String url
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json)
  => _$LocationFromJson(json);
}