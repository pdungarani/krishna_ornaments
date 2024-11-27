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
        initState: (state) {},
        builder: (controller) {
          return Scaffold(
              backgroundColor: ColorsValue.appBg,
              appBar: AppBarWidget(
                onTapBack: () {
                  Get.back();
                },
                title: 'order_history'.tr,
              ),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: Dimens.edgeInsets20_03_20_03,
                    child: InkWell(
                      onTap: () {
                        RouteManagement.goToOrderDetalisScreen();
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${"total_quentity".tr} 12",
                                    style: Styles.black221W70010,
                                  ),
                                  Text(
                                    "Pending",
                                    style: Styles.appColor70010,
                                  )
                                ],
                              ),
                              Dimens.boxHeight5,
                              Text(
                                "${"total_bag".tr} 07",
                                style: Styles.appColor70010,
                              ),
                              Dimens.boxHeight5,
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.colorA7A7A750010,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
        });
  }
}
