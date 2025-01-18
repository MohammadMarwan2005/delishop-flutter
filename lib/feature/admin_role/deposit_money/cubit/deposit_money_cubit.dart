import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/wallet/deposit_money_request.dart';
import 'package:delishop/core/data/model/wallet/wallet_balance_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/model/domain_error_model.dart';
import '../../../../core/data/repo/wallet_repo.dart';

part 'deposit_money_state.dart';

part 'deposit_money_cubit.freezed.dart';

class DepositMoneyCubit extends Cubit<DepositMoneyState> {
  final WalletRepo _walletRepo;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  DepositMoneyCubit(this._walletRepo)
      : super(const DepositMoneyState.initial());

  Future<void> depositMoney() async {
    emit(const DepositMoneyState.loading());
    final amount = double.tryParse(amountController.text);
    final request = DepositMoneyRequest(
        phoneNumber: phoneNumberController.text, amount: amount);
    final response = await _walletRepo.depositMoney(request);
    response.when(
      onSuccess: (successData) {
        emit(DepositMoneyState.success(successData));
      },
      onError: (domainErrorModel) {
        emit(DepositMoneyState.error(domainErrorModel));
      },
    );
  }
}
