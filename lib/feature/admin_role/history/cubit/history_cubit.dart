import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/repo/wallet_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/model/domain_error_model.dart';
import '../../../../core/data/model/transaction/transaction.dart';

part 'history_state.dart';

part 'history_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final WalletRepo _walletRepo;

  HistoryCubit(this._walletRepo) : super(const HistoryState.initial()) {
    Future.wait([fetchTransactions()]);
  }

  Future<void> fetchTransactions() async {
    emit(const HistoryState.loading());
    final response = await _walletRepo.getTransactions();
    response.when(
      onSuccess: (successData) {
        emit(HistoryState.success(successData.data.reversed.toList()));
      },
      onError: (domainErrorModel) {
        emit(HistoryState.error(domainErrorModel));
      },
    );
  }
}
