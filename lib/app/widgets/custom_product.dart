import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/pages/pages.dart';
import 'package:krishna_ornaments/app/theme/colors_value.dart';
import 'package:krishna_ornaments/app/theme/dimens.dart';
import 'package:krishna_ornaments/app/theme/styles.dart';

// ignore: must_be_immutable
class CustomProductView extends StatefulWidget {
  CustomProductView({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.categoryName,
    required this.productGrossAmount,
    required this.productPrice,
    required this.productRatting,
    required this.inWishList,
    this.isHorizontal = false,
    required this.onTap,
    required this.addFavorite,
    this.height,
  });
  String productName;
  double? height;
  String categoryName;
  String productPrice;
  String productGrossAmount;
  String productRatting;
  String imageUrl;
  bool inWishList;
  bool isHorizontal;
  void Function()? onTap;
  void Function()? addFavorite;

  @override
  State<CustomProductView> createState() => _CustomProductViewState();
}

class _CustomProductViewState extends State<CustomProductView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(left: widget.isHorizontal ? 0 : 0),
          child: InkWell(
            onTap: widget.onTap,
            child: Container(
              width: Get.width / 1.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color(0xffFFFFFF),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Color(0xffCCCCCC),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: widget.imageUrl,
                              fit: BoxFit.cover,
                              height: widget.isHorizontal
                                  ? Get.height / 5.50
                                  : Get.height / 5,
                              width: Get.width / 1.3,
                              placeholder: (context, url) => Image.asset(
                                'assets/images/Mask group.png',
                                fit: BoxFit.cover,
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/images/Mask group.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: widget.addFavorite,
                                  child: widget.inWishList
                                      ? SvgPicture.asset(
                                          'assets/icons/selected_heart.svg',
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/heart.svg',
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                softWrap: true,
                                maxLines: 1,
                                widget.productName,
                                style: Styles.black60016,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Dimens.boxHeight10,
                              Text(
                                "Weigth",
                                style: Styles.black70014,
                              ),
                              Text(
                                "3.9 gm",
                                style: Styles.black60012,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: controller.onIncrement,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorsValue.colorDFDFDF,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: ColorsValue.color9C9C9C,
                                      ),
                                    ),
                                  ),
                                ),
                                Dimens.boxWidth10,
                                Text(controller.itemCounter.toString()),
                                Dimens.boxWidth10,
                                InkWell(
                                  onTap: controller.onDecrement,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorsValue.colorDFDFDF,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.remove,
                                        size: 20,
                                        color: ColorsValue.color9C9C9C,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            InkWell(
                              onTap: widget.onTap,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorsValue.colorEDC97D,
                                  borderRadius:
                                      BorderRadius.circular(Dimens.twelve),
                                ),
                                child: Padding(
                                  padding: Dimens.edgeInsets10,
                                  child: Text(
                                    'Add To Cart',
                                    style: Styles.colorFBF7F350010,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
