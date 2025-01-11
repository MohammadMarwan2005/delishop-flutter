import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/db_service.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/feature/cart/logic/order_entity.dart';
import 'package:equatable/equatable.dart';
import '../../../core/data/repo/wallet_repo.dart';
import '../../../core/ui_state.dart';
import '../logic/get_order_entity_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final DBService _dbService;
  final GetOrderEntitiesUseCase _getOrderEntitiesUseCase;
  final WalletRepo _walletRepo;

  CartCubit(this._dbService, this._getOrderEntitiesUseCase, this._walletRepo)
      : super(const CartState(
            orderEntities: UIState(isLoading: true),
            currentBalance: UIState(isLoading: true))) {
    reloadAllData();
  }

  Future<void> fetchCartContent({int? badgeCount}) async {
    emit(state.copyWith(products: const UIState(isLoading: true)));
    final data = await _dbService.getCartProducts();
    final cartResult = data.map((e) => e.toProduct()).toList();

    final response =
        await _getOrderEntitiesUseCase(cartResult, state.productsQuants);
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(
            products: UIState(data: successData), badgeCount: badgeCount));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(
            products: UIState(error: domainErrorModel),
            badgeCount: badgeCount));
      },
    );
  }

  Future<void> fetchMyBalance() async {
    emit(state.copyWith(currentBalance: const UIState(isLoading: true)));
    final response = await _walletRepo.getMyBalance();
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(
            currentBalance: UIState(data: successData.balance)));
      },
      onError: (domainErrorModel) {
        if (domainErrorModel.code == 500 && domainErrorModel.message == "Attempt to read property \"balance\" on null") {
          fetchMyBalance();
        } else {
          emit(state.copyWith(currentBalance: UIState(error: domainErrorModel)));
        }
      },
    );
  }

  Future<void> addProductToCart(Product product,
      {bool increaseBadge = true}) async {
    await _dbService.addProductToDatabase(product.toProductDataModel());
    final increasing = increaseBadge ? 1 : 0;
    await fetchCartContent(badgeCount: state.badgeCount + increasing);
  }

  Future<void> removeFromCart(int productId) async {
    await _dbService.removeProductFromDatabase(productId);
    await fetchCartContent();
  }

  Future<void> removeProductsFromDatabase(List<int> productsIds) async{
    await _dbService.removeProductsFromDatabase(productsIds);
    await fetchCartContent();
  }

  clearBadge() {
    emit(state.copyWith(badgeCount: 0));
  }

  void onQuantityChanged(int id, int newQuan) {
    var newMap = Map.of(state.productsQuants);
    newMap[id] = newQuan;
    emit(state.copyWith(productsQuants: newMap));
  }

  void reloadAllData() {
    Future.wait([fetchCartContent(), fetchMyBalance()]);
  }
  void waitAndReloadAllData() {
    Future.delayed(const Duration(seconds: 1), () {
      reloadAllData();
    },);
  }

  Future<bool> isProductInCart(int productId) async {
    return await _dbService.isInDatabase(productId);
  }
}
