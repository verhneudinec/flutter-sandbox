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
  primaryColor: Colors.black,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.yellow,
    foregroundColor: Colors.black,
  ),
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
  scaffoldBackgroundColor: Colors.black38,
);
