import 'package:delishop/core/data/model/location/location.dart';
import 'package:delishop/core/helpers/alert_dialog_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:delishop/core/widgets/delishop_button.dart';
import 'package:delishop/core/widgets/delishop_text_field.dart';
import 'package:delishop/core/widgets/loading.dart';
import 'package:delishop/feature/cart/widgets/tabbed_cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feature/global/global_cubit.dart';
import '../data/api_consts.dart';
import 'error_message.dart';

class LocationCard extends StatelessWidget {
  final int? selectedIndex;
  final Function(int index) onSelect;

  const LocationCard({
    super.key,
    this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return state.allLocations.when(
          onLoading: () {
            return Loading(
              height: 50.h,
              width: 50.h,
            );
          },
          onSuccess: (data) {
            return LocationCardContent(
              locations: data,
              onSelect: onSelect,
              selectedIndex: selectedIndex,
              onAddLocationClicked: () {
                onAddClicked(
                  context,
                  (location) {
                    context.pop();
                    context.read<GlobalCubit>().addNewLocation(location);
                  },
                );
              },
              onDelete: (locationId) {
                context.pop();
                context.read<GlobalCubit>().deleteLocation(locationId);
              },
            );
          },
          onError: (domainError) {
            if (domainError.code == StatusCodes.notFound) {
              return ErrorMessage(
                message: domainError.getMessage(context),
                onTryAgain: () {
                  context.read<GlobalCubit>().fetchDefaultLocation();
                },
              );
            }
            return ErrorMessage(
              message: domainError.getMessage(context),
              onTryAgain: () {
                context.read<GlobalCubit>().fetchDefaultLocation();
              },
            );
          },
        );
      },
      listener: (context, state) {
        if (state.addState.error != null) {
          context.setupErrorState(state.addState.error!);
        }
        if (state.deleteState.error != null) {
          context.setupErrorState(state.addState.error!);
        }
      },
    );
  }

  void onAddClicked(
      BuildContext context, Function(Location location) onAddNewLocation) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) {
        final TextEditingController nameController = TextEditingController();
        final TextEditingController urlController = TextEditingController();

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add New Location".tr(context),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                DelishopTextField(
                    textEditingController: nameController,
                    labelText: "Location Name".tr(context)),
                const SizedBox(height: 16),
                DelishopTextField(
                    textEditingController: urlController,
                    labelText: "Location URL".tr(context)),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Cancel".tr(context),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    DelishopButton(
                        onPressed: () {
                          final location = Location(
                              name: nameController.text,
                              url: urlController.text);
                          onAddNewLocation(location);
                        },
                        text: "Add".tr(context))
                  ],
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LocationCardContent extends StatelessWidget {
  final List<Location> locations;
  final int? selectedIndex;
  final Function(int index) onSelect;
  final Function(int locationId) onDelete;
  final Function() onAddLocationClicked;

  const LocationCardContent({
    super.key,
    required this.locations,
    this.selectedIndex,
    required this.onSelect,
    required this.onAddLocationClicked,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: DelishopColors.imageBackground),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: PopupMenuButton<int>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onSelected: (value) {
          if (value == -1) {
            onAddLocationClicked();
          } else {
            onSelect(value);
          }
        },
        itemBuilder: (context) {
          return [
            // Generate menu items for locations
            ...locations.asMap().entries.map(
                  (entry) => PopupMenuItem<int>(
                    value: entry.key,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            entry.key == selectedIndex?.getIndex(locations)
                                ? const SizedBox(
                                    width: 16,
                                    child:
                                        Icon(Icons.check, color: Colors.green),
                                  )
                                : const SizedBox(
                                    width: 16,
                                  ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(entry.value.name),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              onDelete(entry.value.id!);
                            },
                            icon: const Icon(Icons.delete, color: Colors.red)),
                      ],
                    ),
                  ),
                ),
            const PopupMenuDivider(),
            // Add new location option
            PopupMenuItem<int>(
              value: -1,
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.green),
                  SizedBox(width: 8),
                  Text("Add New Location".tr(context)),
                ],
              ),
            ),
          ];
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location".tr(context),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    locations.isEmpty
                        ? "Add".tr(context)
                        : selectedIndex == null
                            ? "Choose".tr(context)
                            : locations[selectedIndex!.getIndex(locations)].name,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
