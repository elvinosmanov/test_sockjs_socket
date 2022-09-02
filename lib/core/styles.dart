import 'package:flutter/material.dart';
import 'package:test_sockjs_socket/core/colors.dart';

const String fontFamily = "Inter";

///Default black color setted
TextStyle kBoldTextStyle(double fontSize, [Color? color]) {
  return TextStyle(
    fontFamily: fontFamily,
    color: color ?? kBlackColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
  );
}

///Default black color setted
TextStyle kSemiBoldTextStyle(double fontSize, [Color? color]) {
  return TextStyle(
    fontFamily: fontFamily,
    color: color ?? kBlackColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
  );
}

///Default black color setted
TextStyle kMediumTextStyle(double fontSize, [Color? color]) {
  return TextStyle(
    fontFamily: fontFamily,
    color: color ?? kBlackColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w500,
  );
}

TextStyle kRegularTextStyle(double fontSize, [Color? color]) {
  return TextStyle(
    fontFamily: fontFamily,
    color: color ?? kBlackColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
  );
}

final BorderRadius kRadius8 = BorderRadius.circular(8);
final BorderRadius kRadius16 = BorderRadius.circular(16);
