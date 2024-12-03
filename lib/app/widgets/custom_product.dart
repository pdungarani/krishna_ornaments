import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';

// ignore: must_be_immutable
class CustomProductView extends StatefulWidget {
  CustomProductView({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.categoryName,
    required this.inWishList,
    required this.quantity,
    required this.weigth,
    this.isHorizontal = false,
    required this.onAddToCard,
    required this.addFavorite,
    required this.increment,
    required this.dincrement,
    required this.inCart,
    this.height,
  });
  String productName;
  double? height;
  String categoryName;
  String imageUrl;
  String weigth;
  int quantity;
  bool inWishList;
  bool isHorizontal;
  bool inCart;
  void Function()? onAddToCard;
  void Function()? addFavorite;
  void Function()? increment;
  void Function()? dincrement;

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
          child: Container(
            width: Get.width / 1.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimens.ten,
              ),
              color: ColorsValue.whiteColor,
            ),
            child: Padding(
              padding: Dimens.edgeInsets10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          color: ColorsValue.appBg,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: widget.imageUrl,
                            fit: BoxFit.cover,
                            height: widget.isHorizontal
                                ? Get.height / 5.50
                                : Get.height / 5,
                            width: Get.width / 1.3,
                            placeholder: (context, url) => Image.asset(
                              AssetConstants.placeholder,
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              AssetConstants.placeholder,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: Dimens.edgeInsets8,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: Dimens.thirty,
                            width: Dimens.thirty,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimens.fifty,
                              ),
                              color: ColorsValue.whiteColor,
                              border: Border.all(
                                width: Dimens.one,
                                color: ColorsValue.lightPrimaryColor,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: widget.addFavorite,
                                child: SvgPicture.asset(
                                  widget.inWishList
                                      ? AssetConstants.ic_fill_like
                                      : AssetConstants.ic_like,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight10,
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
                              widget.weigth,
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
                              GestureDetector(
                                onTap: widget.dincrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimens.ten,
                                    ),
                                    color: ColorsValue.colorDFDFDF,
                                  ),
                                  child: SvgPicture.asset(
                                    AssetConstants.minus,
                                    height: Dimens.twentyFour,
                                    width: Dimens.twentyFour,
                                  ),
                                ),
                              ),
                              Dimens.boxWidth10,
                              Text(
                                widget.quantity.toString(),
                              ),
                              Dimens.boxWidth10,
                              GestureDetector(
                                onTap: widget.increment,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorsValue.colorDFDFDF,
                                  ),
                                  child: SvgPicture.asset(
                                    AssetConstants.plus,
                                    height: Dimens.twentyFour,
                                    width: Dimens.twentyFour,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Dimens.boxHeight10,
                          InkWell(
                            onTap: widget.onAddToCard,
                            child: Container(
                              alignment: Alignment.center,
                              padding: Dimens.edgeInsets14_0_14_0,
                              height: Dimens.twentyFive,
                              decoration: BoxDecoration(
                                color: ColorsValue.colorEDC97D,
                                borderRadius: BorderRadius.circular(
                                  Dimens.four,
                                ),
                              ),
                              child: Text(
                                widget.inCart ? 'Item In Cart' : 'Add To Cart',
                                style: Styles.colorFBF7F350010,
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
        );
      },
    );
  }
}
