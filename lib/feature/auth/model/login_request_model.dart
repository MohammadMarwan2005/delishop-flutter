import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezed
class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    @JsonKey(name: "phone_number") required String phoneNumber,
    required String password,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, Object?> json)
  => _$LoginRequestModelFromJson(json);
}