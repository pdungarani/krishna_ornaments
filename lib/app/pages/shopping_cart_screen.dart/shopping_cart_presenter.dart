import 'package:krishna_ornaments/domain/domain.dart';

class ShoppingCartPresenter {
  ShoppingCartPresenter(this.shoppingCartUsecases);

  final ShoppingCartUsecases shoppingCartUsecases;

  Future<CartItemModel?> postGetAllCartProduct({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await shoppingCartUsecases.postGetAllCartProduct(
        isLoading: isLoading,
        limit: limit,
        page: page,
      );

  Future<CartItemModel?> postCartProductRemove({
    bool isLoading = false,
    required String productId,
  }) async =>
      await shoppingCartUsecases.postCartProductRemove(
        isLoading: isLoading,
        productId: productId,
      );
}
