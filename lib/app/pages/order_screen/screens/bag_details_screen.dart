import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';

class BagDetailScreen extends StatelessWidget {
  const BagDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
            backgroundColor: ColorsValue.appBg,
            appBar: AppBarWidget(
              onTapBack: () {},
              title: 'Bag 01',
            ),
            body: Wrap(
              children: controller.list.map(
                    (e) {
                      return Padding(
                        padding: Dimens.edgeInsets20_10_20_10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimens.five,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                          "Ring Description",
                                          style: Styles.color21212170014,
                                        ),
                                        Dimens.boxHeight5,
                                        Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                          style: Styles.colorA7A7A750012,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight10,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ring_total_quantity'.tr,
                                          style: Styles.colorA7A7A770012,
                                        ),
                                        Dimens.boxHeight10,
                                        Container(
                                          width: double.infinity,
                                          padding: Dimens.edgeInsets12,
                                          decoration: BoxDecoration(
                                            color: ColorsValue.black333,
                                            borderRadius: BorderRadius.circular(
                                              Dimens.six,
                                            ),
                                          ),
                                          child: Text(
                                            '400',
                                            style: Styles.whiteW60012,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Dimens.boxWidth10,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ring_total_quantity'.tr,
                                          style: Styles.colorA7A7A770012,
                                        ),
                                        Dimens.boxHeight10,
                                        Container(
                                          width: double.infinity,
                                          padding: Dimens.edgeInsets12,
                                          decoration: BoxDecoration(
                                            color: ColorsValue.black333,
                                            borderRadius: BorderRadius.circular(
                                              Dimens.six,
                                            ),
                                          ),
                                          child: Text(
                                            '400',
                                            style: Styles.whiteW60012,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Dimens.boxHeight20,
                              Divider(
                                height: Dimens.one,
                                color: ColorsValue.colorD9D9D9,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList() ??
                  [],
            ));
      },
    );
  }
}
