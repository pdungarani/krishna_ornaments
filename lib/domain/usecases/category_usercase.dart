import 'package:krishna_ornaments/domain/domain.dart';

class CategoryUseCases {
  CategoryUseCases(this.repository);

  final Repository repository;

  Future<GetCategoriesModel?> getAllCategories({
    bool isLoading = false,
    bool isSubCategories = false,
    String? categoriesId,
  }) async =>
      await repository.getAllCategories(
        isLoading: isLoading,
        isSubCategories: isSubCategories,
        categoriesId: categoriesId,
      );
}
