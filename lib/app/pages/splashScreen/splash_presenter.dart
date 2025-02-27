import 'package:krishna_ornaments/domain/domain.dart';

class SplashPresenter {
  SplashPresenter(this.splashUseCases);

  final SplashUseCases splashUseCases;

  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async =>
      await splashUseCases.getProfile(
        isLoading: isLoading,
      );
}
