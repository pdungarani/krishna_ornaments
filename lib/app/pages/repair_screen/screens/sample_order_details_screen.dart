import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/routes_management.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';

class SampleOrderDetailsScreen extends StatelessWidget {
  const SampleOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepairController>(initState: (state) {
      var controller = Get.find<RepairController>();
      controller.sampleOrderId = Get.arguments;
      controller.getOneSampleData = null;
      controller.getOneSample();
    }, builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.appBg,
        appBar: AppBarWidget(
          onTapBack: () {
            Get.back();
          },
          title: 'sample_order'.tr,
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
                SizedBox(
                  height: Dimens.hundred,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.getOneSampleData?.images?.length,
                    itemBuilder: (context, index) {
                      var item = controller.getOneSampleData?.images?[index];
                      return Padding(
                        padding: Dimens.edgeInsetsRight6,
                        child: InkWell(
                          onTap: () {
                            RouteManagement.goToShowFullScareenImage(
                                item?.path ?? "", "image");
                          },
                          child: Container(
                            height: Dimens.hundred,
                            width: Dimens.hundred,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimens.five,
                              ),
                              border: Border.all(
                                width: Dimens.one,
                                color: ColorsValue.black343434,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Dimens.five,
                              ),
                              child: CachedNetworkImage(
                                imageUrl: item?.path ?? '',
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
                      );
                    },
                  ),
                ),
                Dimens.boxHeight20,
                Text(
                  'description'.tr,
                  style: Styles.color21212170014,
                ),
                Dimens.boxHeight5,
                Text(
                  controller.getOneSampleData?.description ?? '',
                  style: Styles.colorA7A7A750012,
                ),
                Dimens.boxHeight20,
                Text(
                  'Product Quantity',
                  style: Styles.color21212170014,
                ),
                Dimens.boxHeight5,
                Text(
                  controller.getOneSampleData?.totalQuantity.toString() ?? '',
                  style: Styles.colorA7A7A750012,
                ),
                Dimens.boxHeight20,
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
        ),
      );
    });
  }
}
