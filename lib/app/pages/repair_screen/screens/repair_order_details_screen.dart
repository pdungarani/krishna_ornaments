import 'package:another_stepper/another_stepper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
                    controller.getOneRepairOrderData?.description ??
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: Styles.colorA7A7A750012,
                  ),
                  Dimens.boxHeight20,
                  Text(
                    'date_order'.tr,
                    style: Styles.color21212170014,
                  ),
                  Dimens.boxHeight5,
                  Text(
                    DateFormat('dd, MMM yyyy').format(
                        controller.getOneRepairOrderData?.createdAt ??
                            DateTime.now()),
                    style: Styles.colorA7A7A750012,
                  ),
                  Dimens.boxHeight20,
                  Text(
                    'bag_number'.tr,
                    style: Styles.color21212170014,
                  ),
                  Dimens.boxHeight5,
                  Text(
                    controller.getOneRepairOrderData?.bagNumber.toString() ??
                        '0',
                    style: Styles.colorA7A7A750012,
                  ),
                  Dimens.boxHeight30,
                  Text(
                    'order_status'.tr,
                    style: Styles.color212121W70024,
                  ),
                  AnotherStepper(
                    stepperList: [
                      StepperData(
                        title: StepperText(
                          "order_pending".tr,
                          textStyle: Styles.grey94A3B860012,
                        ),
                        subtitle: StepperText(
                          "03 Sep 2023",
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
                          "order_pending".tr,
                          textStyle: Styles.grey94A3B860012,
                        ),
                        subtitle: StepperText(
                          "03 Sep 2023",
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
                    ],
                    activeIndex: 1,
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
