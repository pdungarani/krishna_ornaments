import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';

class ShoppingCartController extends GetxController {
  ShoppingCartController(this.shoppingCartPresenter);

  final ShoppingCartPresenter shoppingCartPresenter;

  GlobalKey<FormState> productKey = GlobalKey<FormState>();
  GlobalKey<FormState> finalKey = GlobalKey<FormState>();
  TextEditingController productDesController = TextEditingController();
  TextEditingController finalDesController = TextEditingController();

  var list = ["gffd", "gdfgfdg", "gfdgfdg", "Gfdgfdgfd"];

  showFinalDescription(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      barrierColor: Colors.grey.withOpacity(0.5),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Form(
                key: finalKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  padding: Dimens.edgeInsets20_30_20_30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimens.twelve),
                      topRight: Radius.circular(Dimens.twelve),
                    ),
                    color: ColorsValue.color9C9C9C,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'final_des'.tr,
                        style: Styles.whiteW80024,
                      ),
                      Dimens.boxHeight20,
                      Text(
                        'description'.tr,
                        style: Styles.whiteW60012,
                      ),
                      Dimens.boxHeight5,
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 40,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          style: Styles.whiteW60016,
                          controller: finalDesController,
                          maxLines: 3,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter_final_product_des'.tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding: Dimens.edgeInsets10,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            filled: true,
                            fillColor: ColorsValue.colorDFDFDF,
                          ),
                        ),
                      ),
                      Dimens.boxHeight30,
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            double.maxFinite,
                            Dimens.fourtyFive,
                          ),
                          backgroundColor: ColorsValue.appColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Dimens.twelve,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'place_order'.tr,
                            style: Styles.whiteW80014,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

//   showProductDescription(BuildContext context, ProductElement item) {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       barrierColor: Colors.grey.withOpacity(0.5),
//       backgroundColor: ColorsValue.greyA7A7A7,
//       builder: (context) {
//         return Padding(
//           padding:
//               EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//           child: StatefulBuilder(
//             builder: (context, setState) {
//               return Form(
//                 key: productKey,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 child: Container(
//                   padding: Dimens.edgeInsets20_30_20_30,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(Dimens.twelve),
//                       topRight: Radius.circular(Dimens.twelve),
//                     ),
//                     color: ColorsValue.blackColor,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         'product_des'.tr,
//                         style: Styles.whiteW80024,
//                       ),
//                       Dimens.boxHeight20,
//                       Text(
//                         'description'.tr,
//                         style: Styles.whiteW80012,
//                       ),
//                       Dimens.boxHeight5,
//                       Container(
//                         decoration: const BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               offset: Offset(0, 2),
//                               blurRadius: 40,
//                               color: Colors.black12,
//                             ),
//                           ],
//                         ),
//                         child: TextFormField(
//                           style: Styles.whiteW60016,
//                           controller: productDesController,
//                           maxLines: 3,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'enter_product_des'.tr;
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             counterText: '',
//                             contentPadding: Dimens.edgeInsets10,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: Dimens.zero, style: BorderStyle.none),
//                               borderRadius: BorderRadius.circular(Dimens.five),
//                             ),
//                             disabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: Dimens.zero, style: BorderStyle.none),
//                               borderRadius: BorderRadius.circular(Dimens.five),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: Dimens.zero, style: BorderStyle.none),
//                               borderRadius: BorderRadius.circular(Dimens.five),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: Dimens.zero, style: BorderStyle.none),
//                               borderRadius: BorderRadius.circular(Dimens.five),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: Dimens.zero, style: BorderStyle.none),
//                               borderRadius: BorderRadius.circular(Dimens.five),
//                             ),
//                             filled: true,
//                             fillColor: ColorsValue.black343434,
//                           ),
//                         ),
//                       ),
//                       Dimens.boxHeight30,
//                       ElevatedButton(
//                         onPressed: () {
//                           if (productKey.currentState!.validate()) {
//                             Get.back();
//                             postCartSave(item);
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           fixedSize: Size(
//                             double.maxFinite,
//                             Dimens.fourtyFive,
//                           ),
//                           backgroundColor: ColorsValue.maincolor1,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(
//                               Dimens.twelve,
//                             ),
//                           ),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'save'.tr,
//                             style: Styles.whiteW80018,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
}