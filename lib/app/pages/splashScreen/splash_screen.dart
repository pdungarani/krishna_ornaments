import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.whiteColor,
        body: Center(
          child: Image.asset(
            AssetConstants.app_logo,
            height: Dimens.hundred,
            width: Dimens.hundred,
          ),
        ),
      ),
    );
  }
}
