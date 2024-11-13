import 'package:flutter/widgets.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController(this.loginPresenter);

  final LoginPresenter loginPresenter;

  ///// =========== >>>>> Login Screen <<<<< =========== /////

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> logingFormkey = GlobalKey<FormState>();

  ///// =========== >>>>> Signup Screen <<<<< =========== /////
  
  GlobalKey<FormState> signUpFormkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController compleyNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

}
