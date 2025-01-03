import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/db_service.dart';
import 'package:delishop/core/data/repo/ga_repo.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/data/model/domain_error_model.dart';

part 'account_state.dart';

part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  final UserDataRepo _userDataRepo;
  final GARepo _gaRepo;
  DBService _dbService;

  AccountCubit(
      {required UserDataRepo userDataRepo,
      required GARepo gaRepo,
      required DBService dbService})
      : _gaRepo = gaRepo,
        _userDataRepo = userDataRepo,
        _dbService = dbService,
        super(const AccountState.initial()) {
    getAccountData();
  }

  Future<void> getAccountData() async {
    emit(const AccountState.loading());
    try {
      String token = await _userDataRepo.getToken();
      String firstName =
          await _userDataRepo.getString(DataAccessKeys.firstNameKey) ?? "";
      String lastName =
          await _userDataRepo.getString(DataAccessKeys.lastNameKey) ?? "";
      emit(AccountState.success(firstName, lastName, token));
    } catch (e) {
      emit(AccountState.error(DomainErrorModel(
          message: e.toString(), code: 400, details: const [])));
    }
  }

  Future<void> logout() async {
    _gaRepo.logLogout(
        _userDataRepo.getString(DataAccessKeys.phoneNumberKey) ?? "");
    await _userDataRepo.clearAllData();
    await _userDataRepo.deleteToken();
    await _dbService.clearAllData();
  }
}
