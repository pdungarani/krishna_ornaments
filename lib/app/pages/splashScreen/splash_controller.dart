import 'dart:async';

import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart';

class SplashController extends GetxController {
  SplashController(this.splashPresenter);

  final SplashPresenter splashPresenter;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  String? appUrl;

  void startTimer() async {
    final result = await Utility.checker.checkUpdate();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      // if (Platform.isAndroid) {
      //   if (result.currentVersion != result.newVersion) {
      //     appUrl = result.appURL ?? "";
      //     RouteManagement.goToInAppUpdateScreen(result.appURL ?? "");
      //   } else {
      //     RouteManagement.goToBottomBarView();
      //   }
      // } else {
      RouteManagement.goToBottomBarView();
      // }
    });
    update();
  }
}
