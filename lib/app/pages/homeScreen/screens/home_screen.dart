import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/routes_management.dart';
import 'package:krishna_ornaments/app/widgets/custom_button.dart';
import 'package:krishna_ornaments/app/widgets/custom_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {
        var controller = Get.find<HomeController>();
        Get.find<ProfileController>().getProfile();
        await controller.postAllProduct(1);
        await controller.postAllTrendingProduct(1);
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.primaryColor,
          appBar: AppBar(
            backgroundColor: ColorsValue.primaryColor,
            title: Padding(
              padding: EdgeInsets.all(Dimens.five),
              child: Text(
                "Hi, ${Get.find<ProfileController>().getProfileModel?.name ?? ''}",
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
              // Padding(
              //   padding: const EdgeInsets.only(right: 10),
              //   child: InkWell(
              //     onTap: () {},
              //     child: Padding(
              //       padding: const EdgeInsets.only(right: 10),
              //       child: Stack(
              //         alignment: Alignment.center,
              //         children: [
              //           SvgPicture.asset(
              //             AssetConstants.ic_notification,
              //             height: Dimens.twentySix,
              //             width: Dimens.twentySix,
              //           ),
              //           Positioned(
              //             right: 0,
              //             top: 0,
              //             child: Container(
              //               alignment: Alignment.center,
              //               height: Dimens.fifteen,
              //               width: Dimens.fifteen,
              //               decoration: BoxDecoration(
              //                 color: ColorsValue.appColor,
              //                 borderRadius: BorderRadius.circular(
              //                   Dimens.hundred,
              //                 ),
              //               ),
              //               child: Text(
              //                 "10",
              //                 style: GoogleFonts.montserrat(
              //                   fontSize: Dimens.eight,
              //                   color: ColorsValue.whiteColor,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
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
                              "10",
                              style: GoogleFonts.montserrat(
                                fontSize: Dimens.eight,
                                color: ColorsValue.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: Dimens.edgeInsets20_20.copyWith(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimens.hundredEighty,
                    child: PageView.builder(
                      itemCount: controller.testList.length,
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
                            AssetConstants.banner,
                          ),
                        );
                      },
                    ),
                  ),
                  Dimens.boxHeight8,
                  Center(
                    child: Wrap(
                      children: controller.testList.asMap().entries.map((e) {
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
                    SizedBox(
                      height: Dimens.hundredThirty,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.getCategoriesList.length,
                        itemBuilder: (context, index) {
                          var item = controller.getCategoriesList[index];
                          var type = controller.getCategoriesList[index].image
                              ?.split(".")
                              .last;
                          return GestureDetector(
                            onTap: () {
                              RouteManagement.goToViewAllProductScreen(
                                  "", item.id ?? "", item.name ?? "");
                            },
                            child: Padding(
                              padding: Dimens.edgeInsetsRight20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: Dimens.seventyFive,
                                    width: Dimens.seventyFive,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.fiveHundred,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.fiveHundred,
                                      ),
                                      child: type != "svg"
                                          ? CachedNetworkImage(
                                              imageUrl: (item.image ?? ""),
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) {
                                                return Image.asset(
                                                  AssetConstants.placeholder,
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                              errorWidget:
                                                  (context, url, error) {
                                                return Image.asset(
                                                  AssetConstants.placeholder,
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            )
                                          : SvgPicture.network(
                                              item.image ?? "",
                                            ),
                                    ),
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    item.name ?? "",
                                    style: Styles.blackw60012,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
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
                    height: Dimens.threeHundredFifteen,
                    child: ListView.builder(
                      controller: controller.scrollBestSellerController,
                      padding: Dimens.edgeInsets0,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.productArrivalDocList.length,
                      itemBuilder: (context, index) {
                        var item = controller.productArrivalDocList[index];
                        return Padding(
                          padding: Dimens.edgeInsetsRight20,
                          child: CustomProductView(
                            productName: item.name ?? "",
                            imageUrl: item.image ?? "",
                            categoryName: item.category?.name ?? "",
                            quantity: item.quantity,
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
                                        .productArrivalDocList[index].quantity
                                        .toDouble() >
                                    0) {
                                  controller.postAddToCart(item.id ?? "",
                                      item.quantity, index, "arrival");
                                } else {
                                  Utility.errorMessage("Please add one item.");
                                }
                              }
                            },
                            addFavorite: () {
                              controller.postWishlistAddRemove(item.id ?? "");
                            },
                            increment: item.inCart ?? false
                                ? null
                                : () {
                                    controller.productArrivalDocList[index]
                                        .quantity++;
                                    controller.update();
                                  },
                            dincrement: item.inCart ?? false
                                ? null
                                : () {
                                    if (controller.productArrivalDocList[index]
                                            .quantity
                                            .toDouble() >
                                        0) {
                                      controller.productArrivalDocList[index]
                                          .quantity--;
                                    }
                                    controller.update();
                                  },
                          ),
                        );
                      },
                    ),
                  ),
                  Dimens.boxHeight20,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) => Padding(
                      padding: Dimens.edgeInsetsBottom10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Dimens.ten,
                        ),
                        child: Image.asset(
                          AssetConstants.banner,
                        ),
                      ),
                    ),
                  ),
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
                    height: Dimens.twoHundredNinety,
                    child: ListView.builder(
                      controller: controller.scrollTrendingController,
                      padding: Dimens.edgeInsets0,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.productTrendingDocList.length,
                      itemBuilder: (context, index) {
                        var item = controller.productTrendingDocList[index];
                        return Padding(
                          padding: Dimens.edgeInsetsRight10,
                          child: CustomProductView(
                            productName: item.name ?? "",
                            imageUrl: item.image ?? "",
                            categoryName: item.category?.name ?? "",
                            quantity: item.quantity,
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
                                        .productTrendingDocList[index].quantity
                                        .toDouble() >
                                    0) {
                                  controller.postAddToCart(item.id ?? "",
                                      item.quantity, index, "trending");
                                } else {
                                  Utility.errorMessage("Please add one item.");
                                }
                              }
                            },
                            addFavorite: () {
                              controller.postWishlistAddRemove(item.id ?? "");
                            },
                            increment: item.inCart ?? false
                                ? null
                                : () {
                                    controller.productTrendingDocList[index]
                                        .quantity++;
                                    controller.update();
                                  },
                            dincrement: item.inCart ?? false
                                ? null
                                : () {
                                    if (controller.productTrendingDocList[index]
                                            .quantity
                                            .toDouble() >
                                        0) {
                                      controller.productTrendingDocList[index]
                                          .quantity--;
                                    }
                                    controller.update();
                                  },
                          ),
                        );
                      },
                    ),
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
