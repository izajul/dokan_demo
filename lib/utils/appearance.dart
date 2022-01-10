import 'package:flutter/material.dart';

final theme = ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    fontFamily: "Roboto",
    brightness: Brightness.light,
    primarySwatch: MyColors.primary,
    primaryColor: MyColors.primary,
    backgroundColor: Colors.white,
    textTheme: textTheme,
    shadowColor: MyColors.shadow,
    indicatorColor: MyColors.textDark);

const textTheme = TextTheme(
  headline3: TextStyle(
      fontSize: 36.0, fontWeight: FontWeight.w700, color: MyColors.textDark),
  headline4: TextStyle(
      fontSize: 28.0, fontWeight: FontWeight.w700, color: MyColors.textDark),
  headline5: TextStyle(
      fontSize: 22.0, fontWeight: FontWeight.w700, color: MyColors.textDark),
  headline6: TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w700, color: MyColors.textDark),
  bodyText1: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: MyColors.textDark),
  bodyText2: TextStyle(fontSize: 14.0, color: MyColors.textDark),
  caption: TextStyle(fontSize: 12.0),
  subtitle1: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: MyColors.textDark,
  ),
  subtitle2: TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w500, color: MyColors.textDark),
  button: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w800, color: MyColors.textDark),
);

class MyColors {
  static const _textDark = 0xff383C40;
  static const _textHint = 0xffA4A9AF;
  static const _borderDark = 0xffD2DBE0;
  static const _shadow = 0xff4D5877;
  static const _primary = 0xffFF708A;
  static const _primaryAccent = 0xffF75F55;
  static const _successColor = 0xff1ABC9C;

  static const primary = MaterialColor(_primary, <int, Color>{
    50: Color.fromRGBO(255, 112, 138, .1),
    100: Color.fromRGBO(255, 112, 138, .2),
    200: Color.fromRGBO(255, 112, 138, .3),
    300: Color.fromRGBO(255, 112, 138, .4),
    400: Color.fromRGBO(255, 112, 138, .5),
    500: Color.fromRGBO(255, 112, 138, .6),
    600: Color.fromRGBO(255, 112, 138, .7),
    700: Color.fromRGBO(255, 112, 138, .8),
    800: Color.fromRGBO(255, 112, 138, .9),
    900: Color.fromRGBO(255, 112, 138, 1),
  });
  static const primaryAccent = MaterialColor(_primaryAccent, <int, Color>{
    50: Color.fromRGBO(247, 95, 85, .1),
    100: Color.fromRGBO(247, 95, 85, .2),
    200: Color.fromRGBO(247, 95, 85, .3),
    300: Color.fromRGBO(247, 95, 85, .4),
    400: Color.fromRGBO(247, 95, 85, .5),
    500: Color.fromRGBO(247, 95, 85, .6),
    600: Color.fromRGBO(247, 95, 85, .7),
    700: Color.fromRGBO(247, 95, 85, .8),
    800: Color.fromRGBO(247, 95, 85, .9),
    900: Color.fromRGBO(247, 95, 85, 1),
  });
  static const textDark = MaterialColor(_textDark, <int, Color>{
    50: Color.fromRGBO(56, 60, 64, .1),
    100: Color.fromRGBO(56, 60, 64, .2),
    200: Color.fromRGBO(56, 60, 64, .3),
    300: Color.fromRGBO(56, 60, 64, .4),
    400: Color.fromRGBO(56, 60, 64, .5),
    500: Color.fromRGBO(56, 60, 64, .6),
    600: Color.fromRGBO(56, 60, 64, .7),
    700: Color.fromRGBO(56, 60, 64, .8),
    800: Color.fromRGBO(56, 60, 64, .9),
    900: Color.fromRGBO(56, 60, 64, 1),
  });
  static const textHint = MaterialColor(_textHint, <int, Color>{
    50: Color.fromRGBO(164, 169, 175, .1),
    100: Color.fromRGBO(164, 169, 175, .2),
    200: Color.fromRGBO(164, 169, 175, .3),
    300: Color.fromRGBO(164, 169, 175, .4),
    400: Color.fromRGBO(164, 169, 175, .5),
    500: Color.fromRGBO(164, 169, 175, .6),
    600: Color.fromRGBO(164, 169, 175, .7),
    700: Color.fromRGBO(164, 169, 175, .8),
    800: Color.fromRGBO(164, 169, 175, .9),
    900: Color.fromRGBO(164, 169, 175, 1),
  });
  static const borderDark = MaterialColor(_borderDark, <int, Color>{
    50: Color.fromRGBO(210, 219, 224, .1),
    100: Color.fromRGBO(210, 219, 224, .2),
    200: Color.fromRGBO(210, 219, 224, .3),
    300: Color.fromRGBO(210, 219, 224, .4),
    400: Color.fromRGBO(210, 219, 224, .5),
    500: Color.fromRGBO(210, 219, 224, .6),
    600: Color.fromRGBO(210, 219, 224, .7),
    700: Color.fromRGBO(210, 219, 224, .8),
    800: Color.fromRGBO(210, 219, 224, .9),
    900: Color.fromRGBO(210, 219, 224, 1),
  });
  static const shadow = MaterialColor(_shadow, <int, Color>{
    50: Color.fromRGBO(77, 88, 119, .1),
    100: Color.fromRGBO(77, 88, 119, .2),
    200: Color.fromRGBO(77, 88, 119, .3),
    300: Color.fromRGBO(77, 88, 119, .4),
    400: Color.fromRGBO(77, 88, 119, .5),
    500: Color.fromRGBO(77, 88, 119, .6),
    600: Color.fromRGBO(77, 88, 119, .7),
    700: Color.fromRGBO(77, 88, 119, .8),
    800: Color.fromRGBO(77, 88, 119, .9),
    900: Color.fromRGBO(77, 88, 119, 1),
  });
  static const successColor = MaterialColor(_successColor, <int, Color>{
    50: Color.fromRGBO(26, 188, 156, .1),
    100: Color.fromRGBO(26, 188, 156, .2),
    200: Color.fromRGBO(26, 188, 156, .3),
    300: Color.fromRGBO(26, 188, 156, .4),
    400: Color.fromRGBO(26, 188, 156, .5),
    500: Color.fromRGBO(26, 188, 156, .6),
    600: Color.fromRGBO(26, 188, 156, .7),
    700: Color.fromRGBO(26, 188, 156, .8),
    800: Color.fromRGBO(26, 188, 156, .9),
    900: Color.fromRGBO(26, 188, 156, 1),
  });

  static const Color backgroundWhite = Color(0xFFFFFFFF);
}
