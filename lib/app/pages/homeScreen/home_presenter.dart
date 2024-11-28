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
  }) async =>
      await homeUseCases.postAllProduct(
        page: page,
        limit: limit,
        search: search,
        category: category,
        isLoading: isLoading,
      );
}
