import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/data/model/user/user.dart';
import 'package:delishop/feature/auth/cubit/auth_cubit.dart';
import 'package:delishop/feature/auth/model/auth_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/repo/auth_repo.dart';

part 'add_store_state.dart';

part 'add_store_cubit.freezed.dart';

class AddStoreCubit extends Cubit<AddStoreState> implements RegisterAble {
  final AuthRepo _authRepo;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  AddStoreCubit(this._authRepo) : super(const AddStoreState.initial());

  Future<void> createStore({int roleId = 3}) async {
    emit(const AddStoreState.loading());
    final request = User(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
        roleId: roleId);

    final response = await _authRepo.createUser(request);
    response.when(
      onSuccess: (successData) {
        emit(AddStoreState.success(successData));
      },
      onError: (domainErrorModel) {
        emit(AddStoreState.error(domainErrorModel));
      },
    );
  }

  @override
  TextEditingController getFirstNameController() => firstNameController;

  @override
  TextEditingController getLastNameController() => lastNameController;

  @override
  TextEditingController getPasswordController() => passwordController;

  @override
  TextEditingController getPasswordConfirmationController() => passwordConfirmationController;

  @override
  TextEditingController getPhoneNumberController() => phoneNumberController;
}
