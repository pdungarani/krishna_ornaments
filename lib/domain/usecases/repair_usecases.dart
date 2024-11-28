import 'package:krishna_ornaments/domain/domain.dart';

class RepairUsecases {
  RepairUsecases(this.repository);

  final Repository repository;

  Future<RepairOrderHistoryModel?> repairOrderList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await repository.repairOrderList(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<GetOneRepairOrderModel?> getOneRepairOrder({
    bool isLoading = false,
    required String repairingOrderId,
  }) async =>
      await repository.getOneRepairOrder(
        repairingOrderId: repairingOrderId,
        isLoading: isLoading,
      );

  Future<RepairOrderUploadImageApi?> repairOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await repository.repairOrderImage(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<SampleOrderImage?> sampleOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await repository.sampleOrderImage(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel?> postRepairOrder({
    bool isLoading = false,
    required String file,
    required String description,
  }) async =>
      await repository.postRepairOrder(
        file: file,
        description: description,
        isLoading: isLoading,
      );
}
