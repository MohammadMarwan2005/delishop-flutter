import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/data/model/domain_error_model.dart';

part 'account_state.dart';

part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  final UserDataRepo userDataRepo;

  AccountCubit({required this.userDataRepo}) : super(const AccountState.initial()) {
    getAccountData();
  }

  Future<void> getAccountData() async {
    emit(const AccountState.loading());
    try {
      String token = await userDataRepo.getToken();
      String firstName = await userDataRepo.getString(DataAccessKeys.firstNameKey);
      String lastName = await userDataRepo.getString(DataAccessKeys.lastNameKey);
      emit(AccountState.success(firstName, lastName, token));
    } catch (e) {
      emit(AccountState.error(
          DomainErrorModel(message: e.toString(), code: 400, details: const [])));
    }
  }

}
