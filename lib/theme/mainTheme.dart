import 'package:flutter/material.dart';

/*
<color name="primaryColor">#c16c14</color>
<color name="primaryLightColor">#f99b46</color>
<color name="primaryDarkColor">#8b4000</color>
<color name="secondaryColor">#c16c14</color>
<color name="secondaryLightColor">#f99b46</color>
<color name="secondaryDarkColor">#8b4000</color>
<color name="primaryTextColor">#000000</color>
<color name="secondaryTextColor">#000000</color>
* */

var primaryColor = const Color(0xFFc16c14);
var primaryLightColor = const Color(0x55f99b46);
var primaryDarkColor = const Color(0xFF8b4000);
var green = const Color(0xFF00cf00);
var red = const Color(0xFFFF0000);
var mt = const Color.fromRGBO(253, 219, 0, 0.1);

// Global Theme
ThemeData myMainTheme = ThemeData(
  // primaryColor: Colors.red,
  fontFamily: 'Leto',

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(
        fontSize: 24,
        fontFamily: 'Leto',
      ),
      primary: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  ),

  textTheme: TextTheme(
    bodyText2: TextStyle(
      fontFamily: 'Leto',
      color: primaryColor,
      // color: Colors.green,
      fontSize: 20.0,
    ),
  ),
  sliderTheme: SliderThemeData(
    thumbColor: primaryColor,
    disabledThumbColor: Colors.grey,

    overlayColor: primaryLightColor,

    activeTrackColor: primaryColor,
    inactiveTrackColor: primaryLightColor,

    activeTickMarkColor: primaryLightColor, // точечки  на темном фоне
    inactiveTickMarkColor: primaryColor, // точечки  на светлом фоне
    // valueIndicatorColor: red, //цвет фона в легенде
    // disabledActiveTickMarkColor: green, // ??

    // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
  ),

  appBarTheme: AppBarTheme(
    color: primaryColor,

    // backgroundColor: const Color(0xFF995511),
    // backgroundColor: Colors.yellow,
    // foregroundColor: Colors.blue,
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
