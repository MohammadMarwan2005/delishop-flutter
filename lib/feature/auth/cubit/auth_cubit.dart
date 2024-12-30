import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/data/repo/ga_repo.dart';
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
  final AuthRepo _authRepo;
  final UserDataRepo _userDataRepo;
  final GARepo _gaRepo;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  AuthCubit({required AuthRepo authRepo, required UserDataRepo userDataRepo, required GARepo gaRepo}) : _authRepo = authRepo, _userDataRepo = userDataRepo, _gaRepo = gaRepo, super(const AuthState.initial());

  Future<void> login() async {
    emit(const AuthState.loading());
    LoginRequestModel requestBody = LoginRequestModel(
        phoneNumber: phoneNumberController.text,
        password: passwordController.text);
    final ResponseResult<AuthResponseModel> result =
        await _authRepo.login(requestBody);
    result.when(
      onSuccess: (authResponseModel) async {
        await saveUserData(authResponseModel, requestBody.phoneNumber);
        _gaRepo.logLogin(authResponseModel.data.firstName, authResponseModel.data.lastName, requestBody.phoneNumber);
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
        await _authRepo.register(requestBody);
    result.when(
      onSuccess: (authResponseModel) async {
        await saveUserData(authResponseModel, requestBody.phoneNumber);
        _gaRepo.logSignup(authResponseModel.data.firstName, authResponseModel.data.lastName, requestBody.phoneNumber);
        emit(AuthState.success(authResponseModel));
      },
      onError: (domainErrorModel) {
        emit(AuthState.error(domainErrorModel));
      },
    );
  }

  saveUserData(AuthResponseModel authResponseModel, String phoneNumber) async {
    await _userDataRepo.setString(authResponseModel.data.firstName, DataAccessKeys.firstNameKey);
    await _userDataRepo.setString(authResponseModel.data.lastName, DataAccessKeys.lastNameKey);
    await _userDataRepo.setString(phoneNumber, DataAccessKeys.phoneNumberKey);
    await _userDataRepo.setToken(authResponseModel.data.token);
  }
}
