import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';
import 'package:krishna_ornaments/app/widgets/custom_button.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCartController>(
      initState: (state) async {
        var controller = Get.find<ShoppingCartController>();
        await controller.postCartList(1);
        controller.scrollCartController.addListener(() async {
          if (controller.scrollCartController.position.pixels ==
              controller.scrollCartController.position.maxScrollExtent) {
            if (controller.isCartLoading == false) {
              controller.isCartLoading = true;
              controller.update();
              if (controller.isCartLastPage == false) {
                await controller.postCartList(controller.pageCartCount);
              }
              controller.isCartLoading = false;
              controller.update();
            }
          }
        });
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {},
            title: 'cart'.tr,
            isVisible: false,
          ),
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  height: Dimens.fourtyFive,
                  text: 'Checkout',
                  style: Styles.whiteW80014,
                  onTap: () {
                    controller.showFinalDescription(context);
                  },
                ),
                Dimens.boxHeight10,
              ],
            ),
          ),
          body: controller.cartList.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListView.builder(
                        itemCount: controller.cartList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = controller.cartList[index];
                          return Padding(
                            padding: Dimens.edgeInsets20_10_20_10,
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
                                    Container(
                                      height: Dimens.eighty,
                                      width: Dimens.eighty,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Dimens.five,
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          Dimens.five,
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: item.product?.image ?? "",
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
                                    Dimens.boxWidth10,
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Diamond Ring',
                                                    style: Styles
                                                        .color212121W70012,
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Text(
                                                    "${'weight'.tr} : ${item.product?.weight}",
                                                    style: Styles
                                                        .color9C9C9CW50010,
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller
                                                      .postCartProductRemove(
                                                          item);
                                                },
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AssetConstants.ic_delete,
                                                    ),
                                                    Dimens.boxWidth10,
                                                    Text(
                                                      'remove'.tr,
                                                      style: Styles
                                                          .color212121W70010,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (controller.cartList[index]
                                                          .quantity >
                                                      0) {
                                                    controller.cartList[index]
                                                        .quantity--;
                                                  }
                                                  controller.update();
                                                },
                                                child: SvgPicture.asset(
                                                  AssetConstants.ic_minus,
                                                ),
                                              ),
                                              Dimens.boxWidth10,
                                              Text(
                                                "0",
                                                style: Styles.appColor70010,
                                              ),
                                              Dimens.boxWidth10,
                                              InkWell(
                                                onTap: () {
                                                  controller.cartList[index]
                                                      .quantity++;
                                                  controller.update();
                                                },
                                                child: SvgPicture.asset(
                                                  AssetConstants.ic_plus,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          if (item.description?.isEmpty ??
                                              false) ...[
                                            InkWell(
                                              onTap: () {
                                                controller
                                                    .showProductDescription(
                                                        context, item, index);
                                              },
                                              child: Container(
                                                width: double.maxFinite,
                                                padding:
                                                    Dimens.edgeInsets6_4_6_4,
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorsValue.colorD9D9D9,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Dimens.five,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Add Remark',
                                                  style:
                                                      Styles.colorA7A7A750010,
                                                ),
                                              ),
                                            )
                                          ] else ...[
                                            Text(
                                              item.description ?? "",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: Styles.colorA7A7A750010,
                                            ),
                                          ]
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              : Center(),
        );
      },
    );

    //           Dimens.boxHeight10,
    //           Padding(
    //             padding: Dimens.edgeInsets20_0_20_0,
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   'total_product'.tr,
    //                   style: Styles.colorA7A7A750016,
    //                 ),
    //                 Dimens.boxWidth10,
    //                 Text(
    //                   '02'.tr,
    //                   style: Styles.colorA7A7A750016,
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Dimens.boxHeight10,
    //           Padding(
    //             padding: Dimens.edgeInsets20_0_20_0,
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   'total_weight'.tr,
    //                   style: Styles.colorA7A7A750016,
    //                 ),
    //                 Dimens.boxWidth10,
    //                 Text(
    //                   '02'.tr,
    //                   style: Styles.colorA7A7A750016,
    //                 ),
    //               ],
    //             Dimens.boxWidth10,
    //             Text(
    //               controller.getallCartItem?.totalQuantity.toString() ?? '',
    //               style: Styles.colorA7A7A750016,
    //             ),
    //           )
    //         ],
    //       ),
    //     );
    //   });
    //       Dimens.boxHeight10,
    //       Padding(
    //         padding: Dimens.edgeInsets20_0_20_0,
    //         child: Row(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               'total_weight'.tr,
    //               style: Styles.colorA7A7A750016,
    //             ),
    //             Dimens.boxWidth10,
    //             Text(
    //               controller.getallCartItem.toString(),
    //               style: Styles.colorA7A7A750016,
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
    // });
  }
}