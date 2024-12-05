import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:krishna_ornaments/app/widgets/appbar_widgets.dart';

class BankDetailScreen extends StatelessWidget {
  const BankDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.appBg,
      appBar: AppBarWidget(
        onTapBack: () {},
        title: "Bank Detail",
        isVisible: false,
      ),
      body: Column(
        children: [
          CustomTextFormField(
            text: 'Account Holder Name',
            readOnly: true,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(AssetConstants.copyIcon),
            ),
          ),
          Text("data"),
          Dimens.boxHeight10,
          Text("data"),
        ],
      ),
    );
  }
}
