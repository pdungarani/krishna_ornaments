import 'package:krishna_ornaments/domain/domain.dart';

class BottomBarPresenter {
  BottomBarPresenter(this.bottomBarUseCases);

  final BottomBarUseCases bottomBarUseCases;

  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async =>
      await bottomBarUseCases.getProfile(
        isLoading: isLoading,
      );
}
