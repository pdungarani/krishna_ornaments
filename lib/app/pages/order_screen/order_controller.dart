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

  int galleryLimit = 10;

  // Future<void> postOrderHistory() async {
  //   var response = await orderPresenter.postOrderHistory(
  //     page: 1,
  //     limit: galleryLimit,
  //     isLoading: false,
  //   );

  //   // orderListModel.clear();
  //   if (response != null) {
  //     getOrderHistoryDetail = response.data!.docs![0];
  //     // orderListModel1 = orderListModel[0];
  //     update();
  //   }
  // }

  List<GetOrderHistoryProduct> orderListModel = [];
  GetOrderHistoryDoc? getOrderHistoryDoc;

  Future<void> postOrderHistory() async {
    var response = await orderPresenter.postOrderHistory(
      page: 1,
      limit: galleryLimit,
      isLoading: false,
    );
    orderListModel.clear();
    if (response != null) {
      print(response.data?.docs?[0].products?.length);
      getOrderHistoryDoc = response.data?.docs![0];
      orderListModel.addAll(response.data?.docs?.first.products ?? []);

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
