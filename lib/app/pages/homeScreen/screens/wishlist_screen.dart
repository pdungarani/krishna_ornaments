import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {
        var controller = Get.find<HomeController>();
        await controller.postWishlist(1);
        controller.scrollWishListController.addListener(() async {
          if (controller.scrollWishListController.position.pixels ==
              controller.scrollWishListController.position.maxScrollExtent) {
            if (controller.isWishListLoading == false) {
              controller.isWishListLoading = true;
              controller.update();
              if (controller.isWishListLastPage == false) {
                await controller.postWishlist(controller.pageWishCount);
              }
              controller.isWishListLoading = false;
              controller.update();
            }
          }
        });
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "wishlist".tr,
          ),
          body: RefreshIndicator(
              onRefresh: () => Future.sync(
                    () async {
                      await controller.postWishlist(1);
                    },
                  ),
              child: GridView.builder(
                controller: controller.scrollWishListController,
                padding: Dimens.edgeInsets20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: Dimens.fifteen,
                  crossAxisSpacing: Dimens.ten,
                  mainAxisExtent: Dimens.twoHundredNinety,
                ),
                itemCount: controller.wishlistList.length,
                itemBuilder: (context, index) {
                  var item = controller.wishlistList[index];
                  return controller.wishlistList.isNotEmpty
                      ? Container(
                          decoration: BoxDecoration(
                            color: ColorsValue.appColorLight,
                            borderRadius: BorderRadius.circular(
                              Dimens.six,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              Dimens.six,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.postWishlistAddRemove(
                                        item.productid?.id ?? "", index, true);
                                  },
                                  child: SizedBox(
                                    width: Dimens.hundredSixty,
                                    height: Dimens.hundredSixty,
                                    child: Stack(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: item.productid?.image ?? "",
                                          fit: BoxFit.cover,
                                          height: Dimens.hundredSixty,
                                          width: double.maxFinite,
                                          placeholder: (context, url) =>
                                              Image.asset(
                                            AssetConstants.placeholder,
                                            fit: BoxFit.cover,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            AssetConstants.placeholder,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: Container(
                                            margin: Dimens.edgeInsets10,
                                            height: Dimens.thirty,
                                            width: Dimens.thirty,
                                            decoration: BoxDecoration(
                                              color: ColorsValue.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimens.fiveHundred,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.close,
                                              color: ColorsValue.redColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: Dimens.edgeInsets10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.productid?.name ?? "",
                                        softWrap: true,
                                        maxLines: 1,
                                        style: Styles.black60016,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "Weigth ${item.productid?.weight.toString() ?? ""}",
                                        style: Styles.lightcccW50010,
                                      ),
                                      Dimens.boxHeight10,
                                      InkWell(
                                        onTap: () {
                                          controller.postAddToCart(
                                              item.productid?.id ?? "",
                                              1,
                                              index,
                                              "wishlist");
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: Dimens.edgeInsets14_0_14_0,
                                          height: Dimens.thirty,
                                          decoration: BoxDecoration(
                                            color: ColorsValue.colorEDC97D,
                                            borderRadius: BorderRadius.circular(
                                              Dimens.four,
                                            ),
                                          ),
                                          child: Text(
                                            item.inCart ?? false
                                                ? "Item In Cart"
                                                : 'Move To Cart',
                                            style: Styles.whiteW70014,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Center(
                          child: Text("WhisList is Empty!"),
                        );
                },
              )),
        );
      },
    );
  }
}
