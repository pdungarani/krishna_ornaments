import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/pages/bottomBarScreen/bottombar_page.dart';

class BottomBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  BottomBarController(this.bottomBarPresenter);

  final BottomBarPresenter bottomBarPresenter;

  int selectedIndex = 0;
  TabController? tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 5);
    tabController?.addListener(update);
    super.onInit();
  }
}
