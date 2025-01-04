import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      initState: (state) {
        var controller = Get.find<OrderController>();

        controller.postOrderHistory();
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
          body: Wrap(
            direction: Axis.vertical,
            children: controller.orderListModel.map(
              (e) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: e.products?.length,
                    itemBuilder: (context, index) {
                      var item = e.products?[index];
                      return Padding(
                        padding: Dimens.edgeInsetsBottom10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorsValue.colorEEEAEA,
                            borderRadius: BorderRadius.circular(
                              Dimens.five,
                            ),
                          ),
                          child: Padding(
                            padding: Dimens.edgeInsets10,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    RouteManagement.goToShowFullScareenImage(
                                        item?.productImage ?? '', "Image");
                                  },
                                  child: Container(
                                    height: Dimens.eighty,
                                    width: Dimens.eighty,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.five,
                                      ),
                                      color: ColorsValue.whiteColor,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.five,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: item?.productImage ?? "",
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) {
                                          return Image.asset(
                                              AssetConstants.placeholder,
                                              fit: BoxFit.cover);
                                        },
                                        errorWidget: (context, url, error) {
                                          return Image.asset(
                                              AssetConstants.placeholder,
                                              fit: BoxFit.cover);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Dimens.boxWidth10,
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${"total_quentity".tr} ${item?.quantity}",
                                        style: Styles.color212121W90010,
                                      ),
                                      Dimens.boxHeight5,
                                      Text(
                                        "${"order_date".tr} 12/02/2024",
                                        style: Styles.appColor70010,
                                      ),
                                      Dimens.boxHeight5,
                                      Text(
                                        item?.description ?? '',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: Styles.colorA7A7A750010,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
