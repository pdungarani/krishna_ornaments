import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart'
    show RouteManagement;
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';
import 'package:krishna_ornaments/domain/domain.dart';
import 'dart:io';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return GetBuilder<HomeController>(
      initState: (state) async {
        var controller = Get.find<HomeController>();
        if (Utility.isLoginOrNot() && Platform.isIOS) {
          controller.isSearchLoading = true;
          controller.postGetAllProduct(1, '');
        }
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'Search Screen',
            isVisible: true,
          ),
          body: Utility.isLoginOrNot() && Platform.isIOS
              ? Padding(
                  padding: Dimens.edgeInsets20_0_20_20,
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
                        onChanged: (value) {
                          _debouncer.run(() {
                            Future.sync(
                              () {
                                if (value.isNotEmpty) {
                                  return controller.postGetAllProduct(
                                      1, value.toString());
                                } else {
                                  return controller.postGetAllProduct(1, '');
                                }
                              },
                            );
                          });
                        },
                      ),
                      Dimens.boxHeight20,
                      Expanded(
                        child: !controller.isSearchLoading
                            ? controller.getAllProductDocList.isNotEmpty
                                ? RefreshIndicator(
                                    onRefresh: () => Future.sync(
                                      () async {
                                        controller.isSearchLoading = true;
                                        controller.update();
                                        controller.postGetAllProduct(1, '');
                                      },
                                    ),
                                    child: GridView.builder(
                                      controller:
                                          controller.scrollViewAllController,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: Dimens.fifteen,
                                        crossAxisSpacing: Dimens.ten,
                                        mainAxisExtent: Dimens.threeHundred,
                                      ),
                                      itemCount: controller
                                          .getAllProductDocList.length,
                                      itemBuilder: (context, index) {
                                        var item = controller
                                            .getAllProductDocList[index];
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              Dimens.ten,
                                            ),
                                            color: ColorsValue.appColorLight,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              Dimens.ten,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    RouteManagement
                                                        .goToShowFullScareenImage(
                                                            item.image ?? "",
                                                            "image");
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          Dimens.ten),
                                                      topRight: Radius.circular(
                                                          Dimens.ten),
                                                    ),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          item.image ?? "",
                                                      fit: BoxFit.cover,
                                                      height:
                                                          Dimens.hundredSixty,
                                                      width: double.maxFinite,
                                                      placeholder:
                                                          (context, url) =>
                                                              Image.asset(
                                                        AssetConstants
                                                            .placeholder,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                        AssetConstants
                                                            .placeholder,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Dimens.boxHeight10,
                                                Padding(
                                                  padding: Dimens
                                                      .edgeInsets10_0_10_0,
                                                  child: Text(
                                                    item.name ?? "",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    style: Styles.blackW60014,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Padding(
                                                          padding: Dimens
                                                              .edgeInsets10_0_10_0,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Weigth",
                                                                    style: Styles
                                                                        .blackW60014,
                                                                  ),
                                                                  Text(
                                                                    "${item.weight} gm",
                                                                    style: Styles
                                                                        .black60012,
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: item.inCart ??
                                                                            false
                                                                        ? null
                                                                        : () {
                                                                            if (controller.getAllProductDocList[index].cartQuantity.toDouble() >
                                                                                0) {
                                                                              controller.getAllProductDocList[index].cartQuantity--;
                                                                            }
                                                                            controller.update();
                                                                          },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                          Dimens
                                                                              .ten,
                                                                        ),
                                                                        color: ColorsValue
                                                                            .colorDFDFDF,
                                                                      ),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        AssetConstants
                                                                            .minus,
                                                                        height:
                                                                            Dimens.twentyFour,
                                                                        width: Dimens
                                                                            .twentyFour,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  Text(
                                                                    item.cartQuantity
                                                                        .toString(),
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  GestureDetector(
                                                                    onTap: item.inCart ??
                                                                            false
                                                                        ? null
                                                                        : () {
                                                                            controller.getAllProductDocList[index].cartQuantity++;
                                                                            controller.update();
                                                                          },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        color: ColorsValue
                                                                            .colorDFDFDF,
                                                                      ),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        AssetConstants
                                                                            .plus,
                                                                        height:
                                                                            Dimens.twentyFour,
                                                                        width: Dimens
                                                                            .twentyFour,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Dimens.boxHeight5,
                                                        Padding(
                                                          padding: Dimens
                                                              .edgeInsets10_0_10_10,
                                                          child: InkWell(
                                                            onTap: () {
                                                              if (item.inCart ??
                                                                  false) {
                                                              } else {
                                                                if (controller
                                                                        .getAllProductDocList[
                                                                            index]
                                                                        .cartQuantity
                                                                        .toDouble() >
                                                                    0) {
                                                                  controller
                                                                      .postAddToCart(
                                                                    item.id ??
                                                                        "",
                                                                    item.cartQuantity,
                                                                    index,
                                                                    "",
                                                                  );
                                                                } else {
                                                                  Utility.errorMessage(
                                                                      "Please add one item.");
                                                                }
                                                              }
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              padding: Dimens
                                                                  .edgeInsets14_0_14_0,
                                                              height:
                                                                  Dimens.thirty,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: ColorsValue
                                                                    .colorEDC97D,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  Dimens.four,
                                                                ),
                                                              ),
                                                              child: Text(
                                                                item.inCart ??
                                                                        false
                                                                    ? 'Item In Cart'
                                                                    : 'Add To Cart',
                                                                style: Styles
                                                                    .colorFBF7F350010,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AssetConstants.ic_filter_empty,
                                        ),
                                        Dimens.boxHeight10,
                                        Text(
                                          'Search data not found..!'.tr,
                                          style: Styles.black64748BW50016,
                                        )
                                      ],
                                    ),
                                  )
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                      )
                    ],
                  ),
                )
              : Utility.LoginNotWidget("Search"),
        );
      },
    );
  }
}
