import 'package:flutter/material.dart';

// Global Theme
ThemeData myMainTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 24),
      shadowColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(
      // color: Colors.green,
      fontSize: 20.0,
    ),
  ),
);











/*  textTheme: TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
    button: TextStyle(),
    subtitle2: TextStyle(),
    subtitle1: TextStyle(),
    headline6: TextStyle(),
    headline5: TextStyle(),
    headline4: TextStyle(),
    headline3: TextStyle(),
    headline2: TextStyle(),
    headline1: TextStyle(),
    overline: TextStyle(),
    caption: TextStyle(),
  ).apply(
    // color: Colors.white,
    bodyColor: Colors.orange,
    displayColor: Colors.blue,
  ),*/

// TextStyle myTextStyle = TextStyle(fontSize: 34);

// style: ElevatedButton.styleFrom(primary: Colors.red),
/*              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),*/
/*                  MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.pressed))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5);
                  return null; // Use the component's default.
                },
              )),*/
