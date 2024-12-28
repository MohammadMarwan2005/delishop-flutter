import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/data/model/domain_error_model.dart';

part 'account_state.dart';

part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  final UserDataRepo _userDataRepo;

  AccountCubit({required UserDataRepo userDataRepo}) : _userDataRepo = userDataRepo, super(const AccountState.initial()) {
    getAccountData();
  }

  Future<void> getAccountData() async {
    emit(const AccountState.loading());
    try {
      String token = await _userDataRepo.getToken();
      String firstName = await _userDataRepo.getString(DataAccessKeys.firstNameKey) ?? "";
      String lastName = await _userDataRepo.getString(DataAccessKeys.lastNameKey) ?? "";
      emit(AccountState.success(firstName, lastName, token));
    } catch (e) {
      emit(AccountState.error(
          DomainErrorModel(message: e.toString(), code: 400, details: const [])));
    }
  }

  Future<void> logout() async {
    await _userDataRepo.deleteToken();
  }

}
