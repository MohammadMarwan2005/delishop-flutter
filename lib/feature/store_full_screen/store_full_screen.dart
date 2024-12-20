import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/widgets/item_grid_view.dart';
import 'package:delishop/feature/home/widgets/small_product_card.dart';
import 'package:flutter/material.dart';

import '../../core/data/model/store/store.dart';
import '../../core/theme/delishop_colors.dart';
import '../../core/theme/delishop_text_styles.dart';
import '../../core/widgets/broken_image.dart';

class StoreFullScreen extends StatelessWidget {
  final Store store;

  const StoreFullScreen({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Store Image
                  store.storePicture.isNotEmpty
                      ? ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(8.0)),
                    child: Image.network(
                      store.storePicture.validatePicture(),
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const BrokenImage(),
                    ),
                  )
                      : const BrokenImage(),
                  // Favorite Button
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      icon: Icon(
                        store.isFavorite ?? true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: store.isFavorite ?? true ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        // Handle favorite toggle
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Store Name
                    Text(
                      store.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Store Location
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          store.location,
                          style: TextStyle(
                            fontSize: 16,
                            color: DelishopColors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Store Rating
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 8),
                        Text(
                          "${store.rating}",
                          style: DelishopTextStyles.font16SemiBoldBlack.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Store Description
                    Text(
                      store.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: DelishopColors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Button to View Store Products
                    ItemGridView<Product>(items: const [
                      Product(id: 1, storeId: 1, name: "name", description: "description", productPicture: "http://127.0.0.1:8000/storage/uploads/1.jpg", price: "2.2", discount: "2.2", quantity: 100, isFavorite: false, rating: 2.2),
                      Product(id: 1, storeId: 1, name: "name", description: "description", productPicture: "http://127.0.0.1:8000/storage/uploads/1.jpg", price: "2.2", discount: "2.2", quantity: 100, isFavorite: false, rating: 2.2),
                      Product(id: 1, storeId: 1, name: "name", description: "description", productPicture: "http://127.0.0.1:8000/storage/uploads/1.jpg", price: "2.2", discount: "2.2", quantity: 100, isFavorite: false, rating: 2.2),
                    ], cardBuilder: (item) {
                      return SmallProductCard(product: item);
                    },)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
