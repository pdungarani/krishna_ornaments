import 'package:krishna_ornaments/domain/domain.dart';

class CategoryPresenter {
  CategoryPresenter(this.categoryUseCases);

  final CategoryUseCases categoryUseCases;

  Future<GetCategoriesModel?> getAllCategories({
    bool isLoading = false,
    bool isSubCategories = false,
    String? categoriesId,
  }) async =>
      await categoryUseCases.getAllCategories(
        isLoading: isLoading,
        isSubCategories: isSubCategories,
        categoriesId: categoriesId,
      );
}
