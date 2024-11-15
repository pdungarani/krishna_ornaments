import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
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
                        'assets/icons/Notification.svg',
                        height: 24,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 11,
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            color: Color(0xffE7AC2D),
                            borderRadius: BorderRadius.circular(12),
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
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/like.svg',
                        height: 24,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 11,
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              '1'.toString(),
                              style: Styles.white14.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
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
            padding: Dimens.edgeInsets20_20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
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
                      fontSize: 16,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/Search.svg'),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/icons/Voice.svg',
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
                      borderRadius: BorderRadius.circular(Dimens.thirteen)),
                ),
                Dimens.boxHeight10,
                Text(
                  'Categories',
                  style: Styles.color01010160018.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            onTap: () {},
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: SvgPicture.asset(
                                  'assets/icons/category_Icon.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Color(0xff3E6227), BlendMode.srcIn),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        'New Arrival',
                        // style: GoogleFonts.outfit(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.w700,
                        //     color: const Color(0xff010101)),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20),
                    //   child: RichText(
                    //     text: TextSpan(
                    //       text: 'View All',
                    //       recognizer: TapGestureRecognizer()
                    //         ..onTap = () {
                    //           Get.to(Newarrival(
                    //             controller: newArrivalPaggingController,
                    //           ));
                    //         },
                    //       style: GoogleFonts.outfit(
                    //         color: const Color(0xff3E6227),
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                // SizedBox(
                //   height: 273, // 3.45
                //   child: GetBuilder<Productcontroller>(
                //     builder: (controller) {
                //       return PagedListView<int, GetallListDoc>(
                //         shrinkWrap: true,
                //         scrollDirection: Axis.horizontal,
                //         padding: const EdgeInsets.only(left: 20),
                //         pagingController: newArrivalPaggingController,
                //         builderDelegate: PagedChildBuilderDelegate<GetallListDoc>(
                //           itemBuilder: (context, item, index) {
                //             return Padding(
                //               padding: const EdgeInsets.only(right: 20),
                //               child: InkWell(
                //                 onTap: () {
                //                   Get.to(
                //                     Productdetails(
                //                       productid: item.id ?? '',
                //                       variantid: item.variantDetails?.id ?? '',
                //                       controller: newArrivalPaggingController,
                //                     ),
                //                   );
                //                 },
                //                 child: Container(
                //                   width: 220,
                //                   decoration: const BoxDecoration(
                //                     borderRadius:
                //                         BorderRadius.all(Radius.circular(10)),
                //                     color: Colors.white,
                //                   ),
                //                   padding: const EdgeInsets.all(10),
                //                   child: Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //                       Stack(
                //                         alignment: Alignment.topRight,
                //                         children: [
                //                           Container(
                //                             decoration: const BoxDecoration(
                //                               borderRadius: BorderRadius.all(
                //                                   Radius.circular(10)),
                //                               color: Color(0xffCCCCCC),
                //                             ),
                //                             child: ClipRRect(
                //                               borderRadius:
                //                                   const BorderRadius.all(
                //                                 Radius.circular(10),
                //                               ),
                //                               child: Wrap(
                //                                 children: [
                //                                   CachedNetworkImage(
                //                                     imageUrl: EndPoint.imageUrl +
                //                                         (item.bannerImage ?? ""),
                //                                     fit: BoxFit.cover,
                //                                     height: 167,
                //                                     width: 200,
                //                                     placeholder: (context, url) =>
                //                                         Image.asset(
                //                                       'images/assets/placeholder.jpeg',
                //                                       fit: BoxFit.cover,
                //                                     ),
                //                                     errorWidget:
                //                                         (context, url, error) =>
                //                                             Image.asset(
                //                                       'images/assets/placeholder.jpeg',
                //                                       fit: BoxFit.cover,
                //                                     ),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ),
                //                           Padding(
                //                             padding: const EdgeInsets.all(8.0),
                //                             child: Container(
                //                                 height: 30,
                //                                 width: 30,
                //                                 decoration: const BoxDecoration(
                //                                     borderRadius:
                //                                         BorderRadius.all(
                //                                             Radius.circular(20)),
                //                                     color: Color(0xffFFFFFF)),
                //                                 child: Center(
                //                                   child: InkWell(
                //                                     onTap: () {
                //                                       item.variantDetails
                //                                                   ?.inWishlist ??
                //                                               false
                //                                           ? item.variantDetails
                //                                               ?.inWishlist = false
                //                                           : item.variantDetails
                //                                               ?.inWishlist = true;
                //                                       addWishList(
                //                                         index: index,
                //                                         variantId: item
                //                                                 .variantDetails
                //                                                 ?.id ??
                //                                             '',
                //                                       );
                //                                       setState(() {});
                //                                     },
                //                                     child: item.variantDetails
                //                                                 ?.inWishlist ??
                //                                             false
                //                                         ? SvgPicture.asset(
                //                                             'images/assets/red heart.svg')
                //                                         : SvgPicture.asset(
                //                                             'images/assets/heart.svg'),
                //                                   ),
                //                                 )),
                //                           ),
                //                         ],
                //                       ),
                //                       const SizedBox(
                //                         height: 10,
                //                       ),
                //                       Text(
                //                         item.productName ?? "",
                //                         style: GoogleFonts.outfit(
                //                             fontSize: 16,
                //                             fontWeight: FontWeight.w600,
                //                             color: const Color(0xff010101)),
                //                       ),
                //                       Text(
                //                         item.categoryId?.name ?? "",
                //                         style: GoogleFonts.outfit(
                //                             fontSize: 12,
                //                             fontWeight: FontWeight.w400,
                //                             color: const Color(0xffAAAAAA)),
                //                       ),
                //                       const SizedBox(
                //                         height: 8,
                //                       ),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Row(
                //                             children: [
                //                               Text(
                //                                 '₹ ${(item.variantDetails?.grossAmount ?? "").toString()}',
                //                                 style: GoogleFonts.outfit(
                //                                   fontSize: 14,
                //                                   fontWeight: FontWeight.w600,
                //                                   color: const Color(0xff000000),
                //                                 ),
                //                               ),
                //                               const SizedBox(
                //                                 width: 10,
                //                               ),
                //                               Text(
                //                                 '₹ ${(item.variantDetails?.price ?? '').toString()}',
                //                                 style: GoogleFonts.outfit(
                //                                     decoration: TextDecoration
                //                                         .lineThrough,
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.w600,
                //                                     color:
                //                                         const Color(0xffAAAAAA)),
                //                               ),
                //                             ],
                //                           ),
                //                           Row(
                //                             children: [
                //                               SvgPicture.asset(
                //                                   'images/assets/Rating.svg'),
                //                               const SizedBox(
                //                                 width: 6,
                //                               ),
                //                               Text(
                //                                 (item.averageRating ?? "")
                //                                     .toString(),
                //                                 style: GoogleFonts.outfit(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.w600,
                //                                     color:
                //                                         const Color(0xff010101)),
                //                               ),
                //                             ],
                //                           )
                //                         ],
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             );
                //           },
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'Trending Product',
                //         style: GoogleFonts.outfit(
                //             fontSize: 20,
                //             fontWeight: FontWeight.w700,
                //             color: const Color(0xff010101)),
                //       ),
                //       RichText(
                //         text: TextSpan(
                //           text: 'View All',
                //           recognizer: TapGestureRecognizer()
                //             ..onTap = () {
                //               Get.to(Trendingproduct(
                //                 controller: trandingProductPaggingController,
                //               ));
                //             },
                //           style: GoogleFonts.outfit(
                //             color: const Color(0xff3E6227),
                //             fontSize: 14,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 273,
                //   child: GetBuilder<Productcontroller>(builder: (controller) {
                //     return PagedListView<int, GetallListDoc>(
                //       scrollDirection: Axis.horizontal,
                //       padding: const EdgeInsets.only(left: 20),
                //       pagingController: trandingProductPaggingController,
                //       builderDelegate: PagedChildBuilderDelegate<GetallListDoc>(
                //         itemBuilder: (context, item, index) {
                //           return Padding(
                //             padding: const EdgeInsets.only(right: 20),
                //             child: InkWell(
                //               onTap: () {
                //                 Get.to(
                //                   Productdetails(
                //                     productid: item.id ?? '',
                //                     variantid: item.variantDetails?.id ?? '',
                //                     controller: newArrivalPaggingController,
                //                   ),
                //                 );
                //               },
                //               child: Container(
                //                 decoration: const BoxDecoration(
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(10)),
                //                   color: Colors.white,
                //                 ),
                //                 padding: const EdgeInsets.all(10),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Stack(
                //                       alignment: Alignment.topRight,
                //                       children: [
                //                         Container(
                //                           decoration: const BoxDecoration(
                //                             borderRadius: BorderRadius.all(
                //                                 Radius.circular(10)),
                //                             color: Color(0xffCCCCCC),
                //                           ),
                //                           child: ClipRRect(
                //                             borderRadius: const BorderRadius.all(
                //                               Radius.circular(10),
                //                             ),
                //                             child: Wrap(
                //                               children: [
                //                                 CachedNetworkImage(
                //                                   imageUrl: EndPoint.imageUrl +
                //                                       (item.bannerImage ?? ""),
                //                                   fit: BoxFit.cover,
                //                                   height: 167,
                //                                   width: 200,
                //                                   placeholder: (context, url) =>
                //                                       Image.asset(
                //                                     'images/assets/placeholder.jpeg',
                //                                     fit: BoxFit.cover,
                //                                   ),
                //                                   errorWidget:
                //                                       (context, url, error) =>
                //                                           Image.asset(
                //                                     'images/assets/placeholder.jpeg',
                //                                     fit: BoxFit.cover,
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                         Padding(
                //                           padding: const EdgeInsets.all(8.0),
                //                           child: Container(
                //                               height: 30,
                //                               width: 30,
                //                               decoration: const BoxDecoration(
                //                                   borderRadius: BorderRadius.all(
                //                                       Radius.circular(20)),
                //                                   color: Color(0xffFFFFFF)),
                //                               child: Center(
                //                                 child: InkWell(
                //                                   onTap: () {
                //                                     item.variantDetails
                //                                                 ?.inWishlist ??
                //                                             false
                //                                         ? item.variantDetails
                //                                             ?.inWishlist = false
                //                                         : item.variantDetails
                //                                             ?.inWishlist = true;
                //                                     addWishList(
                //                                       index: index,
                //                                       variantId: item
                //                                               .variantDetails
                //                                               ?.id ??
                //                                           '',
                //                                     );
                //                                     setState(() {});
                //                                   },
                //                                   child:
                //                                       item.variantDetails
                //                                                   ?.inWishlist ??
                //                                               false
                //                                           ? SvgPicture.asset(
                //                                               'images/assets/red heart.svg')
                //                                           : SvgPicture.asset(
                //                                               'images/assets/heart.svg'),
                //                                 ),
                //                               )),
                //                         ),
                //                       ],
                //                     ),
                //                     const SizedBox(
                //                       height: 10,
                //                     ),
                //                     Text(
                //                       item.productName ?? "",
                //                       style: GoogleFonts.outfit(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w600,
                //                           color: const Color(0xff010101)),
                //                     ),
                //                     Text(
                //                       item.categoryId?.name ?? "",
                //                       style: GoogleFonts.outfit(
                //                           fontSize: 12,
                //                           fontWeight: FontWeight.w400,
                //                           color: const Color(0xffAAAAAA)),
                //                     ),
                //                     const SizedBox(
                //                       height: 8,
                //                     ),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Row(
                //                           children: [
                //                             Text(
                //                               '₹ ${(item.variantDetails?.grossAmount ?? "").toString()}',
                //                               style: GoogleFonts.outfit(
                //                                 fontSize: 14,
                //                                 fontWeight: FontWeight.w600,
                //                                 color: const Color(0xff000000),
                //                               ),
                //                             ),
                //                             const SizedBox(
                //                               width: 10,
                //                             ),
                //                             Text(
                //                               '₹ ${(item.variantDetails?.price ?? '').toString()}',
                //                               style: GoogleFonts.outfit(
                //                                   decoration:
                //                                       TextDecoration.lineThrough,
                //                                   fontSize: 14,
                //                                   fontWeight: FontWeight.w600,
                //                                   color: const Color(0xffAAAAAA)),
                //                             ),
                //                           ],
                //                         ),
                //                         Row(
                //                           children: [
                //                             SvgPicture.asset(
                //                                 'images/assets/Rating.svg'),
                //                             const SizedBox(
                //                               width: 6,
                //                             ),
                //                             Text(
                //                               (item.averageRating ?? "")
                //                                   .toString(),
                //                               style: GoogleFonts.outfit(
                //                                   fontSize: 14,
                //                                   fontWeight: FontWeight.w600,
                //                                   color: const Color(0xff010101)),
                //                             ),
                //                           ],
                //                         )
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //     );
                //   }),
                // ),
                // const SizedBox(
                //   height: 30,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
