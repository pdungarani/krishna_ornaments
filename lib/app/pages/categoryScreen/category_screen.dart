import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:krishna_ornaments/app/app.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: Dimens.edgeInsets20_20.copyWith(bottom: 30),
            child: Column(
              children: [
                Dimens.boxHeight20,
                Text(
                  "Categories",
                  style: Styles.color01010170020,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: context.height / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimens.twelve,
                        ),
                        color: ColorsValue.redColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
