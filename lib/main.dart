import 'package:flutter/material.dart';
import 'screens/TitleScreen.dart';
import 'theme/mainTheme.dart';

void main() {
  runApp(MaterialApp(
    title: 'Returned Pass Data',
    theme: myMainTheme,
    home: TitleScreen(),
    // home: SettingScreen(),
  ));
}

// 20/20 Quest finished! Congratulation!

// Экраны в Flutter называются route.
// MaterialPageRoute() — Модальный route, который заменяет весь экран адаптивным к платформе переходом анимации.
//  State отвечает за хранение истории навигации и предоставляет API для управления историей.

// TO DO:
// * make screen
// * recover data of previous game
// * remove setting screen when click button Back

/* https://habr.com/ru/post/512072/
*                     showAboutDialog(
                        context: context,
                        applicationName: 'Jobs',
                        applicationIcon: Container(
                            height: 65,
                            width: 65,
                            child: Image.asset('assets/employment.png')),
                        applicationVersion: '1.0.0',
                        children: [
                          Text('This is the body'),
                        ]);*/

// GlobalKey — костыль, который в идеале вообще не нужно использовать.