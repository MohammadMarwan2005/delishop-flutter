import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/delishop_button.dart';
import '../cubit/auth_cubit.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final Function() onClick;

  const AuthButton({super.key, required this.label, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
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
    );
  }
}
