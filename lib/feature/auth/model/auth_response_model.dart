import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_model.freezed.dart';

part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required String message,
    required SuccessAuthData data,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, Object?> json) =>
      _$AuthResponseModelFromJson(json);
}

@freezed
class SuccessAuthData with _$SuccessAuthData {
  const factory SuccessAuthData({
    required String token,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
  }) = _SuccessAuthData;

  factory SuccessAuthData.fromJson(Map<String, Object?> json) =>
      _$SuccessAuthDataFromJson(json);
}
