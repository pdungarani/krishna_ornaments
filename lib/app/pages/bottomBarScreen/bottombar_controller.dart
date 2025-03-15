import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/domain/domain.dart';
import 'package:krishna_ornaments/domain/services/firebase_api.dart';

class BottomBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  BottomBarController(this.bottomBarPresenter);

  final BottomBarPresenter bottomBarPresenter;

  int selectedIndex = 0;
  TabController? tabController;

  @override
  void onInit() {
    super.onInit();
    SocketConnection.initSocket();
    FirebaseApi().initNotification();
    tabController = TabController(vsync: this, length: 5);
    tabController?.addListener(update);
    if (Utility.isLoginOrNot() && Platform.isIOS) {
      getProfile();
    }
  }

  GetProfileData? getProfileModel;

  Future<void> getProfile() async {
    var response = await bottomBarPresenter.getProfile(
      isLoading: true,
    );
    getProfileModel = null;
    if (response != null) {
      getProfileModel = response.data;
      Get.find<Repository>()
          .saveValue(LocalKeys.chanelId, getProfileModel?.channelid ?? "");
      update();
    }
  }
}
