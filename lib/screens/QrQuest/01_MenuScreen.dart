import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_game/models/QrGame.dart';
import 'package:qr_game/utilities/save_load_Data.dart';

import '../../generated/l10n.dart';
import '01_ListOfQrScreen.dart';
import '01_SettingScreen.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late Future<QrGame> oldGame;

  @override
  void initState() {
    super.initState();
    print('************ MenuScreen initState  ************');
    print('loadGame when initState of MenuScreen');
    oldGame = loadGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text('QrQuest'),
          title: Text(S.of(context).game_qr_quest),
          centerTitle: true,
        ),
        body: FutureBuilder<QrGame>(
          future: oldGame,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: snapshot.hasData
                            ? () => _resumeGame(context)
                            : null,
                        child: Text(S.of(context).continue_game)),
                    SizedBox(height: 8),
                    ElevatedButton(
                        onPressed: () {
                          _goToSettingScreen(context);
                        },
                        child: Text(S.of(context).new_game)),
                  ]),
            );
          },
        ));
  }

  _resumeGame(BuildContext context) async {
    print('loadGame when button Resume pressed');

    QrGame oldGameLast = await loadGame();

    Route routeToListOfQr = MaterialPageRoute(
        builder: (context) => ListOfQrScreen(oldGameLast, refreshData));
    Navigator.push(context, routeToListOfQr);
  }

  refreshData() {
    print('refreshData');
    setState(() {
      oldGame = loadGame();
    });
  }

  Future<QrGame> loadGame() async {
    final savedGameStr = await loadData('qq');

    if (savedGameStr != null) {
      var result = QrGame.fromJson(json.decode(savedGameStr));
      return result;
    } else {
      throw Exception('Error: ${'No saved game'}');
    }
  }

  // New Game
  void _goToSettingScreen(BuildContext context) async {
    Route routeToSettingScreen =
        MaterialPageRoute(builder: (context) => SettingScreen(refreshData));
    await Navigator.push(context, routeToSettingScreen);
  }
}
