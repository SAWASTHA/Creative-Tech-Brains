import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color pinkA100 = fromHex('#ff77c7');

  static Color black900 = fromHex('#000000');

  static Color blue800 = fromHex('#0059d4');

  static Color bluegray400 = fromHex('#888888');

  static Color blueA700 = fromHex('#0066f2');

  static Color indigoA400 = fromHex('#5848ff');

  static Color indigo800 = fromHex('#323f7f');

  static Color whiteA700 = fromHex('#ffffff');

  static Color whiteA70051 = fromHex('#51ffffff');

  static Color lightBlue900 = fromHex('#005f9c');

  static Color pink300 = fromHex('#e4548f');

  static Color sss = fromHex('#5a82fc');

  static Color purple = fromHex('#504099');

  static Color docb = fromHex('#0e8e8e');

  static Color cal = fromHex('#2e2445');

  static Color orange = fromHex('#fd7b3c');

  static Color bluish = fromHex('#37a3a5');

  static Color pinkesh = fromHex('#ff0080');

  static Color withblack = fromHex('#150050');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
