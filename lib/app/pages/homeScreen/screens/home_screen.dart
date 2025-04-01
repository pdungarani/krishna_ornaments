import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/routes_management.dart';
import 'package:krishna_ornaments/app/widgets/custom_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {
        var controller = Get.find<HomeController>();
        if (Utility.isLoginOrNot()) {
          controller.postAllProduct();
          controller.postAllTrendingProduct(1);
        }
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.primaryColor,
          appBar: AppBar(
            backgroundColor: ColorsValue.primaryColor,
            title: Padding(
              padding: EdgeInsets.all(Dimens.five),
              child: Text(
                "Hi, ${controller.getProfileModel?.name ?? 'User'}",
                style: Styles.color01010160018,
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    RouteManagement.goToSearchScreen();
                  },
                  child: SvgPicture.asset(
                    AssetConstants.searchView,
                    height: Dimens.twentySix,
                    width: Dimens.twentySix,
                    colorFilter: const ColorFilter.mode(
                      ColorsValue.appColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: Dimens.ten,
                ),
                child: InkWell(
                  onTap: () {
                    RouteManagement.goToWishlistScreen();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: Dimens.ten),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetConstants.ic_wishlist,
                          height: Dimens.twentyFour,
                          width: Dimens.twentyFour,
                          colorFilter: const ColorFilter.mode(
                            ColorsValue.appColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        if (controller.wishListCount != null &&
                            controller.wishListCount != 0) ...[
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              alignment: Alignment.center,
                              height: Dimens.fifteen,
                              width: Dimens.fifteen,
                              decoration: BoxDecoration(
                                color: ColorsValue.appColor,
                                borderRadius: BorderRadius.circular(
                                  Dimens.hundred,
                                ),
                              ),
                              child: Text(
                                controller.wishListCount.toString(),
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimens.eight,
                                  color: ColorsValue.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: Dimens.edgeInsets20_20.copyWith(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        height: Dimens.twoHundred,
                        child: PageView.builder(
                          itemCount: controller.bnnerList.length,
                          onPageChanged: (value) {
                            controller.selectPage = value;
                            controller.update();
                          },
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Dimens.ten,
                              ),
                              child: Image.asset(
                                controller.bnnerList[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                      Dimens.boxHeight8,
                      Center(
                        child: Wrap(
                          children:
                              controller.bnnerList.asMap().entries.map((e) {
                            return Padding(
                              padding: Dimens.edgeInsetsLeft4,
                              child: Container(
                                width: controller.selectPage == e.key
                                    ? Dimens.ten
                                    : Dimens.six,
                                height: Dimens.six,
                                decoration: BoxDecoration(
                                  color: controller.selectPage == e.key
                                      ? ColorsValue.appColor
                                      : ColorsValue.lightPrimaryColor,
                                  borderRadius: BorderRadius.circular(
                                    Dimens.twenty,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Dimens.boxHeight20,
                      if (controller.getCategoriesList.isNotEmpty) ...[
                        Text(
                          'Categories',
                          style: Styles.color01010170020,
                        ),
                        Dimens.boxHeight10,
                        SizedBox(
                          height: Dimens.hundredThirty,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.getCategoriesList.length,
                            itemBuilder: (context, index) {
                              var item = controller.getCategoriesList[index];
                              var type = controller
                                  .getCategoriesList[index].image
                                  ?.split(".")
                                  .last;
                              return GestureDetector(
                                onTap: () {
                                  RouteManagement.goToSubCategoriesListScreen(
                                      item.id ?? "", item.name ?? "",item);
                                },
                                child: Padding(
                                  padding: Dimens.edgeInsetsRight20,
                                  child: SizedBox(
                                    width: Dimens.hundred,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: Dimens.seventyFive,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              Dimens.fiveHundred,
                                            ),
                                            color: ColorsValue.whiteColor,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              Dimens.fiveHundred,
                                            ),
                                            child: type != "svg"
                                                ? CachedNetworkImage(
                                                    imageUrl: (item.icon ?? ""),
                                                    height: Dimens.seventyFive,
                                                    width: Dimens.seventyFive,
                                                    placeholder:
                                                        (context, url) {
                                                      return Image.asset(
                                                        AssetConstants.ring,
                                                      );
                                                    },
                                                    errorWidget:
                                                        (context, url, error) {
                                                      return Image.asset(
                                                        AssetConstants.ring,
                                                      );
                                                    },
                                                  )
                                                : SvgPicture.network(
                                                    item.image ?? "",
                                                    height: Dimens.seventyFive,
                                                    width: Dimens.seventyFive,
                                                  ),
                                          ),
                                        ),
                                        Dimens.boxHeight10,
                                        Text(
                                          item.name ?? "",
                                          style: Styles.blackw50012,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                      if (Utility.isLoginOrNot()) ...[
                        if (controller.productArrivalDocList.isNotEmpty) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'New Arrival',
                                style: Styles.color01010170020,
                              ),
                              GestureDetector(
                                onTap: () {
                                  RouteManagement.goToViewAllProductScreen(
                                      "Arrival", "", "");
                                },
                                child: Text(
                                  'View All',
                                  style: Styles.primary50014,
                                ),
                              ),
                            ],
                          ),
                          Dimens.boxHeight10,
                          SizedBox(
                            height: Dimens.twoHundredNinety,
                            child: ListView.builder(
                              controller:
                                  controller.scrollArrivalProductController,
                              padding: Dimens.edgeInsets0,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  controller.productArrivalDocList.length,
                              itemBuilder: (context, index) {
                                var item =
                                    controller.productArrivalDocList[index];
                                return Padding(
                                  padding: Dimens.edgeInsetsRight20,
                                  child: CustomProductView(
                                    inOutStock: (item.quantity ?? 0) <= 0
                                        ? true
                                        : false,
                                    productName: item.name ?? "",
                                    imageUrl: item.image ?? "",
                                    categoryName: item.category?.name ?? "",
                                    quantity: item.cartQuantity ?? 0,
                                    weigth: item.weight.toString(),
                                    inWishList: item.wishlistStatus ?? false,
                                    inCart: item.inCart ?? false,
                                    onAddToCard: () {
                                      Get.closeCurrentSnackbar();
                                      if (item.inCart ?? false) {
                                        Get.find<BottomBarController>()
                                            .tabController
                                            ?.animateTo(2);
                                      } else {
                                        if (controller
                                                .productArrivalDocList[index]
                                                .cartQuantity
                                                .toDouble() >
                                            0) {
                                          controller.postAddToCart(
                                              item.id ?? "",
                                              item.cartQuantity,
                                              index,
                                              "arrival");
                                        } else {
                                          Utility.errorMessage(
                                              "Please add one item.");
                                        }
                                      }
                                    },
                                    addFavorite: () {
                                      controller.postWishlistAddRemove(
                                          item.id ?? "", index, false);
                                    },
                                    increment: item.inCart ?? false
                                        ? null
                                        : () {
                                            controller
                                                .productArrivalDocList[index]
                                                .cartQuantity++;
                                            controller.update();
                                          },
                                    dincrement: item.inCart ?? false
                                        ? null
                                        : () {
                                            if (controller
                                                    .productArrivalDocList[
                                                        index]
                                                    .cartQuantity
                                                    .toDouble() >
                                                1) {
                                              controller
                                                  .productArrivalDocList[index]
                                                  .cartQuantity--;
                                            }
                                            controller.update();
                                          },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ] else ...[
                        Text(
                          'New Arrival',
                          style: Styles.color01010170020,
                        ),
                        Dimens.boxHeight20,
                        SizedBox(
                          height: Dimens.twoHundredFourty,
                          child: ListView.builder(
                            padding: Dimens.edgeInsets0,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.offlineArrivalDataList.length,
                            itemBuilder: (context, index) {
                              var item =
                                  controller.offlineArrivalDataList[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.find<BottomBarController>()
                                      .tabController
                                      ?.index = 4;
                                  Get.find<BottomBarController>().update();
                                },
                                child: Padding(
                                  padding: Dimens.edgeInsetsRight20,
                                  child: Container(
                                    padding: Dimens.edgeInsets10,
                                    width: Dimens.twoHundredTen,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.ten,
                                      ),
                                      color: ColorsValue.whiteColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Dimens.ten,
                                                  ),
                                                  color: ColorsValue.appBg,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Dimens.ten,
                                                  ),
                                                  child: Image.asset(
                                                    item.image ?? "",
                                                    fit: BoxFit.cover,
                                                    height: Dimens.hundredFifty,
                                                    width: Dimens.twoHundredTen,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight10,
                                        Text(
                                          item.name ?? "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          style: Styles.blackW60014,
                                        ),
                                        Dimens.boxHeight10,
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Weigth : ",
                                                      style: Styles.blackW60014,
                                                    ),
                                                    Text(
                                                      "${item.weight} gm",
                                                      style: Styles.black60012,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                      Dimens.boxHeight20,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.bannerHomeList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: Dimens.edgeInsetsBottom10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              Dimens.ten,
                            ),
                            child: Image.asset(
                              controller.bannerHomeList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      if (Utility.isLoginOrNot()) ...[
                        if (controller.productTrendingDocList.isNotEmpty) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Trending Product',
                                style: Styles.color01010170020,
                              ),
                              GestureDetector(
                                onTap: () {
                                  RouteManagement.goToViewAllProductScreen(
                                      "Trending", "", "");
                                },
                                child: Text(
                                  'View All',
                                  style: Styles.primary50014,
                                ),
                              ),
                            ],
                          ),
                          Dimens.boxHeight10,
                          SizedBox(
                            height: Dimens.threeHundredFifteen,
                            child: ListView.builder(
                              controller: controller.scrollTrendingController,
                              padding: Dimens.edgeInsets0,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  controller.productTrendingDocList.length,
                              itemBuilder: (context, index) {
                                var item =
                                    controller.productTrendingDocList[index];
                                return Padding(
                                  padding: Dimens.edgeInsetsRight20,
                                  child: CustomProductView(
                                    inOutStock: (item.quantity ?? 0) <= 0
                                        ? true
                                        : false,
                                    productName: item.name ?? "",
                                    imageUrl: item.image ?? "",
                                    categoryName: item.category?.name ?? "",
                                    quantity: item.cartQuantity,
                                    weigth: item.weight.toString(),
                                    inCart: item.inCart ?? false,
                                    inWishList: item.wishlistStatus ?? false,
                                    onAddToCard: () {
                                      Get.closeCurrentSnackbar();
                                      if (item.inCart ?? false) {
                                        Get.find<BottomBarController>()
                                            .tabController
                                            ?.animateTo(2);
                                      } else {
                                        if (controller
                                                .productTrendingDocList[index]
                                                .cartQuantity
                                                .toDouble() >
                                            0) {
                                          controller.postAddToCart(
                                              item.id ?? "",
                                              item.cartQuantity,
                                              index,
                                              "trending");
                                        } else {
                                          Utility.errorMessage(
                                              "Please add one item.");
                                        }
                                      }
                                    },
                                    addFavorite: () {
                                      controller.postWishlistAddRemove(
                                          item.id ?? "", index, false);
                                    },
                                    increment: item.inCart ?? false
                                        ? null
                                        : () {
                                            controller
                                                .productTrendingDocList[index]
                                                .cartQuantity++;
                                            controller.update();
                                          },
                                    dincrement: item.inCart ?? false
                                        ? null
                                        : () {
                                            if (controller
                                                    .productTrendingDocList[
                                                        index]
                                                    .cartQuantity
                                                    .toDouble() >
                                                1) {
                                              controller
                                                  .productTrendingDocList[index]
                                                  .cartQuantity--;
                                            }
                                            controller.update();
                                          },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ] else ...[
                        Text(
                          'Trending Product',
                          style: Styles.color01010170020,
                        ),
                        Dimens.boxHeight20,
                        SizedBox(
                          height: Dimens.twoHundredFourty,
                          child: ListView.builder(
                            padding: Dimens.edgeInsets0,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.offlineTrendingDataList.length,
                            itemBuilder: (context, index) {
                              var item =
                                  controller.offlineTrendingDataList[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.find<BottomBarController>()
                                      .tabController
                                      ?.index = 4;
                                  Get.find<BottomBarController>().update();
                                },
                                child: Padding(
                                  padding: Dimens.edgeInsetsRight20,
                                  child: Container(
                                    padding: Dimens.edgeInsets10,
                                    width: Dimens.twoHundredTen,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.ten,
                                      ),
                                      color: ColorsValue.whiteColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Dimens.ten,
                                                  ),
                                                  color: ColorsValue.appBg,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Dimens.ten,
                                                  ),
                                                  child: Image.asset(
                                                    item.image ?? "",
                                                    fit: BoxFit.cover,
                                                    height: Dimens.hundredFifty,
                                                    width: Dimens.twoHundredTen,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight10,
                                        Text(
                                          item.name ?? "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          style: Styles.blackW60014,
                                        ),
                                        Dimens.boxHeight10,
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Weigth : ",
                                                      style: Styles.blackW60014,
                                                    ),
                                                    Text(
                                                      "${item.weight} gm",
                                                      style: Styles.black60012,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (controller.isLoading) ...[
                Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.black.withValues(alpha: 0.5),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ]
            ],
          ),
        );
      },
    );
  }
}
