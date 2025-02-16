import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.appBg,
        body: Center(
          child: Image.asset(
            AssetConstants.kirshina,
            height: double.infinity,
            width: double.infinity,
            repeat: ImageRepeat.repeat,

          ),
        ),
      ),
    );
  }
}
