import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: Colors.red,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.cyan,
    textTheme: ButtonTextTheme
        .primary, // Flutter выбирает контрастный цвет исходя из цвета кнопки
  ),
  sliderTheme: SliderThemeData.fromPrimaryColors(
    primaryColor: Colors.red,
    primaryColorDark: Colors.white,
    primaryColorLight: Colors.red,
    valueIndicatorTextStyle: TextStyle(color: Colors.black),
  ),
  toggleableActiveColor: Colors.red, // Switch
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.red,
    selectedIconTheme: IconThemeData(color: Colors.black),
    unselectedIconTheme: IconThemeData(color: Colors.grey[100]),
  ),
  primaryTextTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.yellow,
      fontSize: 30,
    ),
  ),
);

final darkTheme = ThemeData(
  primaryColor: Colors.blue,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.cyan,
    textTheme: ButtonTextTheme
        .primary, // Flutter выбирает контрастный цвет исходя из цвета кнопки
  ),
  sliderTheme: SliderThemeData.fromPrimaryColors(
    primaryColor: Colors.red,
    primaryColorDark: Colors.white,
    primaryColorLight: Colors.red,
    valueIndicatorTextStyle: TextStyle(color: Colors.black),
  ),
  toggleableActiveColor: Colors.red, // Switch
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: Colors.black),
);
