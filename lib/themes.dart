import 'package:flutter/material.dart';

class EkoScanThemes {
  static final Color ekoGreen = Color.fromARGB(255, 0, 205, 130);
  static final Color ekoDarkGreen = Color.fromARGB(255, 0, 151, 95);
  static final Color ekoDarkGrey = Colors.blueGrey[700];
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ekoGreen,
    accentColor: ekoDarkGreen,
    //backgroundColor: Color.fromARGB(255, 200, 200, 200),
    //scaffoldBackgroundColor: Color.fromARGB(255, 200, 200, 200),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: ekoDarkGrey),
    accentIconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.blueGrey,
            letterSpacing: 2.0,
            fontWeight: FontWeight.normal),
        bodyText2: TextStyle(
          color: ekoGreen,
          letterSpacing: 2.0,
          fontWeight: FontWeight.normal
        ),
        headline1: TextStyle(
            color: ekoDarkGrey,
            letterSpacing: 2.0,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        headline3: TextStyle(
          color: ekoGreen,
            letterSpacing: 2.0,
            fontSize: 15.0,
            fontWeight: FontWeight.w500
        ),
        button: TextStyle(color: Colors.white)),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: ekoGreen,
    accentColor: ekoDarkGreen,
    scaffoldBackgroundColor: Color.fromARGB(255, 32, 32, 32),
    iconTheme: IconThemeData(color: Colors.white),
    accentIconTheme: IconThemeData(color: ekoDarkGrey),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontWeight: FontWeight.normal),
        bodyText2: TextStyle(
            color: ekoGreen,
            letterSpacing: 2.0,
            fontWeight: FontWeight.normal
        ),
        headline1: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: ekoDarkGrey,
            letterSpacing: 2.0,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        headline3: TextStyle(
            color: ekoGreen,
            letterSpacing: 2.0,
            fontSize: 15.0,
            fontWeight: FontWeight.w500
        ),
        button: TextStyle(color: Colors.black)),
  );
}
