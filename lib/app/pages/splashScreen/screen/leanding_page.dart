import 'package:flutter/material.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/navigators/routes_management.dart';
import 'package:krishna_ornaments/app/widgets/custom_button.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: Dimens.edgeInsets20,
          physics: ClampingScrollPhysics(),
          children: [
            Image.asset(
              AssetConstants.app_logo,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Dimens.boxHeight20,
            Text(
              "Exclusive Jewelry Collection",
              style: Styles.txtBlackColorW60024,
              textAlign: TextAlign.center,
            ),
            Dimens.boxHeight10,
            Text(
              "Welcome to our private jewelry collection, available only to approved members.\n"
              "We design and manufacture unique luxury jewelry, accessible exclusively through this app.\n"
              "To protect our original designs, only verified users can browse and place orders.",
              style: Styles.grey94A3B850014,
              textAlign: TextAlign.center,
            ),
            Dimens.boxHeight20,
            Text(
              "🔒 How to Get Access?",
              style: Styles.appColor70018,
            ),
            Dimens.boxHeight10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "✅ 1. Register your details",
                  style: Styles.txtBlackColorW50014,
                ),
                Text(
                  "✅ 2. Wait for admin approval",
                  style: Styles.txtBlackColorW50014,
                ),
                Text(
                  "✅ 3. Once approved, access our jewelry catalog",
                  style: Styles.txtBlackColorW50014,
                ),
              ],
            ),
            Dimens.boxHeight30,
            CustomButton(
              height: Dimens.fourtyFive,
              backgroundColor: ColorsValue.appColor,
              text: 'Request Access',
              onTap: () {
                RouteManagement.goToSignupView();
              },
            ),
            Dimens.boxHeight40,
          ],
        ),
      ),
    );
  }
}
