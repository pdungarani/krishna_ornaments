import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
      ),
    );
  }
}
