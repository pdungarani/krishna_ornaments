import 'package:krishna_ornaments/domain/domain.dart';

class OrderUsecases {
  OrderUsecases(this.repository);

  final Repository repository;

  Future<GetOrderHistoryModel?> postOrderHistory({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await repository.postOrderHistory(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<GetOneOrderModel?> postOrderGetOne({
    bool isLoading = false,
    required String orderId,
  }) async =>
      await repository.postOrderGetOne(
        orderId: orderId,
        isLoading: isLoading,
      );
}
