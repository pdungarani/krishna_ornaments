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
}
