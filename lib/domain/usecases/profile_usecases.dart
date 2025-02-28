import 'package:krishna_ornaments/domain/domain.dart';

class ProfileUseCases {
  ProfileUseCases(this.repository);

  final Repository repository;

  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async =>
      await repository.getProfile(
        isLoading: isLoading,
      );

  Future<UploadProfileModel?> postUploadProfile({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await repository.postUploadProfile(
        filePath: filePath,
        isLoading: isLoading,
      );

}
