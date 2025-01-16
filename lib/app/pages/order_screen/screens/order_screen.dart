import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/routes_management.dart';
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
          // body: ListView.builder(
          //   padding: Dimens.edgeInsets20,
          //   itemCount: controller.orderListModel.length,
          //   itemBuilder: (context, index) {
          //     var item = controller.orderListModel[index];
          //     return GestureDetector(
          //       onTap: () {},
          //       child: Padding(
          //         padding: Dimens.edgeInsetsBottom10,
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: ColorsValue.colorEEEAEA,
          //             borderRadius: BorderRadius.circular(
          //               Dimens.five,
          //             ),
          //           ),
          //           child: Padding(
          //             padding: Dimens.edgeInsets10,
          //             child: Row(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 InkWell(
          //                   onTap: () {
          //                     RouteManagement.goToShowFullScareenImage(
          //                         item?.productImage ?? '', "Image");
          //                   },
          //                   child: Container(
          //                     height: Dimens.eighty,
          //                     width: Dimens.eighty,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(
          //                         Dimens.five,
          //                       ),
          //                       color: ColorsValue.whiteColor,
          //                     ),
          //                     child: ClipRRect(
          //                       borderRadius: BorderRadius.circular(
          //                         Dimens.five,
          //                       ),
          //                       child: CachedNetworkImage(
          //                         imageUrl: item?.productImage ?? "",
          //                         fit: BoxFit.cover,
          //                         placeholder: (context, url) {
          //                           return Image.asset(
          //                               AssetConstants.placeholder,
          //                               fit: BoxFit.cover);
          //                         },
          //                         errorWidget: (context, url, error) {
          //                           return Image.asset(
          //                               AssetConstants.placeholder,
          //                               fit: BoxFit.cover);
          //                         },
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 Dimens.boxWidth10,
          //                 Flexible(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         "${"total_quentity".tr} ${item.quantity}",
          //                         style: Styles.color212121W90010,
          //                       ),
          //                       Dimens.boxHeight5,
          //                       Text(
          //                         "${"order_date".tr} 12/02/2024",
          //                         style: Styles.appColor70010,
          //                       ),
          //                       Dimens.boxHeight5,
          //                       Text(
          //                         item.description ?? '',
          //                         maxLines: 3,
          //                         overflow: TextOverflow.ellipsis,
          //                         style: Styles.colorA7A7A750010,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),

          body: controller.orderListModel.isEmpty
              ? const Center(
                  child: Text("No Data Found"),
                )
              : Wrap(
                  children: controller.orderListModel.map(
                    (e) {
                      return Padding(
                        padding:
                            Dimens.edgeInsets20_0_20_0.copyWith(bottom: 10),
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
                                        e.productImage ?? '', "Image");
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
                                        imageUrl: e.productImage ?? "",
                                        fit: BoxFit.cover,
                                        height: Dimens.eighty,
                                        width: Dimens.eighty,
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${"total_quentity".tr} ${e.quantity}",
                                            style: Styles.color212121W90012,
                                          ),
                                          Text(
                                            Utility.capitalize(
                                                e.productOrderTracking ?? ""),
                                            style: e.productOrderTracking ==
                                                        "processing" ||
                                                    e.productOrderTracking ==
                                                        "pending"
                                                ? Styles.appColor70010
                                                : e.productOrderTracking ==
                                                        "Cancel"
                                                    ? Styles.redColorW70010
                                                    : Styles.greenW70010,
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                      Text(
                                        "${"order_date".tr} 12/02/2024",
                                        style: Styles.appColor70012,
                                      ),
                                      Dimens.boxHeight5,
                                      Flexible(
                                        child: Text(
                                          e.description ?? '',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: Styles.colorA7A7A750012,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );

                      // return Expanded(
                      //   child: ListView.builder(
                      //     // itemCount: e.products?.length,
                      //     shrinkWrap: true,

                      //     itemCount: 2,
                      //     itemBuilder: (context, index) {
                      //       var item = controller.orderListModel[index];
                      //       return Padding(
                      //         padding: Dimens.edgeInsetsBottom10,
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //             color: ColorsValue.colorEEEAEA,
                      //             borderRadius: BorderRadius.circular(
                      //               Dimens.five,
                      //             ),
                      //           ),
                      //           child: Padding(
                      //             padding: Dimens.edgeInsets10,
                      //             child: Row(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 InkWell(
                      //                   onTap: () {
                      //                     RouteManagement.goToShowFullScareenImage(
                      //                         item.productImage ?? '', "Image");
                      //                   },
                      //                   child: Container(
                      //                     height: Dimens.eighty,
                      //                     width: Dimens.eighty,
                      //                     decoration: BoxDecoration(
                      //                       borderRadius: BorderRadius.circular(
                      //                         Dimens.five,
                      //                       ),
                      //                       color: ColorsValue.whiteColor,
                      //                     ),
                      //                     child: ClipRRect(
                      //                       borderRadius: BorderRadius.circular(
                      //                         Dimens.five,
                      //                       ),
                      //                       child: CachedNetworkImage(
                      //                         imageUrl: item.productImage ?? "",
                      //                         fit: BoxFit.cover,
                      //                         placeholder: (context, url) {
                      //                           return Image.asset(
                      //                               AssetConstants.placeholder,
                      //                               fit: BoxFit.cover);
                      //                         },
                      //                         errorWidget: (context, url, error) {
                      //                           return Image.asset(
                      //                               AssetConstants.placeholder,
                      //                               fit: BoxFit.cover);
                      //                         },
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Dimens.boxWidth10,
                      //                 Flexible(
                      //                   child: Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       Text(
                      //                         "${"total_quentity".tr} ${item.quantity}",
                      //                         style: Styles.color212121W90010,
                      //                       ),
                      //                       Dimens.boxHeight5,
                      //                       Text(
                      //                         "${"order_date".tr} 12/02/2024",
                      //                         style: Styles.appColor70010,
                      //                       ),
                      //                       Dimens.boxHeight5,
                      //                       Text(
                      //                         item.description ?? '',
                      //                         maxLines: 3,
                      //                         overflow: TextOverflow.ellipsis,
                      //                         style: Styles.colorA7A7A750010,
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // );
                    },
                  ).toList(),
                ),
        );
      },
    );
  }
}
