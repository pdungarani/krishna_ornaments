import 'package:krishna_ornaments/data/data.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class HomePresenter {
  HomePresenter(this.homeUseCases);

  final HomeUseCases homeUseCases;

  Future<GetCategoriesModel?> getAllCategories({
    bool isLoading = false,
  }) async =>
      await homeUseCases.getAllCategories(
        isLoading: isLoading,
      );

  Future<ProductsModel?> postAllProduct({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String category,
    required String min,
    required String max,
    required String productType,
    required String sortField,
    required var sortOption,
  }) async =>
      await homeUseCases.postAllProduct(
        page: page,
        limit: limit,
        search: search,
        category: category,
        min: min,
        max: max,
        productType: productType,
        sortField: sortField,
        sortOption: sortOption,
        isLoading: isLoading,
      );

  Future<ResponseModel?> postAddToCart({
    bool isLoading = false,
    required String productId,
    required int quantity,
    required String description,
  }) async =>
      await homeUseCases.postAddToCart(
        productId: productId,
        quantity: quantity,
        description: description,
        isLoading: isLoading,
      );

  Future<ResponseModel?> postOrderCreate({
    bool isLoading = false,
    required List<Product> productId,
    required String main_description,
  }) async =>
      await homeUseCases.postOrderCreate(
        productId: productId,
        main_description: main_description,
        isLoading: isLoading,
      );
}
