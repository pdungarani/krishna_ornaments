import 'dart:convert';

import 'package:flutter/widgets.dart';
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

  final ScrollController scrollArrivalProductController = ScrollController();
  List<ProductsDoc> productArrivalDocList = [];

  int pageArrivalProductCount = 1;
  bool isProductArrivalLastPage = false;
  bool isProductArrivalLoading = false;

  Future<void> postAllProduct(int pageKey) async {
    if (pageKey == 1) {
      pageArrivalProductCount = 1;
    }
    var response = await homePresenter.postAllProduct(
      page: pageKey,
      limit: 10,
      search: "",
      category: "",
      min: "",
      max: "",
      productType: "arrival",
      isLoading: false,
    );
    if (response?.data != null) {
      if (pageKey == 1) {
        isProductArrivalLastPage = false;
        productArrivalDocList.clear();
      }
      if ((response?.data?.docs?.length ?? 0) < 10) {
        isProductArrivalLastPage = true;
        productArrivalDocList.addAll(response?.data?.docs ?? []);
      } else {
        pageArrivalProductCount++;
        productArrivalDocList.addAll(response?.data?.docs ?? []);
      }
      if (pageKey == 1) {
        if (scrollArrivalProductController.positions.isNotEmpty) {
          scrollArrivalProductController.jumpTo(0);
        }
      }
    } else {
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  final ScrollController scrollTrendingController = ScrollController();
  List<ProductsDoc> productTrendingDocList = [];

  int pageTrendingProductCount = 1;
  bool isProductTrendingLastPage = false;
  bool isProductTrendingLoading = false;

  Future<void> postAllTrendingProduct(int pageKey) async {
    if (pageKey == 1) {
      pageTrendingProductCount = 1;
    }
    var response = await homePresenter.postAllProduct(
      page: pageKey,
      limit: 10,
      search: "",
      category: "",
      min: "",
      max: "",
      productType: "trending",
      isLoading: false,
    );
    if (response?.data != null) {
      if (pageKey == 1) {
        isProductTrendingLastPage = false;
        productTrendingDocList.clear();
      }
      if ((response?.data?.docs?.length ?? 0) < 10) {
        isProductTrendingLastPage = true;
        productTrendingDocList.addAll(response?.data?.docs ?? []);
      } else {
        pageTrendingProductCount++;
        productTrendingDocList.addAll(response?.data?.docs ?? []);
      }
      if (pageKey == 1) {
        if (scrollTrendingController.positions.isNotEmpty) {
          scrollTrendingController.jumpTo(0);
        }
      }
    } else {
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  Future<void> postAddToCart(
      ProductsDoc productsDoc, int index, String productType) async {
    var response = await homePresenter.postAddToCart(
      productId: productsDoc.id ?? "",
      quantity: productsDoc.quantity,
      description: "",
      isLoading: false,
    );
    if (response?.data != null) {
      if (productType.contains("arrival")) {
        productArrivalDocList[index].inCart = true;
      } else {
        productTrendingDocList[index].inCart = true;
      }
    } else {
      Utility.errorMessage(jsonDecode(response.toString())['Data']['Message']);
    }
    update();
  }
}
