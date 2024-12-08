import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);

  final HomePresenter homePresenter;

  @override
  onInit() {
    super.onInit();
    getAllCategories();
    postWishlist(1);
  }

  late PageController controller;

  int itemCounter = 0;

  List<String> testList = ["fds", "Fsdf"];

  /// >>>>>>>>>>>>>> For view all Screen <<<<<<<<<<<<<<<<<<<< ///

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
      min: "1",
      max: "10",
      productType: "arrival",
      sortField: "weight",
      sortOption: 1,
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
      min: "1",
      max: "10",
      productType: "trending",
      sortField: 'weight',
      sortOption: 1,
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

  List<ProductsDoc> getAllProductDocList = [];
  final ScrollController scrollViewAllController = ScrollController();

  Future<void> postGetAllProduct(int pageKey, String search) async {
    if (pageKey == 1) {
      pageTrendingProductCount = 1;
    }
    var response = await homePresenter.postAllProduct(
      page: pageKey,
      limit: 10,
      search: search,
      category: "",
      min: "",
      max: "",
      productType: "",
      sortField: '_id',
      sortOption: 1,
      isLoading: false,
    );
    if (response?.data != null) {
      if (pageKey == 1) {
        isProductTrendingLastPage = false;
        getAllProductDocList.clear();
      }
      if ((response?.data?.docs?.length ?? 0) < 10) {
        isProductTrendingLastPage = true;
        getAllProductDocList.addAll(response?.data?.docs ?? []);
      } else {
        pageTrendingProductCount++;
        getAllProductDocList.addAll(response?.data?.docs ?? []);
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
      String productId, int quantity, int index, String productType) async {
    var response = await homePresenter.postAddToCart(
      productId: productId ?? "",
      quantity: quantity,
      description: "",
      isLoading: false,
    );
    if (response?.data != null) {
      if (productType.contains("arrival")) {
        productArrivalDocList[index].inCart = true;
      } else if (productType.contains('wishlist')) {
        wishlistList[index].inCart = true;
      } else {
        productTrendingDocList[index].inCart = true;
      }
      Utility.snacBar(
          "Product added in cart successfully...!", ColorsValue.appColor);
    } else {
      Utility.errorMessage(jsonDecode(response.toString())['Data']['Message']);
    }
    update();
  }

  final ScrollController scrollWishListController = ScrollController();

  List<WishlistDoc> wishlistList = [];
  List<WishlistDoc> wishlistCount = [];
  bool isWishListLastPage = false;
  bool isWishListLoading = false;
  int pageWishCount = 1;
  bool isWishLoading = true;

  Future<void> postWishlist(int pageKey) async {
    if (pageKey == 1) {
      pageWishCount = 1;
    }
    var response = await homePresenter.postWishlist(
      page: pageKey,
      limit: 10,
      isLoading: true,
    );
    wishlistCount.clear();
    if (response?.data != null) {
      if (pageKey == 1) {
        isWishListLastPage = false;
        wishlistList.clear();
      }

      wishlistCount.addAll(response?.data?.docs ?? []);
      if ((response?.data?.docs?.length ?? 0) < 10) {
        isWishListLastPage = true;
        wishlistList.addAll(response?.data?.docs ?? []);
      } else {
        pageWishCount++;
        wishlistList.addAll(response?.data?.docs ?? []);
      }
      if (pageKey == 1) {
        if (scrollWishListController.positions.isNotEmpty) {
          scrollWishListController.jumpTo(0);
        }
      }
      isWishLoading = false;
    }
    update();
  }

  TextEditingController buyNowDesController = TextEditingController();

  Future<void> postWishlistAddRemove(
      String productsDoc, int index, bool isRemove) async {
    var response = await homePresenter.postWishlistAddRemove(
      productId: productsDoc,
      isLoading: false,
    );
    if (response?.data != null) {
      if (isRemove) wishlistList.removeAt(index);
      postAllProduct(1);
      postWishlist(1);
      postAllTrendingProduct(1);
    }
    update();
  }
}
