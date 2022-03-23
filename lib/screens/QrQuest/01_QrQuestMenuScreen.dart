import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_game/models/QrGame.dart';
import 'package:qr_game/utilities/save_load_Data.dart';

import '01_ListOfQrScreen.dart';
import '01_SettingScreen.dart';

class QrQuestMenuScreen extends StatefulWidget {
  @override
  _QrQuestMenuScreenState createState() => _QrQuestMenuScreenState();
}

class _QrQuestMenuScreenState extends State<QrQuestMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QrQuest'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
/*              ElevatedButton(
                  onPressed: () {
                    saveData('qq',
                        '{"quantity":3,"range":10,"list":[{"number":9,"isFound":false},{"number":8,"isFound":true},{"number":7,"isFound":false}]}');
                  },
                  child: Text('Save Data1')),
              ElevatedButton(
                  onPressed: () {
                    saveData('qq',
                        '{"quantity":3,"range":10,"list":[{"number":6,"isFound":true},{"number":5,"isFound":false},{"number":4,"isFound":true}]}');
                  },
                  child: Text('Save Data2')),*/
              ElevatedButton(
                  onPressed: () {
                    _resumeGame(context);
                  },
                  child: Text('Resume game')),
              SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    _goToSettingScreen(context);
                  },
                  child: Text('New Game')),
            ]),
      ),
    );
  }

  void _goToSettingScreen(BuildContext context) async {
    Route routeToSettingScreen =
        MaterialPageRoute(builder: (context) => SettingScreen());
    Navigator.push(context, routeToSettingScreen);
  }

  void _resumeGame(BuildContext context) async {
    var gameStr = await loadData('qq');

/*    QrGame game = QrGame.fromJson(json.decode(
        '{"quantity":3,"range":10,"list":[{"number":1,"isFound":false},{"number":2,"isFound":true},{"number":3,"isFound":false}]}'));*/

    QrGame game = QrGame.fromJson(json.decode(gameStr));

    Route routeToListOfQr =
        MaterialPageRoute(builder: (context) => ListOfQrScreen(game));
    Navigator.push(context, routeToListOfQr);
  }
}
