import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';
import 'package:krishna_ornaments/domain/models/products_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ShowImageDetail extends StatelessWidget {
  const ShowImageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(initState: (state) {
      final controller = Get.find<ProfileController>();
      controller.productList = Get.arguments;
    }, builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.appBg,
        appBar: AppBarWidget(
          onTapBack: () {
            Get.back();
          },
          title: 'Gallery'.tr,
          actions: [
            GestureDetector(
              onTap: () async {
                if (await Utility.imagePermissionCheack(context)) {
                  Utility.downloadImage(controller.productList[0].image ?? '');
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
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: controller.pageController,
                      itemCount: Get.arguments.length,
                      onPageChanged: (index) {
                        controller.currentPage = index;
                        controller.update();
                      },
                      itemBuilder: (context, index) {
                        return ItemPage(item: controller.productList[index]);
                      },
                    ),

                    // Back arrow
                    Positioned(
                      left: 16,
                      top: MediaQuery.of(context).size.height / 2 - 24,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, size: 30),
                        onPressed: controller.goToPreviousPage,
                      ),
                    ),

                    // Forward arrow
                    Positioned(
                      right: 16,
                      top: MediaQuery.of(context).size.height / 2 - 24,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios, size: 30),
                        onPressed:
                            controller.goToNextPage(myItems: Get.arguments),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    });
  }

  PhotoViewGalleryPageOptions buildForImage(image) {
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(image),
      initialScale: PhotoViewComputedScale.contained * 1,
      minScale: PhotoViewComputedScale.contained * 1,
    );
  }
}

// class SwipeScreen extends StatefulWidget {
//   const SwipeScreen({super.key});

//   @override
//   _SwipeScreenState createState() => _SwipeScreenState();
// }

// class _SwipeScreenState extends State<SwipeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [

//         ],
//       ),
//     );
//   }
// }

// Container(
//                       color: ColorsValue.appColor,
//                       child: PhotoViewGallery.builder(
//                         backgroundDecoration: BoxDecoration(
//                           color: ColorsValue.appBg,
//                         ),
//                         builder: (BuildContext context, int index) {
//                           switch (Get.arguments[1]) {
//                             case "image":
//                               return buildForImage(Get.arguments[0]);
//                             default:
//                               return buildForImage(Get.arguments[0]);
//                           }
//                         },
//                         itemCount: 1,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 10),
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: SvgPicture.asset(
//                           AssetConstants.ic_right_arrow,
//                           height: Dimens.thirtyFive,
//                           width: Dimens.thirtyFive,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 10),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: SvgPicture.asset(
//                           AssetConstants.back_arrow,
//                           height: Dimens.thirtyFive,
//                           width: Dimens.thirtyFive,
//                         ),
//                       ),
//                     ),

class ItemPage extends StatelessWidget {
  final ProductsDoc item;

  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name ?? "CZ Kadies Ring (LR16278)"),
                Text(item.category?.name ?? "ladies Ring"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
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
                      '10',
                    ),
                    Dimens.boxWidth10,
                    GestureDetector(
                      onTap: () {},
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Weight: 31 gm"),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {}, // onAddToCard,
                  child: Container(
                    alignment: Alignment.center,
                    padding: Dimens.edgeInsets15_0_15_0,
                    height: Dimens.twentySeven,
                    decoration: BoxDecoration(
                      color: ColorsValue.colorEDC97D,
                      borderRadius: BorderRadius.circular(
                        Dimens.four,
                      ),
                    ),
                    child: Text(
                      true ? 'Item In Cart' : 'Add To Cart', // inCart
                      style: Styles.colorFBF7F350010,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.all(24),
    //   color: Colors.white,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Icon(Icons.shopping_bag, size: 100, color: Colors.purple),
    //       SizedBox(height: 30),
    //       Text(
    //         item,
    //         style: TextStyle(
    //           fontSize: 32,
    //           fontWeight: FontWeight.bold,
    //           color: Colors.purple[800],
    //         ),
    //         textAlign: TextAlign.center,
    //       ),
    //       SizedBox(height: 20),
    //       Text(
    //         'Explore the finest ${item.toLowerCase()} in our collection.',
    //         style: TextStyle(fontSize: 18, color: Colors.grey[600]),
    //         textAlign: TextAlign.center,
    //       ),
    //       SizedBox(height: 40),
    //       ElevatedButton(
    //         onPressed: () {
    //           print('Selected item: $item');
    //           ScaffoldMessenger.of(context).showSnackBar(
    //             SnackBar(content: Text('You selected: $item')),
    //           );
    //         },
    //         style: ElevatedButton.styleFrom(
    //           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    //           backgroundColor: Colors.deepPurple,
    //         ),
    //         child: Text('Show Product Name'),
    //       ),
    //     ],
    //   ),
    // );
  }
}
