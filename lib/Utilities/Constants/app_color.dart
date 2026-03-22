import 'package:flutter/material.dart';

class AppColor {
  static Color primary = const Color(0xff546252);
  static Color secondary = const Color(0xff002055);
  static Color headerColor = const Color(0xffB8E53E);
  static Color yellowColor = const Color(0xffFFB72B);
  static Color orangeDarkColor = const Color(0xffBF4B22);
  static Color bg = const Color(0xffF9FAFB);
  static Color backgroundColor = const Color(0xffF5F5F5);
  static Color offWhite = const Color(0xffF2F2F2);
  static Color gold = const Color(0xffe4aa69);
  static Color dividerColor = const Color(0xffECECEC);
  static Color inActiveColor = const Color(0xff002055).withValues(alpha: 0.15);
  static Color borderColor = const Color(0xffE9E9E9);
  static Color inActiveColorBar = const Color(0xff1E1E1E);
  static Color grey = Color(0xffA6A5A5);
  static Color babyBlue = Colors.lightBlueAccent;
  static Color blue = const Color(0xff002055);
  static Color greyWhite1 = const Color(0xffF6F6F6);
  static Color greyWhite = const Color(0xffA5A5A5);
  static Color fontGrey = const Color(0xffA6A5A5);
  static Color black = const Color(0xff031626);
  static Color green = const Color(0xff93B732);
  static Color blackOpacity = Colors.black54;
  static Color white = Colors.white;
  static Color notifyColor = Colors.black54;

  static getGradient({List<double>? stops, List<Color>? colors}) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: colors ?? [Color(0xffFE8769), Color(0xff293767)],
      stops: stops ?? [0.1, 0.7],
    );
  }
  static getGradientMap({List<double>? stops, List<Color>? colors}) {
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: colors ?? [Color(0xff111932), Color(0xff293767)],
      stops: stops ?? [0.0, 1],
    );
  }
  static getBlueGradient({List<double>? stops, List<Color>? colors}) {
    return LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: colors ?? [Color(0xff293767), Color(0xff4A5EA3)],
      stops: stops ?? [0.1, 0.7],
    );
  }

  static LinearGradient interestGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff8B9EE0).withValues(alpha: .5),
      Color(0xff4C567A).withValues(alpha: .5),
    ],
    stops: [0.53, 1],
  );
  static LinearGradient profileGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffE7D6C9).withValues(alpha: .5),
      Color(0xff8B9EE0).withValues(alpha: .5),
    ],
    stops: [0, 1],
  );
  static LinearGradient dropDwonMenu = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topLeft,
    colors: [
      Color(0x1ae7d6c9),
      Color(0x1afe8769),
    ],
    stops: [0, 1],
  );
}

