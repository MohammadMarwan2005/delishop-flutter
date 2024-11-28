import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_request_model.freezed.dart';
part 'register_request_model.g.dart';

@freezed
class RegisterRequestModel with _$RegisterRequestModel {
  const factory RegisterRequestModel({
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "phone_number") required String phoneNumber,
    required String password,
    @JsonKey(name: "password_confirmation") required String passwordConfirmation,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, Object?> json)
  => _$RegisterRequestModelFromJson(json);
}