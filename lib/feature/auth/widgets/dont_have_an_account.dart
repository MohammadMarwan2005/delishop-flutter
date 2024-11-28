// import 'package:docdoc/core/di/dependency_injection.dart';
// import 'package:docdoc/core/helpers/util.dart';
// import 'package:docdoc/core/widgets/delishop_text_button.dart';
// import 'package:docdoc/feature/login/validation_cubit/validation_cubit.dart';
// import 'package:docdoc/feature/register/cubit/register_cubit.dart';
// import 'package:docdoc/feature/register/register_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class DontHaveAnAccount extends StatelessWidget {
//   const DontHaveAnAccount({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text("Don't have an account?"),
//         DocdocTextButton(
//             onClick: () {
//               context.read<ValidationCubit>().close();
//               context.pushReplacement(
//                 MultiBlocProvider(
//                   providers: [
//                     BlocProvider<RegisterCubit>(
//                         create: (context) => RegisterCubit(getIt())),
//                     BlocProvider<ValidationCubit>(
//                         create: (context) => ValidationCubit()),
//                   ],
//                   child: const RegisterScreen(),
//                 ),
//               );
//             },
//             label: "Sign up")
//       ],
//     );
//   }
// }
