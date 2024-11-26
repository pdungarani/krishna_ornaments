import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/routes_management.dart';
import 'package:krishna_ornaments/data/helpers/helpers.dart';
import 'package:krishna_ornaments/domain/models/login_model.dart';
import 'package:krishna_ornaments/domain/repositories/repositories.dart';

class LoginController extends GetxController {
  LoginController(this.loginPresenter);

  final LoginPresenter loginPresenter;

  ///// =========== >>>>> Login Screen <<<<< =========== /////

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> logingFormkey = GlobalKey<FormState>();

  LoginModel? loginData;

  Future<void> loginApi({
    required String emailController,
    required String mobileController,
  }) async {
    var response = await loginPresenter.loginApi(
      mobile: emailController,
      password: mobileController,
      fcm: '',
      isLoading: true,
    );
    loginData = null;
    if (response?.data != null) {
      loginData = response;
      Get.find<Repository>()
          .saveValue(LocalKeys.authToken, response?.data?.accessToken);
      RouteManagement.goToBottomBarView();
      update();
    } else {
      Utility.errorMessage('Oops something went wrong');
    }
  }

  ///// =========== >>>>> Signup Screen <<<<< =========== /////

  GlobalKey<FormState> signUpFormkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController compleyNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> registerApi() async {
    var response = await loginPresenter.registerApi(
      city: cityController.text,
      countryCode: '',
      mobile: mobileNumberController.text,
      countryWiseContact: CountryWiseContact(
        number: 'number',
        internationalNumber: 'internationalNumber',
        nationalNumber: 'nationalNumber',
        e164Number: 'e164Number',
        countryCode: 'countryCode',
        dialCode: 'dialCode',
      ),
      password: passwordController.text,
      name: nameController.text,
      email: emailController.text,
      companyname: compleyNameController.text,
      isLoading: true,
    );
    if (response?.data != null) {
      Utility.showDialog(response?.message ?? '');
      update();
    }
  }
}
