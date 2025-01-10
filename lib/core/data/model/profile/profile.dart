import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required int id,
  @JsonKey(name: "first_name") required String firstName,
  @JsonKey(name: "last_name") required String lastName,
  @JsonKey(name: "phone_number") required String phoneNumber,
  @JsonKey(name: "profile_picture") required String? imageUrl,
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json)
  => _$ProfileFromJson(json);
}

extension UpdateProfileRequestJson on Profile {
  Map<String, String> toJsonWithoutPictureField() {
    final Map<String, dynamic> currentMap = toJson();
    currentMap.remove('profile_picture');
    return currentMap.map((key, value) => MapEntry(key, value.toString()));
  }
}