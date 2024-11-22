import 'package:flutter/widgets.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);

  final HomePresenter homePresenter;
  late PageController controller;

  int itemCounter = 0;

  onIncrement() {
    itemCounter++;
    update();
  }

  onDecrement() {
    if (itemCounter > 0) {
      itemCounter--;
    }
    update();
  }

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
}
