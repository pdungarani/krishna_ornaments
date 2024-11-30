import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      initState: (state) {
        var controller = Get.find<OrderController>();
        controller.orderPagingController
            .addPageRequestListener((pageKey) async {
          await controller.postOrderHistory(pageKey);
        });
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'order_history'.tr,
          ),
          body: PagedListView<int, GetOrderHistoryDoc>(
            pagingController: controller.orderPagingController,
            builderDelegate: PagedChildBuilderDelegate<GetOrderHistoryDoc>(
              noItemsFoundIndicatorBuilder: (context) {
                return Center(
                  child: Text(
                    "Order history data empty.",
                    style: Styles.black221W70010,
                  ),
                );
              },
              itemBuilder: (context, item, index) {
                return Padding(
                  padding: Dimens.edgeInsets20_03_20_03,
                  child: GestureDetector(
                    onTap: () {
                      RouteManagement.goToOrderDetalisScreen(item.id ?? '');
                    },
                    child: Container(
                      margin: Dimens.edgeInsetsBottom10,
                      decoration: BoxDecoration(
                        color: ColorsValue.colorEEEAEA,
                        borderRadius: BorderRadius.circular(
                          Dimens.five,
                        ),
                      ),
                      child: Padding(
                        padding: Dimens.edgeInsets10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${"total_quentity".tr} ${item.totalQuantity}",
                                  style: Styles.black221W70018,
                                ),
                                Text(
                                  item.orderTracking?.capitalize ?? '',
                                  style: item.orderTracking == "pending"
                                      ? Styles.colorFFA50070012
                                      : item.orderTracking == "completed"
                                          ? Styles.greenW70012
                                          : Styles.redColorGuj70010,
                                )
                              ],
                            ),
                            Dimens.boxHeight5,
                            Text(
                              "${"total_bag".tr} ${item.totalBags}",
                              style: Styles.color212121W70012,
                            ),
                            Dimens.boxHeight5,
                            Text(
                              item.mainDescription ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.colorA7A7A750016,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
