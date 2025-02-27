import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class CategoryController extends GetxController {
  CategoryController(this.categoryPresenter);

  final CategoryPresenter categoryPresenter;

  List<GetCategoriesData> getCategoriesList = [];

  bool isLoading = true;
  var client = http.Client();

  Future<void> getAllCategories() async {
    var response = await client.get(
      Uri.parse("https://api.krishnaornaments.com/user/categories"),
      headers: {
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
    );

    var loginModel = getCategoriesModelFromJson(response.body);
    if (loginModel.data != null) {
      isLoading = false;
      getCategoriesList = loginModel.data ?? [];
    } else {
      isLoading = false;
      Utility.errorMessage(loginModel.message.toString());
    }
    update();
  }
}
