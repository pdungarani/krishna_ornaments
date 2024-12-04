import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return GetBuilder<HomeController>(initState: (state) async {
      var controller = Get.find<HomeController>();
      controller.postGetAllProduct(1, '');
    }, builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.appBg,
        appBar: AppBarWidget(
          onTapBack: () {
            Get.back();
          },
          title: 'Search Screen',
          isVisible: true,
        ),
        body: Padding(
          padding: Dimens.edgeInsets20,
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
                child: controller.getAllProductDocList.isNotEmpty
                    ? RefreshIndicator(
                        onRefresh: () => Future.sync(
                          () async {
                            // await controller.postArrivalViewAll(
                            //     1, controller.productTypeViewAll);
                          },
                        ),
                        child: GridView.builder(
                          controller: controller.scrollViewAllController,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: Dimens.fifteen,
                            crossAxisSpacing: Dimens.ten,
                            mainAxisExtent: Dimens.threeHundredTwenty,
                          ),
                          itemCount: controller.getAllProductDocList.length,
                          itemBuilder: (context, index) {
                            var item = controller.getAllProductDocList[index];
                            return Container(
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
                                    CachedNetworkImage(
                                      imageUrl: item.image ?? "",
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
                                    Padding(
                                      padding: Dimens.edgeInsets10,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name ?? "",
                                            softWrap: true,
                                            maxLines: 1,
                                            style: Styles.black60016,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Weigth",
                                                    style: Styles.black50012,
                                                  ),
                                                  Text(
                                                    "${item.weight.toString()} gm",
                                                    style: Styles.black50012,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: item.inCart ?? false
                                                        ? null
                                                        : () {
                                                            if (controller
                                                                    .getAllProductDocList[
                                                                        index]
                                                                    .quantity
                                                                    .toDouble() >
                                                                0) {
                                                              controller
                                                                  .getAllProductDocList[
                                                                      index]
                                                                  .quantity--;
                                                            }
                                                            controller.update();
                                                          },
                                                    child: SvgPicture.asset(
                                                      AssetConstants.minus,
                                                      height: Dimens.twentyFour,
                                                      width: Dimens.twentyFour,
                                                    ),
                                                  ),
                                                  Dimens.boxWidth10,
                                                  Text(
                                                    item.quantity.toString(),
                                                  ),
                                                  Dimens.boxWidth10,
                                                  InkWell(
                                                    onTap: item.inCart ?? false
                                                        ? null
                                                        : () {
                                                            controller
                                                                .getAllProductDocList[
                                                                    index]
                                                                .quantity++;
                                                            controller.update();
                                                          },
                                                    child: SvgPicture.asset(
                                                      AssetConstants.plus,
                                                      height: Dimens.twentyFour,
                                                      width: Dimens.twentyFour,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight10,
                                          InkWell(
                                            onTap: () {
                                              if (item.inCart ?? false) {
                                              } else {
                                                if (controller
                                                        .getAllProductDocList[
                                                            index]
                                                        .quantity
                                                        .toDouble() >
                                                    0) {
                                                  controller.postAddToCart(
                                                    item.id ?? "",
                                                    item.quantity,
                                                    index,
                                                    '',
                                                  );
                                                } else {
                                                  Utility.errorMessage(
                                                      "Please add one item.");
                                                }
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  Dimens.edgeInsets14_0_14_0,
                                              height: Dimens.thirty,
                                              decoration: BoxDecoration(
                                                color: ColorsValue.colorEDC97D,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.four,
                                                ),
                                              ),
                                              child: Text(
                                                item.inCart ?? false
                                                    ? 'Item In Cart'
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
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetConstants.ic_filter_empty,
                            ),
                            Dimens.boxHeight10,
                            Text(
                              'search_empty_txt'.tr,
                              style: Styles.black64748BW50016,
                            )
                          ],
                        ),
                      ),
              )
            ],
          ),
        ),
      );
    });
  }
}
