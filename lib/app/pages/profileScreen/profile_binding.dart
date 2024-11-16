import 'package:get/get.dart';
import 'package:krishna_ornaments/app/pages/profileScreen/profile_page.dart';
import 'package:krishna_ornaments/domain/usecases/usecases.dart';

// coverage:ignore-file
/// A list of bindings which will be used in the route of [SplashView].
class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
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
