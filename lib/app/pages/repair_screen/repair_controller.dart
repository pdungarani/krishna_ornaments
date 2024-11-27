import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart';
import 'package:krishna_ornaments/domain/models/models.dart';

class RepairController extends GetxController {
  RepairController(this.repairPresenter);

  final RepairPresenter repairPresenter;

  int selectedValue = 0;

  selectImage(BuildContext context, bool isSample) {
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
              return Container(
                width: double.maxFinite,
                padding: Dimens.edgeInsets20_05_20_30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimens.twelve),
                    topRight: Radius.circular(Dimens.twelve),
                  ),
                  color: ColorsValue.color9C9C9C,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: Dimens.seventy,
                      height: Dimens.four,
                      decoration: BoxDecoration(
                        color: ColorsValue.whiteColor,
                        borderRadius: BorderRadius.circular(
                          Dimens.three,
                        ),
                      ),
                    ),
                    Dimens.boxHeight30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (await Utility.imagePermissionCheack(context)) {
                              selectPic(ImageSource.gallery, isSample);
                              Get.back();
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetConstants.ic_gallery,
                              ),
                              Dimens.boxHeight10,
                              Text(
                                'gallery'.tr,
                                style: Styles.whiteW60012,
                              )
                            ],
                          ),
                        ),
                        Dimens.boxWidth50,
                        InkWell(
                          onTap: () async {
                            if (await Utility.cameraPermissionCheack(context)) {
                              selectPic(ImageSource.camera, isSample);
                              Get.back();
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetConstants.ic_camera,
                              ),
                              Dimens.boxHeight10,
                              Text(
                                'camera'.tr,
                                style: Styles.whiteW60012,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Dimens.boxHeight30,
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  final pickerProfile = ImagePicker();
  File? imageFile;
  String profileImage = "";

  Future selectPic(ImageSource sourcePic, bool isSample) async {
    final pickedFile = await pickerProfile.pickImage(
      source: sourcePic,
    );

    if (pickedFile != null) {
      if (Utility.getImageSizeMB(pickedFile.path) <= 10) {
        imageFile = File(pickedFile.path);
        isSample
            ? RouteManagement.goToSampleOrderScreen()
            : RouteManagement.goToRepairDetailsScreen();
      } else {
        Utility.errorMessage("max_10_mb_img".tr);
      }
    }
    update();
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  GlobalKey<FormState> desKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> sampleKey = GlobalKey<FormState>();
  TextEditingController descriptionSampleController = TextEditingController();
  int selectQuantity = 1;

  PagingController<int, RepairOrderHistoryDoc> repairOrderPagingController =
      PagingController(firstPageKey: 1);

  List<RepairOrderHistoryDoc> repairOrderList = [];

  Future<void> repairOrderListData(pageKey) async {
    var response = await repairPresenter.repairOrderList(
      page: pageKey,
      limit: 10,
      isLoading: true,
    );
    repairOrderList.clear();
    if (pageKey == 1) {
      repairOrderList.clear();
    }
    repairOrderList = response?.data?.docs ?? [];

    final isLastPage = repairOrderList.length < 10;
    if (isLastPage) {
      repairOrderPagingController.appendLastPage(repairOrderList);
    } else {
      var nextPageKey = pageKey + 1;
      repairOrderPagingController.appendPage(repairOrderList, nextPageKey);
    }
    update();
  }

  GetOneRepairOrderData? getOneRepairOrderData;

  Future<void> getOneRepairOrder({
    required String repairingOrderId,
  }) async {
    var response = await repairPresenter.getOneRepairOrder(
      repairingOrderId: repairingOrderId,
      isLoading: true,
    );
    getOneRepairOrderData = null;
    if (response?.data != null) {
      getOneRepairOrderData = response?.data;
      update();
    } else {
      Utility.errorMessage('Oops something went wrong');
    }
  }
}
