part of 'add_update_product_cubit.dart';

class AddUpdateProductState extends Equatable {
  final UIState<Product?> product;
  final File? image;

  const AddUpdateProductState({required this.product, this.image});

  @override
  List<Object?> get props => [product, image];

  AddUpdateProductState copyWith({
    UIState<Product>? product,
    File? image,
  }) {
    return AddUpdateProductState(
      product: product ?? this.product,
      image: image ?? this.image,
    );
  }

  AddUpdateProductState withoutImage() {
    return AddUpdateProductState(
      product: product,
      image: null,
    );
  }
}
