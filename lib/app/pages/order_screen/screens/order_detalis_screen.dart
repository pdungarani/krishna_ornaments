import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';

class OrderDetalisScreen extends StatelessWidget {
  const OrderDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {},
            title: 'order_details'.tr,
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: Dimens.edgeInsets20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "final_des".tr,
                      style: Styles.color21212170014,
                    ),
                    Dimens.boxHeight5,
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.colorA7A7A750012,
                    ),
                    Dimens.boxHeight20,
                    Wrap(
                      children: controller.list.map((e) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${"total_quentity".tr} 750",
                                              style: Styles.color212121W90010,
                                            ),
                                            Dimens.boxHeight5,
                                            Text(
                                              "${"order_date".tr} 120",
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
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList() ??
                          [],
                    ),
                    Dimens.boxHeight20,
                    Text(
                      "${"total_bag".tr} 001",
                      style: Styles.appColor70014,
                    ),
                    Dimens.boxHeight12,
                    Wrap(
                      children: controller.list.map(
                            (e) {
                              return Container(
                                margin: Dimens.edgeInsetsBottom10,
                                padding: Dimens.edgeInsets20_00_20_00,
                                decoration: BoxDecoration(
                                  color: ColorsValue.colorEEEAEA,
                                  borderRadius: BorderRadius.circular(
                                    Dimens.six,
                                  ),
                                ),
                                child: ListTile(
                                  onTap: () {
                                    RouteManagement.goToBagDetailScreen();
                                  },
                                  contentPadding: Dimens.edgeInsets0,
                                  title: Text(
                                    "Bag 01",
                                    style: Styles.color21212160014,
                                  ),
                                  trailing: SvgPicture.asset(
                                    AssetConstants.ic_right_arrow,
                                    colorFilter: const ColorFilter.mode(
                                      ColorsValue.blackColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList() ??
                          [],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}