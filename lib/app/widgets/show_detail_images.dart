import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ShowImageDetail extends StatelessWidget {
  const ShowImageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      initState: (state) {
        final controller = Get.find<ProfileController>();
        controller.productList = Get.arguments[0];
        controller.currentPage = Get.arguments[1];
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () => Get.back(),
            title: 'Product Detail'.tr,
            actions: [
              GestureDetector(
                onTap: () async {
                  if (await Utility.imagePermissionCheack(context)) {
                    Utility.downloadImage(
                        controller.productList[controller.currentPage].image ??
                            '');
                  }
                },
                child: Padding(
                  padding: Dimens.edgeInsetsRight16,
                  child: SvgPicture.asset(
                    AssetConstants.ic_download,
                    height: Dimens.thirtyFive,
                    width: Dimens.thirtyFive,
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      PhotoViewGallery(
                        pageOptions: [
                          buildForImage(
                            controller
                                .productList[controller.currentPage].image,
                          ),
                        ],
                        backgroundDecoration:
                            BoxDecoration(color: Colors.transparent),
                        scrollPhysics: NeverScrollableScrollPhysics(),
                      ),

                      // Back Arrow
                      Positioned(
                        left: 16,
                        top: MediaQuery.of(context).size.height / 2 - 24,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, size: 30),
                          onPressed: controller.currentPage > 0
                              ? () {
                                  controller.currentPage--;
                                  controller.update();
                                }
                              : null,
                        ),
                      ),

                      // Forward Arrow
                      Positioned(
                        right: 16,
                        top: MediaQuery.of(context).size.height / 2 - 24,
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward_ios, size: 30),
                          onPressed: controller.currentPage <
                                  controller.productList.length - 1
                              ? () {
                                  controller.currentPage++;
                                  controller.update();
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),

                // Product Info & Cart
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Details
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller
                                  .productList[controller.currentPage].name ??
                              "CZ Kadies Ring (LR16278)"),
                          Text(controller.productList[controller.currentPage]
                                  .category?.name ??
                              "Ladies Ring"),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: controller
                                            .productList[controller.currentPage]
                                            .inCart ??
                                        false
                                    ? null
                                    : () {
                                        if (Get.find<HomeController>()
                                                .productArrivalDocList[
                                                    controller.currentPage]
                                                .cartQuantity
                                                .toDouble() >
                                            1) {
                                          Get.find<HomeController>()
                                              .productArrivalDocList[
                                                  controller.currentPage]
                                              .cartQuantity--;
                                        }
                                        controller.update();
                                      },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.ten),
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
                              Text(controller
                                  .productList[controller.currentPage]
                                  .cartQuantity
                                  .toString()),
                              Dimens.boxWidth10,
                              GestureDetector(
                                onTap: controller
                                            .productList[controller.currentPage]
                                            .inCart ??
                                        false
                                    ? null
                                    : () {
                                        Get.find<HomeController>()
                                            .productArrivalDocList[
                                                controller.currentPage]
                                            .cartQuantity++;
                                        controller.update();
                                      },
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
                        ],
                      ),

                      // Add to Cart Section
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              "Weight: ${controller.productList[controller.currentPage].weight} gm"),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Get.closeCurrentSnackbar();
                              if (controller.productList[controller.currentPage]
                                      .inCart ??
                                  false) {
                                Get.find<BottomBarController>()
                                    .tabController
                                    ?.animateTo(2);
                              } else {
                                if (controller
                                        .productList[controller.currentPage]
                                        .cartQuantity
                                        .toDouble() >
                                    0) {
                                  Get.find<HomeController>().postAddToCart(
                                      controller
                                              .productList[
                                                  controller.currentPage]
                                              .id ??
                                          "",
                                      controller
                                          .productList[controller.currentPage]
                                          .cartQuantity,
                                      controller.currentPage,
                                      Get.arguments[2]);
                                } else {
                                  Utility.errorMessage("Please add one item.");
                                }
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: Dimens.edgeInsets15_0_15_0,
                              height: Dimens.twentySeven,
                              decoration: BoxDecoration(
                                color: ColorsValue.colorEDC97D,
                                borderRadius:
                                    BorderRadius.circular(Dimens.four),
                              ),
                              child: Text(
                                (controller.productList[controller.currentPage]
                                            .inCart ??
                                        false)
                                    ? 'Item In Cart'
                                    : 'Add To Cart',
                                style: Styles.colorFBF7F350010,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  PhotoViewGalleryPageOptions buildForImage(String? image) {
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(image ?? ''),
      initialScale: PhotoViewComputedScale.contained * 1,
      minScale: PhotoViewComputedScale.contained * 1,
    );
  }
}
