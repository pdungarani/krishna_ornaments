import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:flutter/material.dart';
import 'package:krishna_ornaments/app/widgets/custom_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {
        state.controller?.controller = PageController();
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
                              style: Styles.white14,
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
                    hintStyle: Styles.greyAAA40014.copyWith(
                      fontSize: Dimens.sixteen,
                    ),
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
                Dimens.boxHeight10,
                Container(
                  width: context.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: ColorsValue.redColor,
                    borderRadius: BorderRadius.circular(Dimens.thirteen),
                  ),
                ),
                Dimens.boxHeight10,
                Text(
                  'Categories',
                  style: Styles.color01010160018.copyWith(
                    fontSize: Dimens.twenty,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(right: Dimens.twenty),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            overlayColor: const WidgetStatePropertyAll(
                                Colors.transparent),
                            onTap: () {},
                            child: Container(
                              height: Dimens.seventyFive,
                              width: Dimens.seventyFive,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  Dimens.fifteen,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/profile.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xff3E6227),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Dimens.ten),
                          Text(
                            'name',
                            style: Styles.black12.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'New Arrival',
                      style: Styles.color01010170020.copyWith(
                        fontSize: 20,
                        color: ColorsValue.blackColor,
                        fontWeight: FontWeight.w700,
                      ),
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
                  height: 287,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => Padding(
                      padding: Dimens.edgeInsetsRight20,
                      child: CustomProductView(
                        productName: 'productName',
                        imageUrl: 'assets/images/Mask group.png',
                        categoryName: 'categoryName',
                        productGrossAmount: '230',
                        productPrice: '250',
                        productRatting: '2.4',
                        inWishList: false,
                        onTap: () {},
                        addFavorite: () {},
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) => Padding(
                    padding: Dimens.edgeInsetsBottom10,
                    child: Container(
                      width: context.width,
                      height: 130,
                      decoration: BoxDecoration(
                        color: ColorsValue.blackColorWithOpacity59,
                        borderRadius: BorderRadius.circular(Dimens.twelve),
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Trending Product',
                      style: Styles.color01010170020.copyWith(
                        fontSize: 20,
                        color: ColorsValue.blackColor,
                        fontWeight: FontWeight.w700,
                      ),
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
                  height: 287,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => Padding(
                      padding: Dimens.edgeInsetsRight20,
                      child: CustomProductView(
                        productName: 'productName',
                        imageUrl: 'assets/images/Mask group.png',
                        categoryName: 'categoryName',
                        productGrossAmount: '230',
                        productPrice: '250',
                        productRatting: '2.4',
                        inWishList: false,
                        onTap: () {},
                        addFavorite: () {},
                      ),
                    ),
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
