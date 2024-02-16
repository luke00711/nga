import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


TextStyle SPMyTextStyle({
  String? fontFamily,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  String? package,
  double? height,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? decorationStyle,
  Color? decorationColor,
  double? decorationThickness,
  bool useSc = false
}) {

  return TextStyle(
    fontStyle:fontStyle,
    fontFamily: useSc ? "PingFangSC" : fontFamily,
    color: color,
    fontSize: fontSize ?? 14.sp,
    fontWeight: fontWeight,
    package: package,
    height: height,
    wordSpacing: wordSpacing,
    decoration: decoration,
    decorationStyle: decorationStyle,
    decorationColor: decorationColor,
    decorationThickness: decorationThickness,
  );
}

TextStyle titleColorAndFontSize16W500Style() {
  return SPMyTextStyle(

    fontSize: 16.sp,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w500,
  );
}

TextStyle titleStyle({double? fontsize  }) {
  return SPMyTextStyle(
    color: Colors.black,
    decoration: TextDecoration.none,
    fontSize: fontsize ?? 14.sp
  );
}

TextStyle titleStyleW600({double? fontsize}) {
  return SPMyTextStyle(
      color: Colors.black,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w600,
      fontSize: fontsize ?? 14.sp
  );
}


