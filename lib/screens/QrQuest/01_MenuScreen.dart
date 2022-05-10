import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_game/models/QrGame.dart';
import 'package:qr_game/utilities/save_load_Data.dart';

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
          title: Text('QrQuest'),
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
/*                        onPressed: () {
                          print('snapshot.hasData: ${snapshot.hasData}');
                          return snapshot.hasData
                            ? _resumeGame(context, snapshot.requireData)
                            : null;
                        },

                        // onPressed: _resumeGame(context, snapshot.data!),
                        // onPressed: null,
                        // onPressed: null,*/
                        child: Text('Resume game')),
                    SizedBox(height: 8),
                    ElevatedButton(
                        onPressed: () {
                          _goToSettingScreen(context);
                        },
                        child: Text('New Game')),
                  ]),
            );

            // return const Center(child: CircularProgressIndicator());
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

  Future<QrGame> loadGame() async {
    final savedGameStr = await loadData('qq');

    if (savedGameStr != null) {
      var result = QrGame.fromJson(json.decode(savedGameStr));
      return result;
    } else {
      throw Exception('Error: ${'No saved game'}');
    }
  }

  refreshData() {
    print('refreshData');
    setState(() {
      oldGame = loadGame();
    });
  }

  // New Game
  void _goToSettingScreen(BuildContext context) async {
    Route routeToSettingScreen =
        MaterialPageRoute(builder: (context) => SettingScreen(refreshData));
    await Navigator.push(context, routeToSettingScreen);

/*    setState(() {
      print('bbbbbbbbbbbb');
      savedGame = loadGame();
    });*/
  }

  // ************************************************************
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    print('************ MenuScreen didChangeAppLifecycleState  ************');
  }

  @override
  void didChangeMetrics() {
    setState(() {});
    print('************ MenuScreen didChangeMetrics  ************');

    // This will be triggered by changes in orientation.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // WidgetsBinding.instance.addObserver(this);
    print('************ MenuScreen didChangeDependencies  ************');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('************ MenuScreen deactivate  ************');
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    print('************ MenuScreen dispose  ************');
  }
}

void didChangeAppLifecycleState(AppLifecycleState state) {
  print('hihihi');
}

/*  // Resume
  void _resumeGame(BuildContext context) async {
    var gameStr = await loadData('qq');
*/ /*    QrGame game = QrGame.fromJson(json.decode(
        '{"quantity":3,"range":10,"list":[{"number":1,"isFound":false},{"number":2,"isFound":true},{"number":3,"isFound":false}]}'));*/ /*
    QrGame game = QrGame.fromJson(json.decode(gameStr));

  }*/
