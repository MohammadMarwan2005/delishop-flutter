import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/feature/store_role/my_store/cubit/my_store_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/delishop_button.dart';
import '../../../core/widgets/delishop_text_field.dart';
import '../../../core/widgets/error_message.dart';
import '../../../core/widgets/loading.dart';
import '../../../core/widgets/logout_button.dart';
import '../../../core/widgets/toggle_lang_button.dart';
import '../../profile/profile_screen.dart';
import '../../search/categories_filter_row.dart';

class MyStoreScreen extends StatelessWidget {
  const MyStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Mall".tr(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              BlocBuilder<MyStoreCubit, MyStoreState>(
                builder: (context, state) {
                  return state.myStore.when(
                    onLoading: () {
                      return const Loading();
                    },
                    onSuccess: (data) {
                      final cubit = context.read<MyStoreCubit>();
                      return Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 100.h,
                                child: ClipOval(
                                    clipBehavior: Clip.antiAlias,
                                    child: (state.storeUploadedImage != null)
                                        ? Image.file(
                                      state.storeUploadedImage!,
                                      width: 200.h,
                                      height: 200.h,
                                      fit: BoxFit.cover,
                                    )
                                        : (data.storePicture != null)
                                        ? Image.network(
                                      data.storePicture!,
                                      width: 200.h,
                                      height: 200.h,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                      reusableLoadingBuilder,
                                    )
                                        : Image.asset(
                                      "assets/images/profile_image_placeholder.jpeg",
                                      width: 200.h,
                                      height: 200.h,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              (state.storeUploadedImage != null)
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
                              labelText: "Mall Name".tr(context),
                              textEditingController: cubit.storeNameController),
                          const SizedBox(height: 16),
                          DelishopTextField(
                              labelText: "Mall Description".tr(context),
                              textEditingController: cubit.descriptionController),
                          const SizedBox(height: 16),
                          DelishopTextField(
                              labelText: "Location Name".tr(context),
                              textEditingController: cubit.locationNameController),
                          const SizedBox(height: 16),
                          DelishopTextField(
                              labelText: "Location Url".tr(context),
                              textEditingController: cubit.locationUrlController),
                          const SizedBox(height: 16),
                          state.categories.when(
                            onLoading: () {
                              return const Loading();
                            },
                            onSuccess: (data) {
                              return CategoriesFilterRow(
                                categories: data,
                                onSelectIndex: (index) {
                                  context
                                      .read<MyStoreCubit>()
                                      .onCategorySelected(index);
                                },
                                selectedIndex: context
                                    .read<MyStoreCubit>()
                                    .state
                                    .selectedCategoryIndex,
                              );
                            },
                            onError: (domainError) {
                              return ErrorMessage(
                                message: domainError.getMessage(context),
                                onTryAgain: () {
                                  context.read<MyStoreCubit>().fetchMyStore();
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 32),
                          DelishopButton(
                              onPressed: () {
                                cubit.save();
                              },
                              text: "Save".tr(context)),
                          SizedBox(height: 48.h),
                        ],
                      );
                    },
                    onError: (domainError) {
                      return ErrorMessage(
                        message:
                        "${domainError.getMessage(context)}\n${domainError.details.firstOrNull ?? ""}",
                        onTryAgain: () {
                          context.read<MyStoreCubit>().fetchMyStore();
                        },
                      );
                    },
                  );
                },
              ),
              const ToggleLangButton(),
              SizedBox(height: 8.h),
              const LogoutButton(),
            ],
          ),
        ),
      ),
    );;
  }
}
