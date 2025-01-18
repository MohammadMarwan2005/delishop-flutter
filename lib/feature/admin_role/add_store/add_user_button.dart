import 'package:delishop/core/helpers/alert_dialog_helper.dart';
import 'package:delishop/feature/admin_role/add_store/cubit/add_store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/delishop_button.dart';
import '../../../core/widgets/my_alert_dialog.dart';

class AddUserButton extends StatelessWidget {
  final String label;
  final Function() onClick;

  const AddUserButton({super.key, required this.label, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddStoreCubit, AddStoreState>(
      builder: (context, state) {
        var isLoading = state.when(initial: () {
          return false;
        }, success: (successData) {
          return false;
        }, error: (error) {
          return false;
        }, loading: () {
          return true;
        });
        return DelishopButton(
          isLoading: isLoading,
          onPressed: onClick,
          text: label,
        );
      },
      listener: (BuildContext context, AddStoreState state) {
        state.when(
          initial: () {},
          loading: () {},
          success: (successData) {
            showDialog(
              context: context,
              builder: (context) {
                return MyAlertDialog(
                    title: "Mall Created Successfully",
                    details: [successData.message],
                    isError: false);
              },
            );
          },
          error: (domainErrorModel) {
            context.setupErrorState(domainErrorModel);
          },
        );
      },
    );
  }
}
