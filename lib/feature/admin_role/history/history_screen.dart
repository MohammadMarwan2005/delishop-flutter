import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/feature/admin_role/history/cubit/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/model/transaction/transaction.dart';
import '../../../core/widgets/error_message.dart';
import '../../../core/widgets/loading.dart';
import '../../../core/widgets/no_result_message.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History".tr(context))),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Loading(),
              loading: () => const Loading(),
              success: (transactions) {
                if (transactions.isEmpty) {
                  return NoResultMessage(
                    messageLabel: "No transactions found!".tr(context),
                    buttonLabel: "Try Again".tr(context),
                    onButtonClicked: () {
                      context.read<HistoryCubit>().fetchTransactions();
                    },
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<HistoryCubit>().fetchTransactions();
                  },
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) =>
                        TransactionItem(transaction: transactions[index]),
                  ),
                );
              },
              error: (domainErrorModel) {
                return ErrorMessage(
                  message: domainErrorModel.getMessage(context),
                  onTryAgain: () {
                    context.read<HistoryCubit>().fetchTransactions();
                  },
                );
              },
            );
          },
        ),
      )),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  transaction.phoneNumber,
                  style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(
                transaction.date,
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                "\$${transaction.amount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const Divider(),
          ],
        ));
  }
}
