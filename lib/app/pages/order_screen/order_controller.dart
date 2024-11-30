import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/domain/models/models.dart';

class OrderController extends GetxController {
  OrderController(this.orderPresenter);

  final OrderPresenter orderPresenter;

  var list = ["fsdfds", "dfsdsf", "DSFdsfds"];

  PagingController<int, GetOrderHistoryDoc> orderPagingController =
      PagingController(firstPageKey: 1);

  List<GetOrderHistoryDoc> orderListModel = [];
  int galleryLimit = 10;

  Future<void> postOrderHistory(int pageKey) async {
    var response = await orderPresenter.postOrderHistory(
      page: pageKey,
      limit: galleryLimit,
      isLoading: false,
    );
    if (response != null) {
      if (pageKey == 1) {
        orderListModel.clear();
      }
      orderListModel = response.data?.docs ?? [];

      final isLastPage = orderListModel.length < galleryLimit;
      if (isLastPage) {
        orderPagingController.appendLastPage(orderListModel);
      } else {
        var nextPageKey = pageKey + 1;
        orderPagingController.appendPage(orderListModel, nextPageKey);
      }
      update();
    }
  }

  GetOneOrderData? getOneOrderData = GetOneOrderData();

  String orderId = "";

  Future<void> postOrderGetOne() async {
    var response = await orderPresenter.postOrderGetOne(
      orderId: orderId,
      isLoading: false,
    );
    getOneOrderData = null;
    if (response != null) {
      getOneOrderData = response.data;
      update();
    }
  }

  GetOneBagData? getOneBagData = GetOneBagData();
  String? bugId;

  Future<void> postGetOnebag() async {
    var response = await orderPresenter.postGetOnebag(
      orderId: orderId,
      bagId: bugId ?? "",
      isLoading: false,
    );
    getOneBagData = null;
    if (response != null) {
      getOneBagData = response.data;
      update();
    }
  }
}
