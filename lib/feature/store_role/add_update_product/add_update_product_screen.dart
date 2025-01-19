import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/feature/store_role/add_update_product/cubit/add_update_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/delishop_button.dart';
import '../../../core/widgets/delishop_text_field.dart';
import '../../../core/widgets/error_message.dart';
import '../../../core/widgets/loading.dart';
import '../../profile/profile_screen.dart';

class AddUpdateProductScreen extends StatelessWidget {
  const AddUpdateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add & Update Product".tr(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              BlocBuilder<AddUpdateProductCubit, AddUpdateProductState>(
                builder: (context, state) {
                  return state.product.when(
                    onLoading: () {
                      return const Loading();
                    },
                    onSuccess: (data) {
                      final cubit = context.read<AddUpdateProductCubit>();
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
                                        : (data?.productPicture != null)
                                            ? Image.network(
                                                data!.productPicture!,
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
                              labelText: "Product Name".tr(context),
                              textEditingController: cubit.nameController),
                          const SizedBox(height: 16),
                          DelishopTextField(
                              labelText: "Product Description".tr(context),
                              textEditingController:
                                  cubit.descriptionController),
                          const SizedBox(height: 16),
                          DelishopTextField(
                              labelText: "Price".tr(context),
                              textEditingController: cubit.priceController),
                          const SizedBox(height: 16),
                          DelishopTextField(
                              labelText: "Discount".tr(context),
                              textEditingController: cubit.discountController),
                          const SizedBox(height: 16),
                          DelishopTextField(
                              labelText: "Quantity".tr(context),
                              textEditingController: cubit.quantityController),
                          const SizedBox(height: 32),
                          DelishopButton(
                              onPressed: () {
                                cubit.postProduct();
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
                          context.read<AddUpdateProductCubit>().emitCachedData();
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
