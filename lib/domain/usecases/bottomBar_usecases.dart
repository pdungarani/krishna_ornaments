import 'package:krishna_ornaments/domain/domain.dart';

class BottomBarUseCases {
  BottomBarUseCases(this.repository);

  final Repository repository;

  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async =>
      await repository.getProfile(
        isLoading: isLoading,
      );
}
