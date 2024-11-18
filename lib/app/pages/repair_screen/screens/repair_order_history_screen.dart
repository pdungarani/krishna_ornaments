import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';

class RepairOrderHistoryScreen extends StatelessWidget {
  const RepairOrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepairController>(initState: (state) {
      var controller = Get.find<RepairController>();
    }, builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.appBg,
        appBar: AppBarWidget(
          onTapBack: () {},
          title: 'repair_order_history'.tr,
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: Dimens.edgeInsets20_00_20_00,
              child: InkWell(
                onTap: () {
                  RouteManagement.goToRepairOrderDetalisScreen("");
                },
                child: Container(
                  margin: Dimens.edgeInsetsBottom10,
                  padding: Dimens.edgeInsets10,
                  decoration: BoxDecoration(
                    color: ColorsValue.colorEEEAEA,
                    borderRadius: BorderRadius.circular(
                      Dimens.five,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: Dimens.edgeInsets10,
                            height: Dimens.fifty,
                            width: Dimens.fifty,
                            decoration: BoxDecoration(
                              color: ColorsValue.appColor,
                              borderRadius: BorderRadius.circular(
                                Dimens.five,
                              ),
                            ),
                            child: SvgPicture.asset(
                              AssetConstants.ic_repair,
                            ),
                          ),
                          Dimens.boxWidth10,
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'order_date'.tr,
                                      style: Styles.grey94A3B850014,
                                    ),
                                    Text(
                                      "03, August, 2023",
                                      style: Styles.color212121W50014,
                                    )
                                  ],
                                ),
                                Dimens.boxHeight5,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'bag_number'.tr,
                                      style: Styles.grey94A3B850014,
                                    ),
                                    Text(
                                      "03",
                                      style: Styles.color212121W50014,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Dimens.boxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'order_id'.tr,
                            style: Styles.grey94A3B850014,
                          ),
                          Text(
                            "R1",
                            style: Styles.color212121W50014,
                          )
                        ],
                      ),
                      Dimens.boxHeight5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'status'.tr,
                            style: Styles.grey94A3B850014,
                          ),
                          Text(
                            "Completed",
                            style: Styles.appColor70014,
                          )
                        ],
                      ),
                      Dimens.boxHeight5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'delivery_date'.tr,
                            style: Styles.grey94A3B850014,
                          ),
                          Text(
                            "02/09/2024",
                            style: Styles.color21212150014,
                          )
                        ],
                      ),
                      Dimens.boxHeight5,
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: Styles.colorA7A7A750010,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
