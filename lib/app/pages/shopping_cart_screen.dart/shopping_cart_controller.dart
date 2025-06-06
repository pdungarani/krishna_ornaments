// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class ShoppingCartController extends GetxController {
  ShoppingCartController(this.shoppingCartPresenter);

  final ShoppingCartPresenter shoppingCartPresenter;

  GlobalKey<FormState> productKey = GlobalKey<FormState>();
  GlobalKey<FormState> finalKey = GlobalKey<FormState>();
  TextEditingController productDesController = TextEditingController();
  TextEditingController finalDesController = TextEditingController();

  List<CartItemProductElement> list = [];

  List<String> filterType = [
    'Weight'.tr,
    'Stock'.tr,
  ];

  int filterStock = 0;

  showFinalDescription(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      barrierColor: Colors.grey.withOpacity(0.5),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Form(
                key: finalKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  padding: Dimens.edgeInsets20_30_20_30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimens.twelve),
                      topRight: Radius.circular(Dimens.twelve),
                    ),
                    color: ColorsValue.color9C9C9C,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'final_des'.tr,
                        style: Styles.whiteW80024,
                      ),
                      Dimens.boxHeight20,
                      Row(
                        children: [
                          Text(
                            'description'.tr,
                            style: Styles.whiteW60012,
                          ),
                          Dimens.boxWidth3,
                          Text(
                            "*",
                            textAlign: TextAlign.start,
                            style: Styles.whiteW60012,
                          )
                        ],
                      ),
                      Dimens.boxHeight5,
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 40,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          style: Styles.txtBlackColorW50014,
                          controller: finalDesController,
                          maxLines: 3,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter_final_product_des'.tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding: Dimens.edgeInsets10,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            filled: true,
                            fillColor: ColorsValue.colorDFDFDF,
                          ),
                        ),
                      ),
                      Dimens.boxHeight30,
                      ElevatedButton(
                        onPressed: () {
                          if (finalKey.currentState!.validate()) {
                            Get.back();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            double.maxFinite,
                            Dimens.fourtyFive,
                          ),
                          backgroundColor: ColorsValue.appColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Dimens.twelve,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'place_order'.tr,
                            style: Styles.whiteW80014,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  showProductDescription(
      BuildContext context, CartItemProductElement item, int index) {
    productDesController.clear();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      barrierColor: Colors.grey.withOpacity(0.5),
      backgroundColor: ColorsValue.color9C9C9C,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Form(
                key: productKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  padding: Dimens.edgeInsets20_30_20_30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimens.twelve),
                      topRight: Radius.circular(Dimens.twelve),
                    ),
                    color: ColorsValue.color9C9C9C,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'product_des'.tr,
                        style: Styles.whiteW80024,
                      ),
                      Dimens.boxHeight20,
                      Text(
                        'description'.tr,
                        style: Styles.whiteW60012,
                      ),
                      Dimens.boxHeight5,
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 40,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          style: Styles.txtBlackColorW50014,
                          controller: productDesController,
                          maxLines: 3,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter_product_des'.tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding: Dimens.edgeInsets10,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            filled: true,
                            fillColor: ColorsValue.colorDFDFDF,
                          ),
                        ),
                      ),
                      Dimens.boxHeight30,
                      ElevatedButton(
                        onPressed: () {
                          if (productKey.currentState!.validate()) {
                            Get.back();
                            postAddToCart(item.product?.id ?? "", item.quantity,
                                index, "inCart");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            double.maxFinite,
                            Dimens.fourtyFive,
                          ),
                          backgroundColor: ColorsValue.appColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Dimens.twelve,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'save'.tr,
                            style: Styles.whiteColorW80016,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  final ScrollController scrollCartController = ScrollController();
  List<CartItemProductElement> cartList = [];
  CartItemData? cartsItemModel = CartItemData();

  int pageCartCount = 1;
  bool isCartLastPage = false;
  bool isCartLoading = false;

  bool isLoader = true;

  double cartTotal = 0;
  var client = http.Client();

  Future<void> postCartList(int pageKey) async {
    if (pageKey == 1) {
      pageCartCount = 1;
    }
    var response = await client.post(
      Uri.parse("https://api.krishnaornaments.com/user/cart"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "page": pageKey,
        "limit": 10,
      }),
    );
    var cartItemModel = cartItemModelFromJson(response.body);
    cartsItemModel = null;
    if (cartItemModel.data != null) {
      cartsItemModel = cartItemModel.data;
      if (pageKey == 1) {
        isCartLastPage = false;
        cartList.clear();
      }
      if ((cartItemModel.data?.products?.length ?? 0) < 10) {
        isCartLastPage = true;
        cartList.addAll(cartItemModel.data?.products ?? []);
      } else {
        pageCartCount++;
        cartList.addAll(cartItemModel.data?.products ?? []);
      }
      if (pageKey == 1) {
        if (scrollCartController.positions.isNotEmpty) {
          scrollCartController.jumpTo(0);
        }
      }
      isLoader = false;
    } else {
      isLoader = false;
      Utility.errorMessage(cartItemModel.message.toString());
    }
    update();
  }

  Future<void> postCartProductRemove(CartItemProductElement item) async {
    var response = await client.post(
      Uri.parse("https://api.krishnaornaments.com/user/cart/remove"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "productId": item.product?.id ?? "",
      }),
    );
    if (response.body.isNotEmpty) {
      Utility.closeDialog();
      cartList.remove(item);
    } else {
      Utility.closeDialog();
      Utility.errorMessage(jsonDecode(response.body ?? "")['Message']);
    }
    update();
  }

  TextEditingController searchController = TextEditingController();
  TextEditingController minWeightController = TextEditingController();
  TextEditingController maxWeightController = TextEditingController();

  int radioValue = 1;
  int radioSortValue = -1;

  int radioFilterValue = -1;
  int radioFilterSortValue = -1;
  bool isFilter = false;

  int filterValue = 0;
  double minValue = 0;
  double maxValue = 1000;
  double startValue = 0;
  double endValue = 1000;

  int pageViewAllCount = 1;
  bool isViewAllLastPage = false;
  bool isViewAllLoading = false;

  String productTypeViewAll = "";
  String category = "";
  String categoryName = "";

  final ScrollController scrollViewAllController = ScrollController();
  List<ProductsDoc> viewAllDocList = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;

  void onScroll() {
    if (scrollViewAllController.position.pixels ==
            scrollViewAllController.position.maxScrollExtent &&
        hasMore) {
      postArrivalViewAll();
    }
  }

  Future<void> postArrivalViewAll() async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    // Fetch data from the API
    var response = await shoppingCartPresenter.postAllProduct(
      page: currentPage,
      limit: 10,
      search: searchController.text,
      category: category,
      min: minWeightController.text.isNotEmpty &&
              minWeightController.text.isNotEmpty
          ? double.parse(minWeightController.text)
          : startValue,
      max: minWeightController.text.isNotEmpty &&
              minWeightController.text.isNotEmpty
          ? double.parse(maxWeightController.text)
          : double.parse(endValue.toStringAsFixed(2)),
      productType: productTypeViewAll.toLowerCase(),
      sortField: radioValue == 0 || radioValue == 1 ? "name" : "weight",
      sortOption: radioSortValue,
      isStock: radioFilterValue == 0
          ? true
          : radioFilterValue == 1
              ? false
              : null,
      isLoading: false,
    );
    if (response?.data != null) {
      viewAllDocList.addAll(response?.data?.docs ?? []);
      currentPage++;
      isLoading = false;

      // Check if there are more items to load
      if (response?.data?.docs?.isEmpty ?? false) {
        hasMore = false;
      }
      update();
    } else {
      isLoading = false;
      update();
      throw Exception('Failed to load data');
    }
  }

  Future<void> postAddToCart(
      String productId, int quantity, int index, String productType) async {
    // var response = await shoppingCartPresenter.postAddToCart(
    //   productId: productId,
    //   quantity: quantity,
    //   description: productDesController.text,
    //   isLoading: false,
    // );
    var response = await client.post(
      Uri.parse("https://api.krishnaornaments.com/user/cart/save"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "productId": productId,
        "quantity": quantity,
        "description": "",
      }),
    );
    if (response?.statusCode == 200) {
      if (productType.contains("inCart")) {
        cartList[index].description = productDesController.text;
      } else {
        viewAllDocList[index].inCart = true;
        Utility.snacBar(
            "Product added in cart successfully...!", ColorsValue.appColor);
      }
    } else {
      Utility.errorMessage(
          jsonDecode(response?.body.toString() ?? "")['Message']);
    }
    update();
  }

  Future<void> postOrderCreate() async {
    var response = await shoppingCartPresenter.postOrderCreate(
      cartId: cartsItemModel?.id ?? '',
      products: cartList.map(
        (e) {
          return Product(
            productId: e.product?.id ?? "",
            quantity: e.quantity,
            description: e.description,
          );
        },
      ).toList(),
      main_description: finalDesController.text,
      isLoading: false,
    );
    if (response?.statusCode == 200) {
      RouteManagement.goToBottomBarView();
      postCartList(1);
    } else {
      Utility.errorMessage(jsonDecode(response.toString())['Data']['Message']);
    }
    update();
  }

  Future<void> postWishlistAddRemove(
      String productsDoc, int index, bool isRemove) async {
    var response = await client.post(
      Uri.parse("https://api.krishnaornaments.com/user/wishlist/add"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "productid": productsDoc,
      }),
    );
    if (response.body.isNotEmpty) {
      Utility.closeLoader();
      if (viewAllDocList[index].wishlistStatus ?? false) {
        viewAllDocList[index].wishlistStatus = false;
      } else {
        viewAllDocList[index].wishlistStatus = true;
      }
      update();
    } else {
      Utility.closeLoader();
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  String subCategoryId = "";
  String subCategoryName = "";
  GetCategoriesData? getCategoriesData = GetCategoriesData();

  List<GetCategoriesData> categoriesList = [];

  Future<void> getAllCategories() async {
    var response = await shoppingCartPresenter.getAllCategories(
      categoriesId: subCategoryId,
      isSubCategories: true,
      isLoading: true,
    );
    categoriesList.clear();
    if (response?.data != null) {
      categoriesList.addAll(response?.data ?? []);
    }
    update();
  }
}
