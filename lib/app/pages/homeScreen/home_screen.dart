import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/custom_product.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {
        var controller = Get.find<HomeController>();
        await controller.postAllProduct(1);
      },
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        appBar: AppBar(
          backgroundColor: ColorsValue.primaryColor,
          title: Padding(
            padding: EdgeInsets.all(Dimens.five),
            child: Text(
              'Full Name',
              style: Styles.color01010160018,
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetConstants.notificationView,
                        height: Dimens.twentyFour,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 11,
                        child: Container(
                          height: Dimens.fourteen,
                          width: Dimens.fourteen,
                          decoration: BoxDecoration(
                            color: const Color(0xffE7AC2D),
                            borderRadius: BorderRadius.circular(Dimens.twelve),
                          ),
                          child: Center(
                            child: Text(
                              '1'.toString(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: Dimens.twenty),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(right: Dimens.ten),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetConstants.likeView,
                        height: Dimens.twentyFour,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 11,
                        child: Container(
                          height: Dimens.fourteen,
                          width: Dimens.fourteen,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(Dimens.twelve),
                          ),
                          child: Center(
                            child: Text(
                              '1'.toString(),
                              style: Styles.white14.copyWith(
                                fontSize: Dimens.twelve,
                                fontWeight: FontWeight.w400,
                                color: ColorsValue.whiteColor,
                              ),
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
                TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: Dimens.fifteen),
                    filled: true,
                    fillColor: ColorsValue.whiteColor,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorsValue.transparent,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.ten,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorsValue.transparent,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.ten,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorsValue.transparent,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.ten,
                      ),
                    ),
                    hintText: 'Search...',
                    hintStyle: Styles.greyAAA40014,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(AssetConstants.searchView),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        AssetConstants.voiceView,
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                SizedBox(
                  height: Dimens.hundredEighty,
                  child: PageView.builder(
                    itemCount: controller.filterType.length,
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
                    children: controller.filterType.asMap().entries.map((e) {
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
                        return Padding(
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
                                          errorWidget: (context, url, error) {
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
                    Center(
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
                    controller: controller.scrollBestSellerController,
                    padding: Dimens.edgeInsets0,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.productDocList.length,
                    itemBuilder: (context, index) {
                      var item = controller.productDocList[index];
                      return Padding(
                        padding: Dimens.edgeInsetsRight20,
                        child: CustomProductView(
                          productName: item.name ?? "",
                          imageUrl: item.image ?? "",
                          categoryName: item.category?.name ?? "",
                          quantity: item.quantity ?? 1,
                          weigth: item.weight ?? "",
                          inWishList: item.isWishlist,
                          onTap: () {},
                          addFavorite: () {
                            if (item.isWishlist) {
                              item.isWishlist = false;
                            } else {
                              item.isWishlist = true;
                            }
                            controller.update();
                          },
                          increment: () {
                            if (controller.productDocList[index].quantity
                                    .toDouble() >
                                1) {
                              controller.productDocList[index].quantity--;
                            }
                            controller.update();
                          },
                          dincrement: () {
                            controller.productDocList[index].quantity++;
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
                    Center(
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
                    controller: controller.scrollBestSellerController,
                    padding: Dimens.edgeInsets0,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.productDocList.length,
                    itemBuilder: (context, index) {
                      var item = controller.productDocList[index];
                      return Padding(
                        padding: Dimens.edgeInsetsRight20,
                        child: CustomProductView(
                          productName: item.name ?? "",
                          imageUrl: item.image ?? "",
                          categoryName: item.category?.name ?? "",
                          quantity: item.quantity ?? 1,
                          weigth: item.weight ?? "",
                          inWishList: item.isWishlist,
                          onTap: () {},
                          addFavorite: () {
                            if (item.isWishlist) {
                              item.isWishlist = false;
                            } else {
                              item.isWishlist = true;
                            }
                            controller.update();
                          },
                          increment: () {
                            if (controller.productDocList[index].quantity
                                    .toDouble() >
                                1) {
                              controller.productDocList[index].quantity--;
                            }
                            controller.update();
                          },
                          dincrement: () {
                            controller.productDocList[index].quantity++;
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
      ),
    );
  }
}
