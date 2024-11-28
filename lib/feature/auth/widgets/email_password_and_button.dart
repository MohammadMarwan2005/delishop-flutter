// import 'package:docdoc/core/helpers/util.dart';
// import 'package:docdoc/feature/login/validation_cubit/validation_cubit.dart';
// import 'package:docdoc/feature/login/widgets/password_validation_info.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../core/widgets/delishop_button.dart';
// import '../../../core/widgets/delishop_text_field.dart';
// import '../cubit/login_cubit.dart';
// import 'forget_password_row.dart';
//
// class EmailPasswordAndButton extends StatefulWidget {
//   const EmailPasswordAndButton({super.key});
//
//   @override
//   State<EmailPasswordAndButton> createState() => _EmailPasswordAndButtonState();
// }
//
// class _EmailPasswordAndButtonState extends State<EmailPasswordAndButton> {
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 DocdocTextField(
//                   validator: (value) {
//                     if (value == null ||
//                         value.isEmpty ||
//                         !value.isEmailValid()) {
//                       return "Please enter a valid email.";
//                     }
//                     return null;
//                   },
//                   validate: () {
//                     return _formKey.currentState!.validate();
//                   },
//                   textEditingController:
//                       context.read<LoginCubit>().emailController,
//                   labelText: "Email",
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 SizedBox(height: 16.h),
//                 DocdocTextField(
//                   textEditingController:
//                       context.read<LoginCubit>().passwordController,
//                   labelText: "Password",
//                   isPassword: true,
//                   keyboardType: TextInputType.visiblePassword,
//                   validator: (value) {
//                     if (value == null ||
//                         value.isEmpty ||
//                         !value.isPasswordValid()) {
//                       return "Enter a valid password";
//                     }
//                     return null;
//                   },
//                   validate: () {
//                     return _formKey.currentState!.validate();
//                   },
//                   onChanged: (value) {
//                     context.read<ValidationCubit>().update(context.read<LoginCubit>().passwordController.text);
//                   },
//                 ),
//               ],
//             )),
//         SizedBox(height: 16.h),
//         const PasswordValidationInfo(),
//         const ForgetPasswordRow(),
//         SizedBox(height: 32.h),
//         BlocBuilder<LoginCubit, LoginState>(
//           builder: (context, state) {
//             debugPrint("state.runtimeType ${state.runtimeType}");
//             switch (state) {
//               case LoginLoading _:
//                 return const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                   child: Center(child: CircularProgressIndicator()),
//                 );
//               case LoginInitial _:
//                 ;
//               case LoginSuccess _:
//                 context.showAlertDialog(
//                     title: "Success",
//                     content:
//                         "Your login token will be: ${state.loginResponseModel.data?.token}");
//               case LoginError _:
//                 state.errorModel.when<void>(
//                   onUnprocessableEntity: () {
//                     context.showAlertDialog(
//                         title: "Unprocessable Entity",
//                         content: state.errorModel.details.getDataInLines());
//                   },
//                   onUnauthorized: () {
//                     context.showAlertDialog(title: "Wrong Credentials");
//                   },
//                   onNoInternet: () {
//                     context.showAlertDialog(title: "No Internet Connection!");
//                   },
//                   onUnknown: () {
//                     context.showAlertDialog(title: "Something went wrong!");
//                   },
//                 );
//             }
//             return DocdocButton(
//                 onPressed: () {
//                   if(_formKey.currentState!.validate()) {
//                     context.read<LoginCubit>().login();
//                   }
//                   else {
//                     context.showAlertDialog(title: "Info", content: "Please enter valid info", actions: [
//                       TextButton(onPressed: () {
//                         context.read<LoginCubit>().login();
//                         context.pop();
//                       }, child: Text("Ok, try that", style: TextStyle(color: Theme.of(context).colorScheme.error),),)
//                     ]);
//                   }
//                 },
//                 text: "Login");
//           },
//         ),
//       ],
//     );
//   }
// }
