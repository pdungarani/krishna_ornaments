import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class SplashController extends GetxController {
  SplashController(this.splashPresenter);

  final SplashPresenter splashPresenter;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: 5),
    ).then(
      (value) {
        final result =
            Get.find<Repository>().getStringValue(LocalKeys.authToken).isEmpty;
        if (result) {
          RouteManagement.goToLoginView();
        } else {
          RouteManagement.goToBottomBarView();
        }
      },
    );
  }
}
