import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme{
  static Color lightBlue=Color.fromRGBO(93, 156, 236, 1.0);
  static Color lightGreen=Color.fromRGBO(97, 231, 87, 1.0);
  static Color lightRed=Color.fromRGBO(236, 75, 75, 1.0);
  static Color white=Color.fromRGBO(255, 255, 255, 1.0);
  static Color black=Color.fromRGBO(56, 56, 56, 1.0);
  static Color gray=Color.fromRGBO(200, 201, 203, 1.0);
  static Color primaryGray=Color.fromRGBO(200, 201, 203, 1.0);
  static final ThemeData lightMode = ThemeData(
    primaryColor: white,
    scaffoldBackgroundColor: primaryGray,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: lightBlue,
      unselectedItemColor: primaryGray,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightBlue,
      shadowColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headline4: TextStyle(
        color: white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: lightGreen,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: lightBlue,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final ThemeData darkMode = ThemeData(
    primaryColor: black,
    scaffoldBackgroundColor: black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: lightBlue,
      unselectedItemColor: primaryGray,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightBlue,
      shadowColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headline4: TextStyle(
        color: black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: lightGreen,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: lightBlue,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}