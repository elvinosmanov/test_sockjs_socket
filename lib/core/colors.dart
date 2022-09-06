import 'package:flutter/material.dart';

const Color kBackgroundColor1 = Color(0xFFF7F8F9);
const Color kBackgroundColor2 = Color(0xFFF8F9FB);
const Color kBlackColor = Color(0xFF23374D);
const Color kWhiteColor = Color(0xFFFFFFFF);

const Color kRedColor = Color(0xFFE80F54);
const Color kBlueColor = Color(0xFF1089FF);

const Color kGreenColor = Color(0xFF00C564);
const Color kYellowColor = Color(0xFFF7AF22);

const Color kDarkGreyColor = Color(0xFF020057);
const Color kGreyColor = Color(0xFFA7AEBB);
const Color kLightGreyColor = Color(0xFFE1E4E8);

const Color kPurpleColor = Color(0xFF694BFF);
const Color kLightPurpleColor = Color(0xFFB4A5FF);

const Color kBorderColor = Color(0xFFE1E4E8);

const int _kDarkBrandColor = 0xFF694BFF; //kPurpleColor
const int _kLightBrandColor = 0xFFFF79FF;
const int _kAccentV1Color = 0xFFABDBD5;
const int _kAccentV2Color = 0xFFF4D2B2;
const int _kDarkGrayColor = 0xFF020057;//kDarkGreyColor
const int _kLightGrayColor = 0xFFA7AEBB;//kGreyColor
const int _kInformationColor = 0xFF00A6FB;
const int _kSuccessColor = 0xFF30C862;
const int _kWarningColor = 0xFFFED449;
const int _kFailColor = 0xFFFE5157;

const MaterialColor kDarkBrandColor = MaterialColor(
  _kDarkBrandColor,
  <int, Color>{
    25: Color(0xFFF0EDFF),
    50: Color(0xFFE1DBFF),
    100: Color(0xFFD2C9FF),
    200: Color(0xFFC3B7FF),
    300: Color(0xFFB4A5FF),
    400: Color(0xFFA593FF),
    500: Color(0xFF8E78FF),
    600: Color(0xFF7B61FF),
    700: Color(_kDarkBrandColor),
    800: Color(0xFF543CCC),
    900: Color(0xFF3F2D99),
  },
);

const MaterialColor kLightBrandColor = MaterialColor(
  _kLightBrandColor,
  <int, Color>{
    25: Color(0xFFFFF2FF),
    50: Color(0xFFFFE4FF),
    100: Color(0xFFFFD7FF),
    200: Color(0xFFFFC9FF),
    300: Color(0xFFFFBCFF),
    400: Color(0xFFFFAFFF),
    500: Color(0xFFFF9AFF),
    600: Color(0xFFFF89FF),
    700: Color(_kLightBrandColor),
    800: Color(0xFFCC61CC),
    900: Color(0xFF994999),
  },
);

const MaterialColor kAccentV1Color = MaterialColor(
  _kAccentV1Color,
  <int, Color>{
    25: Color(0xFFF7FBFB),
    50: Color(0xFFEEF8F7),
    100: Color(0xFFE6F4F2),
    200: Color(0xFFDDF1EE),
    300: Color(0xFFD5EDEA),
    400: Color(0xFFCDE9E6),
    500: Color(0xFFC0E4DF),
    600: Color(0xFFB5DFDA),
    700: Color(_kAccentV1Color),
    800: Color(0xFF89AFAA),
    900: Color(0xFF678380),
  },
);
const MaterialColor kAccentV2Color = MaterialColor(
  _kAccentV2Color,
  <int, Color>{
    25: Color(0xFFFEFBF7),
    50: Color(0xFFFDF6F0),
    100: Color(0xFFFCF2E8),
    200: Color(0xFFFBEDE0),
    300: Color(0xFFF9E8D8),
    400: Color(0xFFF8E4D1),
    500: Color(0xFFF7DDC5),
    600: Color(0xFFF5D7BB),
    700: Color(_kAccentV2Color),
    800: Color(0xFFC3A88E),
    900: Color(0xFF927E6B),
  },
);
const MaterialColor kDarkGrayColor = MaterialColor(
  _kDarkGrayColor,
  <int, Color>{
    25: Color(0xFFE6E6EE),
    50: Color(0xFFCCCCDD),
    100: Color(0xFFB3B3CD),
    200: Color(0xFF9A99BC),
    300: Color(0xFF8080AB),
    400: Color(0xFF67669A),
    500: Color(0xFF414081),
    600: Color(0xFF201F6B),
    700: Color(_kDarkGrayColor),
    800: Color(0xFF020046),
    900: Color(0xFF010034),
  },
);
const MaterialColor kLightGrayColor = MaterialColor(
  _kLightGrayColor,
  <int, Color>{
    25: Color(0xFFF5F6F7),
    50: Color(0xFFEBEDF0),
    100: Color(0xFFE1E4E8),
    200: Color(0xFFD7DAE0),
    300: Color(0xFFCDD1D9),
    400: Color(0xFFC3C8D1),
    500: Color(0xFFBABFCA),
    600: Color(0xFFB0B6C2),
    700: Color(_kLightGrayColor),
    800: Color(0xFF667185),
    900: Color(0xFF333842),
  },
);
const MaterialColor kInformationColor = MaterialColor(
  _kInformationColor,
  <int, Color>{
    25: Color(0xFFE2F5FF),
    50: Color(0xFFC5ECFF),
    100: Color(0xFFA8E2FF),
    200: Color(0xFF8BD8FF),
    300: Color(0xFF6FCFFF),
    400: Color(0xFF52C5FF),
    500: Color(0xFF35BCFF),
    600: Color(0xFF18B2FF),
    700: Color(_kInformationColor),
    800: Color(0xFF0088DD),
    900: Color(0xFF006ABF),
  },
);
const MaterialColor kSuccessColor = MaterialColor(
  _kSuccessColor,
  <int, Color>{
    25: Color(0xFFE8F9EE),
    50: Color(0xFFD0F4DC),
    100: Color(0xFFB9EECB),
    200: Color(0xFFA2E8B9),
    300: Color(0xFF8BE3A8),
    400: Color(0xFF73DD97),
    500: Color(0xFF5CD885),
    600: Color(0xFF45D274),
    700: Color(_kSuccessColor),
    800: Color(0xFF12AA44),
    900: Color(0xFF008C26),
  },
);
const MaterialColor kWarningColor = MaterialColor(
  _kWarningColor,
  <int, Color>{
    25: Color(0xFFFFFAEB),
    50: Color(0xFFFFF5D6),
    100: Color(0xFFFFF1C2),
    200: Color(0xFFFFECAE),
    300: Color(0xFFFEE79A),
    400: Color(0xFFFEE285),
    500: Color(0xFFFEDD71),
    600: Color(0xFFFED85D),
    700: Color(_kWarningColor),
    800: Color(0xFFE0B62B),
    900: Color(0xFFC2980D),
  },
);
const MaterialColor kFailColor = MaterialColor(
  _kFailColor,
  <int, Color>{
    25: Color(0xFFFFECEC),
    50: Color(0xFFFFD9DA),
    100: Color(0xFFFFC5C7),
    200: Color(0xFFFFB2B5),
    300: Color(0xFFFF9FA2),
    400: Color(0xFFFE8C90),
    500: Color(0xFFFE797D),
    600: Color(0xFFFE666B),
    700: Color(_kFailColor),
    800: Color(0xFFE03339),
    900: Color(0xFFC2151B),
  },
);
