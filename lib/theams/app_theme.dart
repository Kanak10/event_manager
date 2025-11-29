import 'package:event_manager/theams/app_colors.dart';
import 'package:event_manager/theams/app_text_theme.dart';
import 'package:flutter/material.dart';

// https://medium.com/flutter-community/themes-in-flutter-part-1-75f52f2334ea
final ThemeData appThemeData = ThemeData(
  useMaterial3: false,
  primaryColor: primaryColor,
  primarySwatch: primarySwatchColor2,
  fontFamily: "Hind Madurai",
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  textTheme: appTextTheam,
  cardTheme: CardThemeData(
    color: whiteColor,
    surfaceTintColor: Colors.transparent
  ),
  tabBarTheme: TabBarThemeData(
    labelColor: whiteColor,
    unselectedLabelColor: whiteColor
  ),
  //buttonColor: primaryColor,
  disabledColor: disableColor,
);
