import 'dart:convert';
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
                              selectPic(ImageSource.gallery);
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
                              selectPic(ImageSource.camera);
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
  RepairOrderUploadImageData? reapirUploadData;

  Future selectPic(ImageSource sourcePic) async {
    final pickedFile = await pickerProfile.pickImage(
      source: sourcePic,
    );

    if (pickedFile != null) {
      if (Utility.getImageSizeMB(pickedFile.path) <= 10) {
        imageFile = File(pickedFile.path);
        var response = await repairPresenter.repairOrderImage(
          filePath: pickedFile.path,
          isLoading: true,
        );
        reapirUploadData = null;
        if (response?.data != null) {
          reapirUploadData = response?.data;
          RouteManagement.goToRepairDetailsScreen();
        }
      } else {
        Utility.errorMessage("max_10_mb_img".tr);
      }
    }
    update();
  }

  String selectSamplePic = "";
  List<SampleOrderImageDatum> imageList = [];
  final picker = ImagePicker();

  Future sampleOrderImage() async {
    final List<XFile> selectedImages =
        await picker.pickMultiImage(imageQuality: 5);

    if (selectedImages.isNotEmpty) {
      for (var images in selectedImages) {
        if (Utility.getImageSizeMB(images.path) <= 10) {
          if (imageList.length < 5) {
            var response = await repairPresenter.sampleOrderImage(
              filePath: images.path,
              isLoading: true,
            );
            if (response != null) {
              imageList.addAll(response.data ?? []);
              RouteManagement.goToSampleOrderScreen();
            }
            update();
          } else {
            Utility.errorMessage('Maximum 5 Photos Upload'.tr);
          }
        } else {
          Utility.errorMessage("max_10_mb_img".tr);
        }
      }
    }
    update();
  }

  int selectQuantity = 1;
  Future<void> postSampleOrder() async {
    var response = await repairPresenter.postSampleOrder(
      images: imageList,
      totalQuantity: selectQuantity,
      description: descriptionSampleController.text,
      isLoading: true,
    );
    if (response?.statusCode == 200) {
      RouteManagement.goToBottomBarView();
      update();
    } else {
      Utility.errorMessage(
          jsonDecode(response?.data.toString() ?? "")["Message"]);
    }
  }

  Future<void> postRepairOrder() async {
    var response = await repairPresenter.postRepairOrder(
      file: reapirUploadData?.fileId ?? "",
      description: descriptionController.text,
      isLoading: true,
    );
    if (response?.statusCode == 200) {
      RouteManagement.goToBottomBarView();
      update();
    }
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  GlobalKey<FormState> desKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> sampleKey = GlobalKey<FormState>();
  TextEditingController descriptionSampleController = TextEditingController();

  PagingController<int, RepairOrderHistoryDoc> repairOrderPagingController =
      PagingController(firstPageKey: 1);

  List<RepairOrderHistoryDoc> repairOrderList = [];
  int repairLimit = 10;

  Future<void> repairOrderListData(pageKey) async {
    var response = await repairPresenter.repairOrderList(
      page: pageKey,
      limit: repairLimit,
      isLoading: true,
    );
    if (response != null) {
      if (pageKey == 1) {
        repairOrderList.clear();
      }
      repairOrderList = response.data?.docs ?? [];

      final isLastPage = repairOrderList.length < repairLimit;
      if (isLastPage) {
        repairOrderPagingController.appendLastPage(repairOrderList);
      } else {
        var nextPageKey = pageKey + 1;
        repairOrderPagingController.appendPage(repairOrderList, nextPageKey);
      }
      update();
    }
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

  PagingController<int, SampleOrderHistoryDoc> smaplePagingController =
      PagingController(firstPageKey: 1);

  List<SampleOrderHistoryDoc> smapleListModel = [];
  int smapleLimit = 10;

  Future<void> postSampleOrderHistory(int pageKey) async {
    var response = await repairPresenter.postSampleOrderHistory(
      page: pageKey,
      limit: smapleLimit,
      isLoading: false,
    );
    if (response != null) {
      if (pageKey == 1) {
        smapleListModel.clear();
      }
      smapleListModel = response.data?.docs ?? [];

      final isLastPage = smapleListModel.length < smapleLimit;
      if (isLastPage) {
        smaplePagingController.appendLastPage(smapleListModel);
      } else {
        var nextPageKey = pageKey + 1;
        smaplePagingController.appendPage(smapleListModel, nextPageKey);
      }
      update();
    }
  }

  GetOneSampleData? getOneSampleData = GetOneSampleData();

  String sampleOrderId = "";

  Future<void> getOneSample() async {
    var response = await repairPresenter.getOneSample(
      sampleOrderId: sampleOrderId,
      isLoading: false,
    );
    getOneSampleData = null;
    if (response != null) {
      getOneSampleData = response.data;
      update();
    }
  }
}
