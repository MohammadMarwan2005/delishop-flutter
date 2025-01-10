part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final UIState<Profile> profile;
  final File? image;

  const ProfileState(this.profile, {this.image});

  @override
  List<Object?> get props => [profile, image];

  ProfileState copyWith({
    UIState<Profile>? profile,
    File? image,
  }) {
    return ProfileState(
      profile ?? this.profile,
      image: image ?? this.image,
    );
  }

  ProfileState withoutImage() {
    return ProfileState(
      profile,
      image: null,
    );
  }
}
