import 'dart:io';

import 'package:another_stepper/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/domain/domain.dart';

class ProfileController extends GetxController {
  ProfileController(this.profilePresenter);

  final ProfilePresenter profilePresenter;

  GetProfileData? getProfileModel;

  Future<void> getProfile() async {
    var response = await profilePresenter.getProfile(
      isLoading: true,
    );
    getProfileModel = null;
    if (response != null) {
      getProfileModel = response.data;
      update();
    } else {
      Utility.errorMessage(response?.message ?? "");
    }
  }

  // String? profileImage;
  // final picker = ImagePicker();

  // Future selectProfilePic() async {
  //   final pickedFile = await picker.pickImage(
  //     source: ImageSource.gallery,
  //   );

  //   if (pickedFile != null) {
  //     if (Utility.getImageSizeMB(pickedFile.path) <= 5) {
  //       profileImage = await profilePresenter.postUploadProfile(
  //         filePath: pickedFile.path,
  //         isLoading: true,
  //       );
  //       update();
  //     } else {
  //       Utility.errorMessage("max_5_mb_img_error".tr);
  //     }
  //   }
  //   update();
  // }

  TextEditingController holderName = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController branchName = TextEditingController();
  TextEditingController acNumber = TextEditingController();
  TextEditingController IFSCcode = TextEditingController();

  File? imageFile;
  final pickerProfile = ImagePicker();

  Future setProfilePic() async {
    final pickedFile =
        await pickerProfile.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      print(">>>>>>>>>>>>>> File Path ${imageFile?.path}");
      print(
          ">>>>>>>>>>>>>> Splited File Path ${imageFile?.path.split("/").last}");
      final profileImage = await profilePresenter.postUploadProfile(
        filePath: imageFile?.path ?? '',
      );
    }
    update();
  }
}
