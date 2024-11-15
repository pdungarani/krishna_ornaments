// coverage:ignore-file
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/pages/pages.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.put(
          HomePresenter(
            Get.put(
              HomeUseCases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );
  }
}
