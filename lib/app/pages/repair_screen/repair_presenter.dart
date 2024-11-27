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
}
