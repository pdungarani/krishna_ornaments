import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCartController>(initState: (state) {
    }, builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorsValue.appBg,
        appBar: AppBarWidget(
          onTapBack: () {},
          title: 'cart'.tr,
        ),
        body: ListView(
          children: [
            Wrap(
              children: controller.list.map(
                (e) {
                  return Padding(
                    padding: Dimens.edgeInsets20_10_20_10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorsValue.colorEEEAEA,
                        borderRadius: BorderRadius.circular(
                          Dimens.five,
                        ),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     color: Colors.black12,
                        //     blurRadius: 5,
                        //     offset: Offset(0, 0),
                        //   ),
                        // ],
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
                                  imageUrl: "",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                            style: Styles.color212121W70012,
                                          ),
                                          Dimens.boxHeight5,
                                          Text(
                                            "${'weight'.tr} : ",
                                            style: Styles.color9C9C9CW50010,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AssetConstants.ic_delete,
                                          ),
                                          Dimens.boxWidth10,
                                          Text(
                                            'remove'.tr,
                                            style: Styles.color212121W70010,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Dimens.boxHeight5,
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AssetConstants.ic_minus,
                                      ),
                                      Dimens.boxWidth10,
                                      Text(
                                        "0",
                                        style: Styles.appColor70010,
                                      ),
                                      Dimens.boxWidth10,
                                      SvgPicture.asset(
                                        AssetConstants.ic_plus,
                                      ),
                                    ],
                                  ),
                                  Dimens.boxHeight5,
                                  InkWell(
                                    onTap: () {
                                      controller.showFinalDescription(context);
                                    },
                                    child: Text(
                                      'add_remark'.tr,
                                      style: Styles.appColor70010,
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
                },
              ).toList(),
            ),
            Dimens.boxHeight10,
            Padding(
              padding: Dimens.edgeInsets20_0_20_0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'total_product'.tr,
                    style: Styles.colorA7A7A750016,
                  ),
                  Dimens.boxWidth10,
                  Text(
                    '02'.tr,
                    style: Styles.colorA7A7A750016,
                  ),
                ],
              ),
            ),
            Dimens.boxHeight10,
            Padding(
              padding: Dimens.edgeInsets20_0_20_0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'total_weight'.tr,
                    style: Styles.colorA7A7A750016,
                  ),
                  Dimens.boxWidth10,
                  Text(
                    '02'.tr,
                    style: Styles.colorA7A7A750016,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
