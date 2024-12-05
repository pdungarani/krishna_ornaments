import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/navigators.dart';
import 'package:krishna_ornaments/device/device.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      initState: (state) {
        var controller = Get.find<ProfileController>();
        controller.getProfile();
      },
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding: Dimens.edgeInsets20,
              child: Stack(
                children: [
                  Padding(
                    padding: Dimens.edgeInsetsTop60,
                    child: Container(
                      height: Dimens.hundredThirtySix,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: ColorsValue.blackEEEAEA,
                        borderRadius: BorderRadius.circular(
                          Dimens.sixteen,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            controller.getProfileModel?.name ?? ' - ',
                            style: Styles.blackW80018,
                          ),
                          Dimens.boxHeight5,
                          Text(
                            controller.getProfileModel?.email ?? 'email',
                            style: Styles.color21212170014,
                          ),
                          Dimens.boxHeight25
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (await Utility.imagePermissionCheack(context)) {
                          controller.setProfilePic();
                        }
                      },
                      child: SizedBox(
                        height: Dimens.hundredTen,
                        width: Dimens.hundredTen,
                        child: Stack(
                          children: [
                            Container(
                              height: Dimens.hundredTen,
                              width: Dimens.hundredTen,
                              decoration: BoxDecoration(
                                color: ColorsValue.greyD9D9D9,
                                borderRadius: BorderRadius.circular(
                                  Dimens.twoHundred,
                                ),
                                border: Border.all(
                                  width: 5,
                                  color: ColorsValue.greyF4F4F5,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  Dimens.twoHundred,
                                ),
                                child: CachedNetworkImage(
                                  height: Dimens.hundredTen,
                                  width: Dimens.hundredTen,
                                  imageUrl:
                                      controller.getProfileModel?.profilePic ??
                                          (controller.imageFile?.path ?? ''),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) {
                                    return SvgPicture.asset(
                                      AssetConstants.usera,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return SvgPicture.asset(
                                      AssetConstants.usera,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: Dimens.thirty,
                                width: Dimens.thirty,
                                decoration: BoxDecoration(
                                  color: ColorsValue.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    Dimens.hundred,
                                  ),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: ColorsValue.black010101,
                                  size: Dimens.twenty,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: Dimens.edgeInsets20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Dimens.sixty,
                    decoration: BoxDecoration(
                      color: ColorsValue.blackEEEAEA,
                      borderRadius: BorderRadius.circular(
                        Dimens.sixteen,
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        contentPadding: Dimens.edgeInsets20_00_20_00,
                        leading: SvgPicture.asset(
                          AssetConstants.ic_call,
                        ),
                        title: Text(
                          controller.getProfileModel?.mobile ??
                              "+91 1234567890",
                          style: Styles.color21212160014,
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,
                  Divider(
                    height: Dimens.one,
                    color: ColorsValue.greyD9D9D9,
                  ),
                  Dimens.boxHeight20,
                  InkWell(
                    onTap: () {
                      RouteManagement.goToOrderScreen();
                    },
                    child: Container(
                      height: Dimens.sixty,
                      decoration: BoxDecoration(
                        color: ColorsValue.blackEEEAEA,
                        borderRadius: BorderRadius.circular(
                          Dimens.sixteen,
                        ),
                      ),
                      child: Center(
                        child: ListTile(
                          contentPadding: Dimens.edgeInsets20_00_20_00,
                          trailing: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorsValue.colorA7A7A7,
                          ),
                          leading: SvgPicture.asset(
                            AssetConstants.ic_block,
                          ),
                          title: Text(
                            "order_history".tr,
                            style: Styles.color21212160014,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,
                  InkWell(
                    onTap: () => RouteManagement.goToRepairOrderHistoryScreen(),
                    child: Container(
                      height: Dimens.sixty,
                      decoration: BoxDecoration(
                        color: ColorsValue.blackEEEAEA,
                        borderRadius: BorderRadius.circular(
                          Dimens.sixteen,
                        ),
                      ),
                      child: Center(
                        child: ListTile(
                          contentPadding: Dimens.edgeInsets20_00_20_00,
                          trailing: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorsValue.colorA7A7A7,
                          ),
                          leading: SvgPicture.asset(
                            AssetConstants.ic_repair,
                          ),
                          title: Text(
                            "repair_order_history".tr,
                            style: Styles.color21212160014,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,
                  InkWell(
                    onTap: () => RouteManagement.goToBankDetailScreen(),
                    child: Container(
                      height: Dimens.sixty,
                      decoration: BoxDecoration(
                        color: ColorsValue.blackEEEAEA,
                        borderRadius: BorderRadius.circular(
                          Dimens.sixteen,
                        ),
                      ),
                      child: Center(
                        child: ListTile(
                          contentPadding: Dimens.edgeInsets20_00_20_00,
                          trailing: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorsValue.colorA7A7A7,
                          ),
                          leading: SvgPicture.asset(
                            AssetConstants.ic_bank,
                          ),
                          title: Text(
                            "bank_details".tr,
                            style: Styles.color21212160014,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,
                  InkWell(
                    onTap: () {
                      RouteManagement.goToSampleOrderHistoryScreen();
                    },
                    child: Container(
                      height: Dimens.sixty,
                      decoration: BoxDecoration(
                        color: ColorsValue.blackEEEAEA,
                        borderRadius: BorderRadius.circular(
                          Dimens.sixteen,
                        ),
                      ),
                      child: Center(
                        child: ListTile(
                          contentPadding: Dimens.edgeInsets20_00_20_00,
                          trailing: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorsValue.colorA7A7A7,
                          ),
                          leading: SvgPicture.asset(
                            AssetConstants.ic_sample,
                          ),
                          title: Text(
                            "sample_order_history".tr,
                            style: Styles.color21212160014,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,
                  Container(
                    height: Dimens.sixty,
                    decoration: BoxDecoration(
                      color: ColorsValue.blackEEEAEA,
                      borderRadius: BorderRadius.circular(
                        Dimens.sixteen,
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        onTap: () async {
                          await Get.dialog(
                            Material(
                              color: ColorsValue.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: Dimens.edgeInsets20_00_20_00,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(Dimens.sixteen),
                                          ),
                                          color: ColorsValue.whiteColor),
                                      width: Get.width,
                                      child: Padding(
                                        padding: Dimens.edgeInsets30_30_30_20,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              'AssetConstants.ic_logout',
                                              height: Dimens.sixtyFour,
                                              width: Dimens.sixtyFour,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                ColorsValue.redColor,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            Dimens.boxHeight20,
                                            Text(
                                              "Are you sure you want to\nLogout?"
                                                  .tr,
                                              style: Styles.black221W70018,
                                              textAlign: TextAlign.center,
                                            ),
                                            Dimens.boxHeight20,
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      fixedSize: Size(
                                                          double.infinity,
                                                          Dimens.fourtyFive),
                                                      backgroundColor:
                                                          ColorsValue
                                                              .primaryColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    Dimens.six),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      "cancle".tr.toUpperCase(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Styles
                                                          .txtBlackColorW60016,
                                                    ),
                                                  ),
                                                ),
                                                Dimens.boxWidth15,
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      fixedSize: Size(
                                                          double.infinity,
                                                          Dimens.fourtyFive),
                                                      backgroundColor:
                                                          ColorsValue.redColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    Dimens.six),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Get.find<
                                                              DeviceRepository>()
                                                          .deleteBox();
                                                      RouteManagement
                                                          .goToLoginView();
                                                    },
                                                    child: Text(
                                                      "logout".tr.toUpperCase(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Styles.whiteW60016,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        contentPadding: Dimens.edgeInsets20_00_20_00,
                        leading: SvgPicture.asset(
                          AssetConstants.ic_logout,
                        ),
                        title: Text(
                          "logout".tr,
                          style: Styles.color21212160014,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
