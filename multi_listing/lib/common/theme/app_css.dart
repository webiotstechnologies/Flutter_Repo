import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_listing/common/extension/text_style_extensions.dart';
part 'scale.dart';

class AppCss {
  //monterrat font
  static TextStyle montserrat = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    letterSpacing: 0,
    height: 1,
  );

  //ubuntu font
  static TextStyle ubuntu = TextStyle(
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1,
  );


  // Ubuntu
  static TextStyle get ubuntuMedium20 => ubuntu.medium.size(FontSizes.f20);

  //Text Style montserrat extra bold
  static TextStyle get montserratExtraBold65 => montserrat.extraThickBold.size(FontSizes.f65);
  static TextStyle get montserratExtraBold15 => montserrat.extraThickBold.size(FontSizes.f14);


  static TextStyle get montserratBlack65 => montserrat.black.size(FontSizes.f65);
  static TextStyle get montserratBlack30 => montserrat.black.size(FontSizes.f30);
  static TextStyle get montserratBlack40 => montserrat.black.size(FontSizes.f40);
  static TextStyle get montserratBlack50 => montserrat.black.size(FontSizes.f50);

  //Text Style montserrat bold
  static TextStyle get montserratblack24 => montserrat.black.size(FontSizes.f24);

  //Text Style montserrat bold
  static TextStyle get montserratExtraBold18 => montserrat.extraBold.size(FontSizes.f18);
  static TextStyle get montserratExtraBold11 => montserrat.extraBold.size(FontSizes.f11);
  //Text Style semi montserrat bold
  static TextStyle get montserratBold50 => montserrat.bold.size(FontSizes.f50);

  static TextStyle get montserratSemiBold16=> montserrat.semiBold.size(FontSizes.f16);
  static TextStyle get montserratSemiBold10=> montserrat.semiBold.size(FontSizes.f10);
  static TextStyle get montserratSemiBold14=> montserrat.semiBold.size(FontSizes.f14);
  static TextStyle get montserratSemiBold11=> montserrat.semiBold.size(FontSizes.f11);
  static TextStyle get montserratSemiBold12=> montserrat.semiBold.size(FontSizes.f12);
  static TextStyle get montserratSemiBold20=> montserrat.semiBold.size(FontSizes.f20);

  //Text Style montserrat medium
  static TextStyle get montserratMedium28 => montserrat.medium.size(FontSizes.f28);
  static TextStyle get montserratMedium16 => montserrat.medium.size(FontSizes.f16);
  static TextStyle get montserratMedium14 => montserrat.medium.size(FontSizes.f14);
  static TextStyle get montserratMedium12 => montserrat.medium.size(FontSizes.f12);
  static TextStyle get montserratMedium13 => montserrat.medium.size(FontSizes.f13);
  static TextStyle get montserratMedium11 => montserrat.medium.size(FontSizes.f11);
  static TextStyle get montserratMedium10 => montserrat.medium.size(FontSizes.f10);

  //Text Style montserrat regular
  static TextStyle get montserratRegular18 => montserrat.regular.size(FontSizes.f18);
  static TextStyle get montserratRegular14 => montserrat.regular.size(FontSizes.f14);
  static TextStyle get montserratRegular12 => montserrat.regular.size(FontSizes.f12);

  static TextStyle get montserratRegular16 => montserrat.regular.size(FontSizes.f16);


}
