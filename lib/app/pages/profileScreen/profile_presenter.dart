import 'package:krishna_ornaments/domain/domain.dart';

class ProfilePresenter {
  ProfilePresenter(this.profileUseCases);

  final ProfileUseCases profileUseCases;
  
  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async =>
      await profileUseCases.getProfile(
        isLoading: isLoading,
      );
}
