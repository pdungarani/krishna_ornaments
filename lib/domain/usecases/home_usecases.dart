import 'package:krishna_ornaments/domain/domain.dart';

class HomeUseCases {
  HomeUseCases(this.repository);

  final Repository repository;

  Future<GetCategoriesModel?> getAllCategories({
    bool isLoading = false,
  }) async =>
      await repository.getAllCategories(
        isLoading: isLoading,
      );

  Future<ProductsModel?> postAllProduct({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String category,
  }) async =>
      await repository.postAllProduct(
        page: page,
        limit: limit,
        search: search,
        category: category,
        isLoading: isLoading,
      );
}
