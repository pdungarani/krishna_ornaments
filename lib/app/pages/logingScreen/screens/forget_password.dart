import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/custom_button.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        // bottomNavigationBar: Align(
        //   alignment: Alignment.bottomCenter,
        //   child: CustomButton(
        //     text: 'Recover Password',
        //     onTap: () {},
        //   ),
        // ),
        backgroundColor: ColorsValue.primaryColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width,
                height: context.height * 0.5,
                child: SvgPicture.asset(
                  AssetConstants.forgotMainView,
                  fit: BoxFit.cover,
                ),
              ),
              Dimens.boxHeight40,
              Padding(
                padding: Dimens.edgeInsets20_0_20_0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.forgot_password,
                      style: Styles.primaryBold28,
                    ),
                    Dimens.boxHeight12,
                    Text(
                      "Enter your email and we'll send you your old password",
                      style: Styles.black40016,
                    ),
                    Dimens.boxHeight40,
                    const CustomTextFormField(
                      text: 'Email',
                      hintText: "Enter Your Email",
                      fillColor: ColorsValue.colorEEEAEA,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
