import 'package:another_stepper/another_stepper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';

class RepairOrderDetalisScreen extends StatelessWidget {
  const RepairOrderDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepairController>(initState: (state) {
      var controller = Get.find<RepairController>();
      controller.getOneRepairOrder(repairingOrderId: Get.arguments);
    }, builder: (controller) {
      return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: controller.getOneRepairOrderData?.orderNumber ?? "A1",
          ),
          body: Padding(
            padding: Dimens.edgeInsets20,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'uploaded_photo'.tr,
                    style: Styles.color21212170014,
                  ),
                  Dimens.boxHeight5,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: Dimens.hundred,
                      width: Dimens.hundred,
                      decoration: BoxDecoration(
                        color: ColorsValue.appColor,
                        borderRadius: BorderRadius.circular(
                          Dimens.five,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Dimens.five,
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              controller.getOneRepairOrderData?.file ?? '',
                          fit: BoxFit.cover,
                          maxWidthDiskCache: 300,
                          maxHeightDiskCache: 300,
                          height: Dimens.hundred,
                          width: Dimens.hundred,
                          placeholder: (context, url) {
                            return Image.asset(
                              AssetConstants.placeholder,
                              fit: BoxFit.cover,
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              AssetConstants.placeholder,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,
                  Text(
                    'description'.tr,
                    style: Styles.color21212170014,
                  ),
                  Dimens.boxHeight5,
                  Text(
                    controller.getOneRepairOrderData?.description ?? " -ß ",
                    style: Styles.colorA7A7A750012,
                  ),
                  Dimens.boxHeight20,
                  Text(
                    'date_order'.tr,
                    style: Styles.color21212170014,
                  ),
                  Dimens.boxHeight5,
                  Text(
                    controller.getOneRepairOrderData?.createdAt?.dateFormate ??
                        '',
                    style: Styles.colorA7A7A750012,
                  ),
                  Dimens.boxHeight30,
                  Text(
                    'order_status'.tr,
                    style: Styles.color212121W70024,
                  ),
                  AnotherStepper(
                    //  pending
                    // processing
                    // completed
                    // cancelled
                    stepperList:
                        controller.getOneRepairOrderData?.orderTracking ==
                                "pending"
                            ? [
                                StepperData(
                                  title: StepperText(
                                    "order_pending".tr,
                                    textStyle: Styles.grey94A3B860012,
                                  ),
                                  subtitle: StepperText(
                                    controller.getOneRepairOrderData?.createdAt
                                            ?.dateFormate ??
                                        " - ",
                                    textStyle: Styles.appColor70012,
                                  ),
                                  iconWidget: Container(
                                    height: Dimens.fourtyEight,
                                    width: Dimens.fourtyEight,
                                    padding: Dimens.edgeInsets8,
                                    decoration: BoxDecoration(
                                      color: ColorsValue.appColor,
                                      borderRadius: BorderRadius.circular(
                                        Dimens.hundred,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.done,
                                      color: ColorsValue.whiteColor,
                                    ),
                                  ),
                                ),
                                StepperData(
                                  title: StepperText(
                                    "Processing Order".tr,
                                    textStyle: Styles.grey94A3B860012,
                                  ),
                                  subtitle: StepperText(
                                    controller.getOneRepairOrderData?.createdAt
                                            ?.dateFormate ??
                                        " - ",
                                    textStyle: Styles.appColor70012,
                                  ),
                                  iconWidget: Container(
                                    height: Dimens.fourtyEight,
                                    width: Dimens.fourtyEight,
                                    padding: Dimens.edgeInsets8,
                                    decoration: BoxDecoration(
                                      color: ColorsValue.grey94A3B8,
                                      borderRadius: BorderRadius.circular(
                                        Dimens.hundred,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.done,
                                      color: ColorsValue.whiteColor,
                                    ),
                                  ),
                                ),
                                StepperData(
                                  title: StepperText(
                                    "Completed Order".tr,
                                    textStyle: Styles.grey94A3B860012,
                                  ),
                                  subtitle: StepperText(
                                    controller.getOneRepairOrderData?.createdAt
                                            ?.dateFormate ??
                                        " - ",
                                    textStyle: Styles.appColor70012,
                                  ),
                                  iconWidget: Container(
                                    height: Dimens.fourtyEight,
                                    width: Dimens.fourtyEight,
                                    padding: Dimens.edgeInsets8,
                                    decoration: BoxDecoration(
                                      color: ColorsValue.grey94A3B8,
                                      borderRadius: BorderRadius.circular(
                                        Dimens.hundred,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.done,
                                      color: ColorsValue.whiteColor,
                                    ),
                                  ),
                                ),
                                StepperData(
                                  title: StepperText(
                                    "cancelled Order".tr,
                                    textStyle: Styles.grey94A3B860012,
                                  ),
                                  subtitle: StepperText(
                                    controller.getOneRepairOrderData?.createdAt
                                            ?.dateFormate ??
                                        " - ",
                                    textStyle: Styles.appColor70012,
                                  ),
                                  iconWidget: Container(
                                    height: Dimens.fourtyEight,
                                    width: Dimens.fourtyEight,
                                    padding: Dimens.edgeInsets8,
                                    decoration: BoxDecoration(
                                      color: ColorsValue.grey94A3B8,
                                      borderRadius: BorderRadius.circular(
                                        Dimens.hundred,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.done,
                                      color: ColorsValue.whiteColor,
                                    ),
                                  ),
                                ),
                              ]
                            : controller.getOneRepairOrderData?.orderTracking ==
                                    "processing"
                                ? [
                                    StepperData(
                                      title: StepperText(
                                        "order_pending".tr,
                                        textStyle: Styles.grey94A3B860012,
                                      ),
                                      subtitle: StepperText(
                                        controller.getOneRepairOrderData
                                                ?.createdAt?.dateFormate ??
                                            " - ",
                                        textStyle: Styles.appColor70012,
                                      ),
                                      iconWidget: Container(
                                        height: Dimens.fourtyEight,
                                        width: Dimens.fourtyEight,
                                        padding: Dimens.edgeInsets8,
                                        decoration: BoxDecoration(
                                          color: ColorsValue.appColor,
                                          borderRadius: BorderRadius.circular(
                                            Dimens.hundred,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.done,
                                          color: ColorsValue.whiteColor,
                                        ),
                                      ),
                                    ),
                                    StepperData(
                                      title: StepperText(
                                        "Processing Order".tr,
                                        textStyle: Styles.grey94A3B860012,
                                      ),
                                      subtitle: StepperText(
                                        controller.getOneRepairOrderData
                                                ?.createdAt?.dateFormate ??
                                            " - ",
                                        textStyle: Styles.appColor70012,
                                      ),
                                      iconWidget: Container(
                                        height: Dimens.fourtyEight,
                                        width: Dimens.fourtyEight,
                                        padding: Dimens.edgeInsets8,
                                        decoration: BoxDecoration(
                                          color: ColorsValue.appColor,
                                          borderRadius: BorderRadius.circular(
                                            Dimens.hundred,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.done,
                                          color: ColorsValue.greyAAAAAA,
                                        ),
                                      ),
                                    ),
                                    StepperData(
                                      title: StepperText(
                                        "Completed Order".tr,
                                        textStyle: Styles.grey94A3B860012,
                                      ),
                                      subtitle: StepperText(
                                        controller.getOneRepairOrderData
                                                ?.createdAt?.dateFormate ??
                                            " - ",
                                        textStyle: Styles.appColor70012,
                                      ),
                                      iconWidget: Container(
                                        height: Dimens.fourtyEight,
                                        width: Dimens.fourtyEight,
                                        padding: Dimens.edgeInsets8,
                                        decoration: BoxDecoration(
                                          color: ColorsValue.grey94A3B8,
                                          borderRadius: BorderRadius.circular(
                                            Dimens.hundred,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.done,
                                          color: ColorsValue.whiteColor,
                                        ),
                                      ),
                                    ),
                                    StepperData(
                                      title: StepperText(
                                        "cancelled Order".tr,
                                        textStyle: Styles.grey94A3B860012,
                                      ),
                                      subtitle: StepperText(
                                        controller.getOneRepairOrderData
                                                ?.createdAt?.dateFormate ??
                                            " - ",
                                        textStyle: Styles.appColor70012,
                                      ),
                                      iconWidget: Container(
                                        height: Dimens.fourtyEight,
                                        width: Dimens.fourtyEight,
                                        padding: Dimens.edgeInsets8,
                                        decoration: BoxDecoration(
                                          color: ColorsValue.grey94A3B8,
                                          borderRadius: BorderRadius.circular(
                                            Dimens.hundred,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.done,
                                          color: ColorsValue.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ]
                                : [],
                    activeIndex: 5,
                    stepperDirection: Axis.vertical,
                    iconWidth: Dimens.fourty,
                    iconHeight: Dimens.fourty,
                    activeBarColor: ColorsValue.appColor,
                    inActiveBarColor: ColorsValue.whiteColor,
                    verticalGap: Dimens.thirty,
                    barThickness: Dimens.five,
                  )
                ],
              ),
            ),
          ));
    });
  }
}
