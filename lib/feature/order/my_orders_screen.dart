import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/feature/order/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/loading.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderCubit>().fetchMyOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<OrderCubit>().fetchMyOrders();
    return Scaffold(
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          return state.myOrdersResponse.when(onLoading: () {
            return const Loading();
          }, onSuccess: (data) {
            return Text(data.toString());
          }, onError: (domainError) {
            return ErrorMessage(message: domainError.message, onTryAgain: () {
              context.read<OrderCubit>().fetchMyOrders();
            },);
          },);
        },
      ),
    );
  }
}
