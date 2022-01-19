import 'package:flutter/material.dart';
import 'package:qr_game/utilities/saveData.dart';

import '01_SettingScreen.dart';

class QrQuest extends StatefulWidget {
  @override
  _QrQuestState createState() => _QrQuestState();
}

class _QrQuestState extends State<QrQuest> {
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
              ElevatedButton(onPressed: () {saveData('qq', 'dima');}, child: Text('Save Data')),
              ElevatedButton(onPressed: () {print(loadData('qq'));}, child: Text('Load Data')),
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
}
