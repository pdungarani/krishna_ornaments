// coverage:ignore-file
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/pages/pages.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(
      () => BottomBarController(
        Get.put(
          BottomBarPresenter(
            Get.put(
              BottomBarUseCases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );
    Get.put<HomeController>(
      HomeController(
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
    Get.put<CategoryController>(
      CategoryController(
        Get.put(
          CategoryPresenter(
            Get.put(
              CategoryUseCases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );
    Get.put<ProfileController>(
      ProfileController(
        Get.put(
          ProfilePresenter(
            Get.put(
              ProfileUseCases(
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
