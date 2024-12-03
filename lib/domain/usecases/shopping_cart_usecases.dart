import 'package:krishna_ornaments/domain/domain.dart';

class ShoppingCartUsecases {
  ShoppingCartUsecases(this.repository);

  final Repository repository;

  // Future<ResponseModel?> postCardRemove({
  //   bool isLoading = false,
  //   required String productId,
  // }) async =>
  //     await repository.postCardRemove(
  //       productId: productId,
  //       isLoading: isLoading,
  //     );

  Future<CartItemModel?> postGetAllCartProduct({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await repository.postGetAllCartProduct(
        isLoading: isLoading,
        limit: limit,
        page: page,
      );

  Future<CartItemModel?> postCartProductRemove({
    bool isLoading = false,
    required String productId,
  }) async =>
      await repository.postCartProductRemove(
        isLoading: isLoading,
        productId: productId,
      );
}
