import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillIndigoA400 => BoxDecoration(
        color: ColorConstant.indigoA400,
      );
  static BoxDecoration get fillIndigo800 => BoxDecoration(
        color: ColorConstant.indigo800,
      );
  static BoxDecoration get fillPinkA100 => BoxDecoration(
        color: ColorConstant.pinkA100,
      );
  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: ColorConstant.black900,
      );
  static BoxDecoration get txtFillBlueA700 => BoxDecoration(
        color: ColorConstant.blueA700,
      );
  static BoxDecoration get fillWhiteA70051 => BoxDecoration(
        color: ColorConstant.whiteA70051,
      );
  static BoxDecoration get fillBlueA700 => BoxDecoration(
        color: ColorConstant.blueA700,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder17 = BorderRadius.circular(
    getHorizontalSize(
      17,
    ),
  );

  static BorderRadius customBorderTL6 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        6,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        6,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        5,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        6,
      ),
    ),
  );

  static BorderRadius txtRoundedBorder17 = BorderRadius.circular(
    getHorizontalSize(
      17,
    ),
  );
}
