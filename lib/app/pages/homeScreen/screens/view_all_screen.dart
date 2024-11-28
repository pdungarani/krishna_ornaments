import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';
import 'package:krishna_ornaments/app/widgets/custom_button.dart';
import 'package:krishna_ornaments/app/widgets/custom_product.dart';

class ViewAllProductScreen extends StatelessWidget {
  const ViewAllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {
        // var controller = Get.find<ProductDetailController>();
        // controller.productType = Get.arguments ?? "";
        // controller.isLoading = true;
        // if (controller.productType == "Best Seller") {
        //   await controller.postBestSellerList(1);
        //   controller.scrollBestSellerController.addListener(() async {
        //     if (controller.scrollBestSellerController.position.pixels ==
        //         controller
        //             .scrollBestSellerController.position.maxScrollExtent) {
        //       if (controller.isBestSellerLoading == false) {
        //         controller.isBestSellerLoading = true;
        //         controller.update();
        //         if (controller.isBestSellerLastPage == false) {
        //           await controller.postBestSellerList(controller.pageCount);
        //         }
        //         controller.isBestSellerLoading = false;
        //         controller.update();
        //       }
        //     }
        //   });
        // } else {
        //   await controller.postComboList(1);
        //   controller.scrollBestSellerController.addListener(() async {
        //     if (controller.scrollBestSellerController.position.pixels ==
        //         controller
        //             .scrollBestSellerController.position.maxScrollExtent) {
        //       if (controller.isBestSellerLoading == false) {
        //         controller.isBestSellerLoading = true;
        //         controller.update();
        //         if (controller.isBestSellerLastPage == false) {
        //           await controller.postComboList(controller.pageCount);
        //         }
        //         controller.isBestSellerLoading = false;
        //         controller.update();
        //       }
        //     }
        //   });
        // }
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: controller.productType,
          ),
          body: Padding(
            padding: Dimens.edgeInsets20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(Dimens.twenty),
                                      topLeft: Radius.circular(Dimens.twenty),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: Dimens.edgeInsets20_20_20_0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'sort_by'.tr,
                                              style: Styles.txtBlackColorW70018,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: SvgPicture.asset(
                                                'AssetConstants.ic_close',
                                                height: Dimens.twentyFour,
                                                width: Dimens.twentyFour,
                                                colorFilter: ColorFilter.mode(
                                                  ColorsValue.txtBlackColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Dimens.boxHeight12,
                                      Divider(
                                        height: Dimens.one,
                                        color: ColorsValue.lightCBD5E1,
                                      ),
                                      Dimens.boxHeight12,
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: Dimens.twenty,
                                          right: Dimens.twenty,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RadioListTile<int>(
                                              dense: false,
                                              visualDensity:
                                                  const VisualDensity(
                                                      horizontal: VisualDensity
                                                          .minimumDensity,
                                                      vertical: VisualDensity
                                                          .minimumDensity),
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              contentPadding: EdgeInsets.zero,
                                              activeColor:
                                                  ColorsValue.txtBlackColor,
                                              title: Text(
                                                'dis_low_to_high'.tr,
                                                style:
                                                    Styles.txtBlackColorW60014,
                                              ),
                                              value: 0,
                                              groupValue: controller.radioValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  controller.radioValue =
                                                      value!;
                                                  controller.radioSortValue =
                                                      "DLTH";
                                                });
                                              },
                                            ),
                                            RadioListTile<int>(
                                              visualDensity:
                                                  const VisualDensity(
                                                      horizontal: VisualDensity
                                                          .minimumDensity,
                                                      vertical: VisualDensity
                                                          .minimumDensity),
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              contentPadding: EdgeInsets.zero,
                                              activeColor:
                                                  ColorsValue.txtBlackColor,
                                              title: Text(
                                                'dis_high_to_law'.tr,
                                                style:
                                                    Styles.txtBlackColorW60014,
                                              ),
                                              value: 1,
                                              groupValue: controller.radioValue,
                                              onChanged: (int? value) {
                                                setState(() {
                                                  controller.radioValue =
                                                      value!;
                                                  controller.radioSortValue =
                                                      "DHTL";
                                                });
                                              },
                                            ),
                                            RadioListTile<int>(
                                              visualDensity:
                                                  const VisualDensity(
                                                      horizontal: VisualDensity
                                                          .minimumDensity,
                                                      vertical: VisualDensity
                                                          .minimumDensity),
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              contentPadding: EdgeInsets.zero,
                                              activeColor:
                                                  ColorsValue.txtBlackColor,
                                              title: Text(
                                                'price_low_to_high'.tr,
                                                style:
                                                    Styles.txtBlackColorW60014,
                                              ),
                                              value: 2,
                                              groupValue: controller.radioValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  controller.radioValue =
                                                      value!;
                                                  controller.radioSortValue =
                                                      "PLTH";
                                                });
                                              },
                                            ),
                                            RadioListTile<int>(
                                              visualDensity:
                                                  const VisualDensity(
                                                      horizontal: VisualDensity
                                                          .minimumDensity,
                                                      vertical: VisualDensity
                                                          .minimumDensity),
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              contentPadding: EdgeInsets.zero,
                                              activeColor:
                                                  ColorsValue.txtBlackColor,
                                              title: Text(
                                                'price_high_to_law'.tr,
                                                style:
                                                    Styles.txtBlackColorW60014,
                                              ),
                                              value: 3,
                                              groupValue: controller.radioValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  controller.radioValue =
                                                      value!;
                                                  controller.radioSortValue =
                                                      "PHTL";
                                                });
                                              },
                                            ),
                                            Dimens.boxHeight20,
                                            CustomButton(
                                              onTap: () async {
                                                Get.back();
                                                controller.isLoading = true;
                                                controller.update();
                                                // if (controller.productType ==
                                                //     "Best Seller") {
                                                //   await controller
                                                //       .postBestSellerList(1);
                                                // } else {
                                                //   await controller
                                                //       .postComboList(1);
                                                // }
                                              },
                                              text: 'apply'.tr,
                                              style: Styles.whiteColorW80016,
                                              backgroundColor:
                                                  ColorsValue.appColor,
                                            ),
                                            Dimens.boxHeight20,
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: Dimens.edgeInsets14_0_14_0,
                        height: Dimens.thirty,
                        alignment: AlignmentDirectional.centerStart,
                        decoration: BoxDecoration(
                          color: ColorsValue.lightE2E8F0,
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.black64748B,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'sort_by'.tr,
                              style: Styles.txtBlackColorW60014,
                            ),
                            Dimens.boxWidth10,
                            SvgPicture.asset(
                              'AssetConstants.ic_down_arrow',
                            )
                          ],
                        ),
                      ),
                    ),
                    Dimens.boxWidth12,
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => StatefulBuilder(
                            builder: (context, setState) => Container(
                              height: Get.height * 0.78,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Dimens.twenty),
                                  topRight: Radius.circular(Dimens.twenty),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: Dimens.edgeInsets20_20_20_0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Filter'.tr,
                                          style: Styles.txtBlackColorW70018,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: SvgPicture.asset(
                                            'AssetConstants.ic_close',
                                            height: Dimens.twentyFour,
                                            width: Dimens.twentyFour,
                                            colorFilter: ColorFilter.mode(
                                              ColorsValue.txtBlackColor,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Dimens.boxHeight12,
                                  Divider(
                                    height: Dimens.one,
                                    color: ColorsValue.lightCBD5E1,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child: Container(
                                              padding: Dimens.edgeInsetsTopt10,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.60,
                                              decoration: BoxDecoration(
                                                color: ColorsValue.lightF3F4F6,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      Dimens.six),
                                                  bottomRight: Radius.circular(
                                                      Dimens.six),
                                                ),
                                              ),
                                              child: Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                children: controller.filterType
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  var index = e.key;
                                                  return InkWell(
                                                    onTap: () {
                                                      controller.filterValue =
                                                          index;
                                                      setState(() {});
                                                    },
                                                    child: Padding(
                                                      padding: Dimens
                                                          .edgeInsetsBottom10,
                                                      child: Container(
                                                        padding: Dimens
                                                            .edgeInsetsLeft20,
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        height:
                                                            Dimens.thirtySix,
                                                        width: double.maxFinite,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: controller
                                                                      .filterValue ==
                                                                  index
                                                              ? ColorsValue
                                                                  .whiteColor
                                                              : Colors
                                                                  .transparent,
                                                        ),
                                                        child: Text(
                                                          controller.filterType[
                                                              index],
                                                          style: Styles
                                                              .txtBlackColorW60016,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: ListView.builder(
                                              itemCount: 1,
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                switch (
                                                    controller.filterValue) {
                                                  case 0:
                                                    return Padding(
                                                      padding:
                                                          Dimens.edgeInsets16,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'price_range'.tr,
                                                            style: Styles
                                                                .txtBlackColorW70014,
                                                          ),
                                                          Dimens.boxHeight12,
                                                          Text(
                                                            "${Utility.coutryCurrency}${controller.startValue.toStringAsFixed(0)}   -   ${Utility.coutryCurrency}${controller.endValue.toStringAsFixed(0)}",
                                                            style: Styles
                                                                .txtBlackColorW50014,
                                                          ),
                                                          Dimens.boxHeight10,
                                                          RangeSlider(
                                                            min: controller
                                                                .minValue,
                                                            max: controller
                                                                .maxValue,
                                                            activeColor:
                                                                ColorsValue
                                                                    .appColor,
                                                            inactiveColor:
                                                                ColorsValue
                                                                    .lightE2E8F0,
                                                            values: RangeValues(
                                                              controller
                                                                  .startValue,
                                                              controller
                                                                  .endValue,
                                                            ),
                                                            onChanged:
                                                                (newValues) {
                                                              controller
                                                                      .startValue =
                                                                  newValues
                                                                      .start;
                                                              controller
                                                                      .endValue =
                                                                  newValues.end;
                                                              controller
                                                                  .update();
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  case 1:
                                                    return Padding(
                                                      padding:
                                                          Dimens.edgeInsets16,
                                                      child: Column(
                                                        children: [
                                                          RadioListTile<int>(
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            dense: true,
                                                            visualDensity: const VisualDensity(
                                                                horizontal:
                                                                    VisualDensity
                                                                        .minimumDensity,
                                                                vertical:
                                                                    VisualDensity
                                                                        .minimumDensity),
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .leading,
                                                            activeColor:
                                                                ColorsValue
                                                                    .txtBlackColor,
                                                            title: Row(
                                                              children: [
                                                                Text(
                                                                  "4",
                                                                  style: Styles
                                                                      .black010101W40014,
                                                                ),
                                                                Dimens
                                                                    .boxWidth2,
                                                                SvgPicture
                                                                    .asset(
                                                                  'AssetConstants.ic_rating_star',
                                                                ),
                                                                Dimens
                                                                    .boxWidth2,
                                                                Text(
                                                                  " ${'above'.tr}",
                                                                  style: Styles
                                                                      .black010101W40014,
                                                                )
                                                              ],
                                                            ),
                                                            value: 4,
                                                            groupValue: controller
                                                                .filterRating,
                                                            onChanged: (value) {
                                                              setState(
                                                                () {
                                                                  controller
                                                                      .filterRating = 4;
                                                                },
                                                              );
                                                            },
                                                          ),
                                                          RadioListTile<int>(
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            dense: true,
                                                            visualDensity: const VisualDensity(
                                                                horizontal:
                                                                    VisualDensity
                                                                        .minimumDensity,
                                                                vertical:
                                                                    VisualDensity
                                                                        .minimumDensity),
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .leading,
                                                            activeColor:
                                                                ColorsValue
                                                                    .txtBlackColor,
                                                            title: Row(
                                                              children: [
                                                                Text(
                                                                  "3",
                                                                  style: Styles
                                                                      .black010101W40014,
                                                                ),
                                                                Dimens
                                                                    .boxWidth2,
                                                                SvgPicture
                                                                    .asset(
                                                                  "AssetConstants.ic_rating_star",
                                                                ),
                                                                Dimens
                                                                    .boxWidth2,
                                                                Text(
                                                                  " ${'above'.tr}",
                                                                  style: Styles
                                                                      .black010101W40014,
                                                                )
                                                              ],
                                                            ),
                                                            value: 3,
                                                            groupValue: controller
                                                                .filterRating,
                                                            onChanged: (value) {
                                                              setState(
                                                                () {
                                                                  controller
                                                                      .filterRating = 3;
                                                                },
                                                              );
                                                            },
                                                          ),
                                                          RadioListTile<int>(
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            dense: true,
                                                            visualDensity: const VisualDensity(
                                                                horizontal:
                                                                    VisualDensity
                                                                        .minimumDensity,
                                                                vertical:
                                                                    VisualDensity
                                                                        .minimumDensity),
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .leading,
                                                            activeColor:
                                                                ColorsValue
                                                                    .txtBlackColor,
                                                            title: Row(
                                                              children: [
                                                                Text(
                                                                  "2",
                                                                  style: Styles
                                                                      .black010101W40014,
                                                                ),
                                                                Dimens
                                                                    .boxWidth2,
                                                                SvgPicture
                                                                    .asset(
                                                                  'AssetConstants.ic_rating_star',
                                                                ),
                                                                Dimens
                                                                    .boxWidth2,
                                                                Text(
                                                                  " ${'above'.tr}",
                                                                  style: Styles
                                                                      .black010101W40014,
                                                                )
                                                              ],
                                                            ),
                                                            value: 2,
                                                            groupValue: controller
                                                                .filterRating,
                                                            onChanged: (value) {
                                                              setState(
                                                                () {
                                                                  controller
                                                                      .filterRating = 2;
                                                                },
                                                              );
                                                            },
                                                          ),
                                                          RadioListTile<int>(
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            dense: true,
                                                            visualDensity: const VisualDensity(
                                                                horizontal:
                                                                    VisualDensity
                                                                        .minimumDensity,
                                                                vertical:
                                                                    VisualDensity
                                                                        .minimumDensity),
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .leading,
                                                            activeColor:
                                                                ColorsValue
                                                                    .txtBlackColor,
                                                            title: Row(
                                                              children: [
                                                                Text(
                                                                  "1",
                                                                  style: Styles
                                                                      .black010101W40014,
                                                                ),
                                                                Dimens
                                                                    .boxWidth2,
                                                                SvgPicture
                                                                    .asset(
                                                                  'AssetConstants.ic_rating_star',
                                                                ),
                                                                Dimens
                                                                    .boxWidth2,
                                                                Text(
                                                                  " ${'above'.tr}",
                                                                  style: Styles
                                                                      .black010101W40014,
                                                                )
                                                              ],
                                                            ),
                                                            value: 1,
                                                            groupValue: controller
                                                                .filterRating,
                                                            onChanged: (value) {
                                                              setState(
                                                                () {
                                                                  controller
                                                                      .filterRating = 1;
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                }
                                                return null;
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Divider(
                                        height: 1,
                                        color: ColorsValue.greyAAA,
                                      ),
                                      Dimens.boxHeight10,
                                      Padding(
                                        padding: Dimens.edgeInsets20_0_20_0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () async {
                                                  controller.isFilter = false;
                                                  controller.filterRating = 5;
                                                  controller.isLoading = true;

                                                  controller.update();
                                                  Get.back();
                                                  // if (controller.productType ==
                                                  //     "Best Seller") {
                                                  //   await controller
                                                  //       .postBestSellerList(1);
                                                  // } else {
                                                  //   await controller
                                                  //       .postComboList(1);
                                                  // }
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: Dimens.fifty,
                                                  width: double.maxFinite,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ColorsValue.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimens.ten,
                                                    ),
                                                    border: Border.all(
                                                      color:
                                                          ColorsValue.appColor,
                                                      width: Dimens.one,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'clear_filters'.tr,
                                                    style:
                                                        Styles.appColorW50012,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Dimens.boxWidth23,
                                            Expanded(
                                              child: InkWell(
                                                onTap: () async {
                                                  Get.back();
                                                  controller.isFilter = true;
                                                  controller.isLoading = true;
                                                  controller.update();
                                                  // if (controller.productType ==
                                                  //     "Best Seller") {
                                                  //   await controller
                                                  //       .postBestSellerList(1);
                                                  // } else {
                                                  //   await controller
                                                  //       .postComboList(1);
                                                  // }
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: Dimens.fifty,
                                                  width: double.maxFinite,
                                                  decoration: BoxDecoration(
                                                    color: ColorsValue.appColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimens.ten,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'apply'.tr,
                                                    style:
                                                        Styles.whiteColorW60012,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: Dimens.edgeInsets14_0_14_0,
                        height: Dimens.thirty,
                        alignment: AlignmentDirectional.centerStart,
                        decoration: BoxDecoration(
                          color: controller.isFilter
                              ? ColorsValue.lightE2E8F0
                              : ColorsValue.whiteColor,
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.black64748B,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Filter'.tr,
                              style: Styles.txtBlackColorW60014,
                            ),
                            Dimens.boxWidth10,
                            SvgPicture.asset(
                              'AssetConstants.ic_filter',
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight20,
                !controller.isLoading
                    ? Expanded(
                        child: controller.productList.isNotEmpty
                            ? RefreshIndicator(
                                onRefresh: () => Future.sync(
                                  () async {
                                    // if (controller.productType ==
                                    //     "Best Seller") {
                                    //   return await controller
                                    //       .postBestSellerList(1);
                                    // } else {
                                    //   return await controller.postComboList(1);
                                    // }
                                  },
                                ),
                                child: GridView.builder(
                                  controller:
                                      controller.scrollBestSellerController,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: Dimens.fifteen,
                                    crossAxisSpacing: Dimens.ten,
                                    mainAxisExtent: Dimens.twoHundredSixty,
                                  ),
                                  itemCount: controller.productList.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Center();
                                    // return InkWell(
                                    //   onTap: () {
                                    //     // RouteManagement.goToProductDetailScreen(
                                    //     //     item.id ?? "", "Best Seller");
                                    //   },
                                    //   child: CustomProductView(
                                    //     productName: 'productName',
                                    //     imageUrl:
                                    //         'assets/images/Mask group.png',
                                    //     categoryName: 'categoryName',
                                    //     inWishList: false,
                                    //     onTap: () {},
                                    //     addFavorite: () {},
                                    //   ),
                                    // );
                                  },
                                ),
                              )
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'AssetConstants.ic_filter_empty',
                                    ),
                                    Dimens.boxHeight10,
                                    Text(
                                      'search_empty_txt'.tr,
                                      style: Styles.black64748BW50016,
                                    )
                                  ],
                                ),
                              ),
                      )
                    : Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorsValue.appColor,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
