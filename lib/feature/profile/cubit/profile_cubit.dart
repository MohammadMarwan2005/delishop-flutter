import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/profile/profile.dart';
import 'package:delishop/core/data/repo/profile_repo.dart';
import 'package:delishop/core/ui_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/data/db_service.dart';
import '../../../core/data/repo/ga_repo.dart';
import '../../../core/data/repo/user_data_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  final ImagePicker _imagePicker;
  final UserDataRepo _userDataRepo;
  final DBService _dbService;
  final GARepo _gaRepo;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  ProfileCubit(
    this._profileRepo,
    this._imagePicker,
    this._userDataRepo,
    this._gaRepo,
    this._dbService,
  ) : super(const ProfileState(UIState(isLoading: true))) {
    Future.wait([fetchProfile()]);
  }

  Future<void> pickImage() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    print('pickedImage != null: ${pickedImage != null}');
    if (pickedImage != null) {
      emit(state.copyWith(image: File(pickedImage.path)));
    }
  }

  Future<void> fetchProfile() async {
    emit(state.copyWith(profile: const UIState(isLoading: true)));
    final response = await _profileRepo.getProfile();
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(profile: UIState(data: successData)));
        firstNameController.text = successData.firstName;
        lastNameController.text = successData.lastName;
        phoneNumberController.text = successData.phoneNumber;
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(profile: UIState(error: domainErrorModel)));
      },
    );
  }

  Future<void> updateProfile() async {
    emit(state.copyWith(profile: const UIState(isLoading: true)));
    final response = await _profileRepo.updateProfile(
      Profile(
        id: 0,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        imageUrl: "not important",
      ),
      state.image,
    );
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(profile: UIState(data: successData)));
        removePicture();
        firstNameController.text = successData.firstName;
        lastNameController.text = successData.lastName;
        phoneNumberController.text = successData.phoneNumber;
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(profile: UIState(error: domainErrorModel)));
      },
    );
  }

  void removePicture() {
    emit(state.withoutImage());
  }

  Future<void> logout() async {
    _gaRepo.logLogout(
        _userDataRepo.getString(DataAccessKeys.phoneNumberKey) ?? "");
    await _userDataRepo.clearAllData();
    await _userDataRepo.deleteToken();
    await _dbService.clearAllData();
  }
}
