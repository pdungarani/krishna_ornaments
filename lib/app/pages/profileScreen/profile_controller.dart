import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class ProfileController extends GetxController {
  ProfileController(this.profilePresenter);

  final ProfilePresenter profilePresenter;

  GetProfileData? getProfileModel;

  Future<void> getProfile() async {
    var response = await profilePresenter.getProfile(
      isLoading: true,
    );
    getProfileModel = null;
    if (response != null) {
      getProfileModel = response.data;
      update();
    } else {
      Utility.errorMessage(response?.message ?? "");
    }
  }
}
