import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/data/model/profile/profile.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/condition_text.dart';
import 'package:delishop/core/widgets/delishop_button.dart';
import 'package:delishop/core/widgets/delishop_text_field.dart';
import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/core/widgets/loading.dart';
import 'package:delishop/core/widgets/toggle_lang_button.dart';
import 'package:delishop/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/delishop_text_button.dart';
import '../auth/login/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile".tr(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return state.profile.when(
                onLoading: () {
                  return const Loading();
                },
                onSuccess: (data) {
                  final cubit = context.read<ProfileCubit>();
                  return Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 100.h,
                            child: ClipOval(
                                clipBehavior: Clip.antiAlias,
                                child: (state.image != null)
                                    ? Image.file(
                                        state.image!,
                                        width: 200.h,
                                        height: 200.h,
                                        fit: BoxFit.cover,
                                      )
                                    : (data.imageUrl != null)
                                        ? Image.network(
                                            data.imageUrl!,
                                            width: 200.h,
                                            height: 200.h,
                                            fit: BoxFit.cover,
                                            loadingBuilder: reusableLoadingBuilder,
                                          )
                                        : Image.asset(
                                            "assets/images/profile_image_placeholder.jpeg",
                                            width: 200.h,
                                            height: 200.h,
                                            fit: BoxFit.cover,
                                          )),
                          ),
                          (state.image != null)
                              ? IconButton(
                                  onPressed: () {
                                    cubit.removePicture();
                                  },
                                  icon: Icon(
                                    size: 32.h,
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                              : IconButton(
                                  onPressed: () {
                                    cubit.pickImage();
                                  },
                                  icon: Icon(
                                    size: 32.h,
                                    Icons.edit,
                                    color: Colors.amber,
                                  ))
                        ],
                      ),
                      const SizedBox(height: 32),
                      DelishopTextField(
                          labelText: "First Name".tr(context),
                          textEditingController: cubit.firstNameController),
                      const SizedBox(height: 16),
                      DelishopTextField(
                          labelText: "Last Name".tr(context),
                          textEditingController: cubit.lastNameController),
                      const SizedBox(height: 16),
                      DelishopTextField(
                          labelText: "Phone Number",
                          textEditingController: cubit.phoneNumberController),
                      const SizedBox(height: 32),
                      DelishopButton(
                          onPressed: () {
                            cubit.updateProfile();
                          },
                          text: "Save".tr(context)),
                      SizedBox(height: 48.h),
                      const ToggleLangButton(),
                      SizedBox(height: 8.h),
                      DelishopTextButton(
                          onClick: () {
                            context.read<ProfileCubit>().logout();
                            context.removeAndPush(LoginScreen());
                          },
                          label: "Logout".tr(context)),
                    ],
                  );
                },
                onError: (domainError) {
                  return ErrorMessage(
                    message: domainError.getMessage(context),
                    onTryAgain: () {
                      context.read<ProfileCubit>().fetchProfile();
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget reusableLoadingBuilder(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) {
    return child;
  } else {
    return const Loading();
  }
}