import 'package:get/get.dart';
import 'package:krishna_ornaments/app/pages/categoryScreen/category_page.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class CategoryController extends GetxController {
  CategoryController(this.categoryPresenter);

  final CategoryPresenter categoryPresenter;

  List<GetCategoriesData> getCategoriesList = [];

  Future<void> getAllCategories() async {
    var response = await categoryPresenter.getAllCategories(
      isLoading: true,
    );
    getCategoriesList.clear();
    if (response?.data != null) {
      getCategoriesList.addAll(response?.data ?? []);
    }
    update();
  }
}
