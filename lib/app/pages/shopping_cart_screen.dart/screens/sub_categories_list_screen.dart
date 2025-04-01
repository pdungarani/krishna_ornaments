import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';

class SubCategoriesListScreen extends StatelessWidget {
  const SubCategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCartController>(
      initState: (state) async {
        var controller = Get.find<ShoppingCartController>();
        controller.getCategoriesData = null;
        controller.subCategoryId = Get.arguments[0];
        controller.subCategoryName = Get.arguments[1];
        controller.getCategoriesData = Get.arguments[2];
        controller.getAllCategories();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "Sub Cateroies",
            isVisible: true,
          ),
          body: controller.categoriesList.isNotEmpty
              ? ListView.builder(
                  padding: Dimens.edgeInsets20_0_20_20,
                  itemCount: controller.categoriesList.length,
                  itemBuilder: (context, index) {
                    var item = controller.categoriesList[index];
                    var type =
                        controller.categoriesList[index].image?.split(".").last;
                    return GestureDetector(
                      onTap: () {
                        RouteManagement.goToViewAllProductScreen(
                            "", item.id ?? "", item.name ?? "");
                      },
                      child: Padding(
                        padding: Dimens.edgeInsetsTop10,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimens.ten,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              Dimens.ten,
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
                      ),
                    );
                  },
                )
              : Padding(
                  padding: Dimens.edgeInsets20,
                  child: GestureDetector(
                    onTap: () {
                      RouteManagement.goToViewAllProductScreen(
                          "",
                          controller.getCategoriesData?.id ?? "",
                          controller.getCategoriesData?.name ?? "");
                    },
                    child: Padding(
                      padding: Dimens.edgeInsetsTop10,
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          child: controller.getCategoriesData?.image
                                      ?.split(".")
                                      .last !=
                                  "svg"
                              ? CachedNetworkImage(
                                  imageUrl:
                                      (controller.getCategoriesData?.image ??
                                          ""),
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
                                  controller.getCategoriesData?.image ?? "",
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
