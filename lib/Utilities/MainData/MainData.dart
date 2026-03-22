import 'package:flutter/material.dart';

import '../Constants/app_color.dart';

class MainData {
  static String chatUrl = "https://harajawamer.ip4s.com/chatHub";

  static ThemeData defaultThem = ThemeData(
    primarySwatch: Colors.grey,
    focusColor: AppColor.primary,
    primaryColor: AppColor.primary,
    fontFamily: "Manrope",

    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,

    ).copyWith(
      primary: AppColor.primary,
      secondary: AppColor.white, // Replaces accentColor

    ),
    textTheme: TextTheme(

    ),

  );
}
