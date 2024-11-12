import 'package:krishna_ornaments/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logingscreen extends StatelessWidget {
  const Logingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => Scaffold(
            backgroundColor: ColorsValue.whiteColor,
            body: Center(
              child: Text("data"),
            )));
  }
}
