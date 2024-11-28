import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);

  final HomePresenter homePresenter;

  @override
  onInit() {
    super.onInit();
    getAllCategories();
  }

  late PageController controller;

  int itemCounter = 0;


  /// >>>>>>>>>>>>>> For view all Screen <<<<<<<<<<<<<<<<<<<< ///

  String productType = "";
  int radioValue = 0;
  String radioSortValue = "DLTH";
  bool isLoading = true;
  List<String> filterType = [
    'price'.tr,
    'customer_rating'.tr,
  ];
  int filterValue = 0;
  double minValue = 2000;
  double maxValue = 2000;
  double startValue = 100;
  double endValue = 2000;
  int filterRating = 5;
  bool isFilter = false;
  List productList = [];
  final ScrollController scrollBestSellerController = ScrollController();

  ////Harshil

  int selectPage = 0;

  List<GetCategoriesData> getCategoriesList = [];

  Future<void> getAllCategories() async {
    var response = await homePresenter.getAllCategories(
      isLoading: true,
    );
    getCategoriesList.clear();
    if (response?.data != null) {
      getCategoriesList.addAll(response?.data ?? []);
    }
    update();
  }

  final ScrollController scrollProductController = ScrollController();
  List<ProductsDoc> productDocList = [];

  int pageProductCount = 1;
  bool isProductLastPage = false;
  bool isProductLoading = false;

  Future<void> postAllProduct(int pageKey) async {
    if (pageKey == 1) {
      pageProductCount = 1;
    }
    var response = await homePresenter.postAllProduct(
      page: pageKey,
      limit: 10,
      search: "",
      category: "",
      isLoading: false,
    );
    if (response?.data != null) {
      if (pageKey == 1) {
        isProductLastPage = false;
        productDocList.clear();
      }
      if ((response?.data?.docs?.length ?? 0) < 10) {
        isProductLastPage = true;
        productDocList.addAll(response?.data?.docs ?? []);
      } else {
        pageProductCount++;
        productDocList.addAll(response?.data?.docs ?? []);
      }
      if (pageKey == 1) {
        if (scrollProductController.positions.isNotEmpty) {
          scrollProductController.jumpTo(0);
        }
      }
    } else {
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }
}
