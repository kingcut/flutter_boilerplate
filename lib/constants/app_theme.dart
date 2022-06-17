/// Resource:
/// A good resource would be this website: http://mcg.mbitson.com/
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/colors.dart';
import 'package:flutter_boilerplate/constants/font_family.dart';

final ThemeData themeData = ThemeData(
    fontFamily: FontFamily.productSans,
    brightness: Brightness.light,
    primaryColor: AppColors.orange[500],
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.orange[500]));

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.productSans,
  brightness: Brightness.dark,
  primaryColor: AppColors.orange[500],
);
