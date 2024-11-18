import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class RepairBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepairController>(
      () => RepairController(
        Get.put(
          RepairPresenter(
            Get.put(
              RepairUsecases(
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
