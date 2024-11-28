import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/domain_error_model.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/core/data/response_result.dart';
import 'package:delishop/feature/auth/model/auth_response_model.dart';
import 'package:delishop/feature/auth/model/login_request_model.dart';
import 'package:delishop/feature/auth/model/register_request_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/data/repo/auth_repo.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // final loginFormKey = GlobalKey<FormState>();
  // final registerFormKey = GlobalKey<FormState>();
  final AuthRepo authRepo;
  final UserDataRepo userDataRepo;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  AuthCubit({required this.authRepo, required this.userDataRepo}) : super(const AuthState.initial());

  Future<void> login() async {
    emit(const AuthState.loading());
    LoginRequestModel requestBody = LoginRequestModel(
        phoneNumber: phoneNumberController.text,
        password: passwordController.text);
    final ResponseResult<AuthResponseModel> result =
        await authRepo.login(requestBody);
    result.when(
      onSuccess: (authResponseModel) {
        saveUserData(authResponseModel);
        emit(AuthState.success(authResponseModel));
      },
      onError: (domainErrorModel) {
        emit(AuthState.error(domainErrorModel));
      },
    );
  }

  Future<void> register() async {
    emit(const AuthState.loading());
    RegisterRequestModel requestBody = RegisterRequestModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text);
    final ResponseResult<AuthResponseModel> result =
        await authRepo.register(requestBody);
    result.when(
      onSuccess: (authResponseModel) {
        saveUserData(authResponseModel);
        emit(AuthState.success(authResponseModel));
      },
      onError: (domainErrorModel) {
        emit(AuthState.error(domainErrorModel));
      },
    );
  }

  saveUserData(AuthResponseModel authResponseModel) async {
    await userDataRepo.setString(authResponseModel.data.firstName, DataAccessKeys.firstNameKey);
    await userDataRepo.setString(authResponseModel.data.lastName, DataAccessKeys.lastNameKey);
    await userDataRepo.setToken(authResponseModel.data.token);
  }
}
