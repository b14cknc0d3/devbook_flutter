import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color deepPurpleA10051 = fromHex('#51a873ff');

  static Color indigo900B2 = fromHex('#b2263870');

  static Color whiteA700Cc = fromHex('#ccffffff');

  static Color indigo90066 = fromHex('#66263870');

  static Color deepPurpleA100 = fromHex('#a873ff');

  static Color indigo900 = fromHex('#263870');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
