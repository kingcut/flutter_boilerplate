/// Resource:
/// A good resource would be this website: http://mcg.mbitson.com/
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/colors.dart';

final ThemeData themeData = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColor: AppColors.orange[500],
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.orange[900],
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: AppColors.blackWhite,
        displayColor: AppColors.blackWhite,
        decorationColor: AppColors.blackWhite,
      ),
);
