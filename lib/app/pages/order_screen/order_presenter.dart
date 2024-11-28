import 'package:krishna_ornaments/domain/domain.dart';

class OrderPresenter {
  OrderPresenter(this.orderUsecases);

  final OrderUsecases orderUsecases;

 Future<GetOrderHistoryModel?> postOrderHistory({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await orderUsecases.postOrderHistory(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<GetOneOrderModel?> postOrderGetOne({
    bool isLoading = false,
    required String orderId,
  }) async =>
      await orderUsecases.postOrderGetOne(
        orderId: orderId,
        isLoading: isLoading,
      );
}
