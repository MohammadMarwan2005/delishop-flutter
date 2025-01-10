import 'package:delishop/core/data/model/store/store.dart';
import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/widgets/broken_image.dart';
import 'package:delishop/feature/store_full_screen/store_cubit.dart';
import 'package:delishop/feature/store_full_screen/store_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallStoreCard extends StatelessWidget {
  final Store store;

  const SmallStoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(BlocProvider<StoreCubit>(
          create: (context) => StoreCubit(productRepo: getIt(), storeRepo: getIt(), storeId: store.id, userDataRepo: getIt(), gaRepo: getIt()),
          child: const StoreFullScreen(),
        ));
      },
      child: SizedBox(
        width: 200,
        height: 200,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  store.storePicture.validatePicture(),
                  width: double.infinity,
                  height: 150.w,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const BrokenImage();
                  },
                ),
              ),
              // Store Name
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary
                        .withOpacity(0.8)),
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  store.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
