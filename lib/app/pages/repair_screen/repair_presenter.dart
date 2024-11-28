import 'package:krishna_ornaments/domain/domain.dart';

class RepairPresenter {
  RepairPresenter(this.repairUsecases);

  final RepairUsecases repairUsecases;

  Future<RepairOrderHistoryModel?> repairOrderList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await repairUsecases.repairOrderList(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<GetOneRepairOrderModel?> getOneRepairOrder({
    bool isLoading = false,
    required String repairingOrderId,
  }) async =>
      await repairUsecases.getOneRepairOrder(
        repairingOrderId: repairingOrderId,
        isLoading: isLoading,
      );

  Future<RepairOrderUploadImageApi?> repairOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await repairUsecases.repairOrderImage(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<SampleOrderImage?> sampleOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await repairUsecases.sampleOrderImage(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel?> postRepairOrder({
    bool isLoading = false,
    required String file,
    required String description,
  }) async =>
      await repairUsecases.postRepairOrder(
        file: file,
        description: description,
        isLoading: isLoading,
      );
}
