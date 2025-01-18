import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/data/api_service.dart';
import 'package:delishop/core/data/model/wallet/deposit_money_request.dart';
import 'package:delishop/core/data/model/wallet/wallet_balance_response.dart';
import 'package:delishop/core/helpers/internet_check_helper.dart';

import '../model/store/store_list_response_model.dart';
import '../model/transaction/transaction_list_response.dart';
import '../response_result.dart';

class WalletRepo {
  final ApiService _apiService;
  final Connectivity _connectivity;

  WalletRepo(this._apiService, this._connectivity);

  Future<ResponseResult<WalletBalanceResponse>> getMyBalance() async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getMyBalance();
      },
    );
  }
  Future<ResponseResult<WalletBalanceResponse>> depositMoney(DepositMoneyRequest request) async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.depositMoney(request);
      },
    );
  }
  Future<ResponseResult<TransactionListResponse>> getTransactions() async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getTransactions();
      },
    );
  }
}