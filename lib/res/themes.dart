import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: Colors.black,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.cyan,
    textTheme: ButtonTextTheme
        .primary, // Flutter выбирает контрастный цвет исходя из цвета кнопки
  ),
  sliderTheme: SliderThemeData.fromPrimaryColors(
    primaryColor: Colors.red,
    primaryColorDark: Colors.white,
    primaryColorLight: Colors.red,
    valueIndicatorTextStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  toggleableActiveColor: Colors.red, // Switch
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
    elevation: 22,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedIconTheme: IconThemeData(
      color: Colors.black,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey[900],
    ),
  ),
  primaryTextTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
);

final darkTheme = ThemeData(
  primaryColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.yellow,
    foregroundColor: Colors.black,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.cyan,
    textTheme: ButtonTextTheme
        .primary, // Flutter выбирает контрастный цвет исходя из цвета кнопки
  ),
  appBarTheme: AppBarTheme(
    color: Colors.black,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  sliderTheme: SliderThemeData.fromPrimaryColors(
    primaryColor: Colors.red,
    primaryColorDark: Colors.white,
    primaryColorLight: Colors.red,
    valueIndicatorTextStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  toggleableActiveColor: Colors.red, // Switch
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedIconTheme: IconThemeData(
      color: Colors.white,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.white60,
    ),
    unselectedItemColor: Colors.white60,
    selectedItemColor: Colors.white60,
  ),
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.yellow,
    ),
    bodyText1: TextStyle(
      color: Colors.yellow,
    ),
    bodyText2: TextStyle(
      color: Colors.yellow,
    ),
    subtitle1: TextStyle(
      color: Colors.yellow,
    ),
    subtitle2: TextStyle(
      color: Colors.yellow,
    ),
    headline1: TextStyle(
      color: Colors.yellow,
    ),
    headline2: TextStyle(
      color: Colors.yellow,
    ),
    headline3: TextStyle(
      color: Colors.yellow,
    ),
    headline4: TextStyle(
      color: Colors.yellow,
    ),
    headline5: TextStyle(
      color: Colors.yellow,
    ),
    caption: TextStyle(
      color: Colors.yellow,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.blue[100],
      primary: Colors.black,
      textStyle: TextStyle(
        color: Colors.yellow,
      ),
    ),
  ),
  scaffoldBackgroundColor: Colors.black38,
);
