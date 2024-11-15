//coverage:ignore-file

import 'package:krishna_ornaments/app/app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A chunk of styles used in the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Styles {
  static String? fontFamily = globalVariable == 1 ? 'Product-Sans' : 'Avenir';

  static TextStyle blackBold12 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle black50014 = GoogleFonts.kumbhSans(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle color01010160018 = GoogleFonts.kumbhSans(
    color: ColorsValue.color010101,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.eighteen,
  );

  static TextStyle blackBold16 = GoogleFonts.montserrat(
    color: const Color(0xFF0A0A0A),
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );

  static TextStyle black50012 = GoogleFonts.montserrat(
    color: const Color(0xFF0A0A0A),
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle lightYellow40012 = GoogleFonts.montserrat(
    color: ColorsValue.lightYellow,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle white14 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle white23 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.twentyThree,
  );

  static TextStyle black12 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle primaryBold28 = GoogleFonts.montserrat(
      color: ColorsValue.lightYellow,
      fontSize: Dimens.twentyEight,
      fontWeight: FontWeight.w700);

  static TextStyle color4E4B6680014 = GoogleFonts.kumbhSans(
    color: ColorsValue.color4E4B66,
    fontWeight: FontWeight.w800,
    fontSize: Dimens.fourteen,
  );

  static TextStyle color21212150014 = GoogleFonts.kumbhSans(
    color: ColorsValue.color212121,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle txtRedBold10 = GoogleFonts.kumbhSans(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.ten,
  );

  static TextStyle color94A3B8W70016 = GoogleFonts.kumbhSans(
    color: ColorsValue.color94A3B8,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static TextStyle color9C9C9C40016 = GoogleFonts.kumbhSans(
    color: ColorsValue.color9C9C9C,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static TextStyle txtRedBold12 = GoogleFonts.kumbhSans(
    color: ColorsValue.redColor.withOpacity(0.7),
    fontWeight: FontWeight.w700,
    fontSize: Dimens.twelve,
  );

  static TextStyle txtWhite80018 = GoogleFonts.kumbhSans(
    color: ColorsValue.whiteColor,
    fontWeight: FontWeight.w800,
    fontSize: Dimens.eighteen,
  );

  static TextStyle black40016 = GoogleFonts.montserrat(
    color: const Color(0xFF0A0A0A),
    fontWeight: FontWeight.w400,
    fontSize: Dimens.fourteen,
  );

  static TextStyle greyAAA40014 = GoogleFonts.roboto(
    color: ColorsValue.greyAAAAAA,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.fourteen,
  );
}
