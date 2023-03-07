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

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
