import 'package:flutter/material.dart';
import 'package:qr_game/screens/QrQuest/01_SettingScreen.dart';
import 'screens/TitleScreen.dart';
import 'theme/mainTheme.dart';

void main() {
  runApp(MaterialApp(
    title: 'Returned Pass Data',
    theme: myMainTheme,
    // home: TitleScreen(),
    home: SettingScreen(),
  ));
}


// TO DO:
// * make screen
// * recover data of previous game
// * remove setting screen when click button Back

