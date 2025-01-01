import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../lang/lang_code_cubit.dart';

class ToggleLangButton extends StatelessWidget {
  const ToggleLangButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangCodeCubit, LangCodeState>(
      builder: (context, state) {
        if (state is LangCodeLoaded) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {
                    context.read<LangCodeCubit>().toggleLangCode(context);
                  },
                  child: Text(state.getLabel())),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
