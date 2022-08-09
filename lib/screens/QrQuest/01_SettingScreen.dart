import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_game/screens/QrQuest/01_ListOfQrScreen.dart';
import 'package:qr_game/models/QrGame.dart';

import 'package:qr_game/utilities/constants.dart';
import 'package:qr_game/utilities/save_load_Data.dart';

class SettingScreen extends StatefulWidget {
  late final refreshDataCallBack;
  SettingScreen(Function() refreshData){
    refreshDataCallBack = refreshData;
  }

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double _quantity = Constants.QUANTITY_INIT;
  double _range = Constants.RANGE_INIT;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Number of QrCodes: ${_quantity.round()}',
              ),
            ),
            Center(
              child: Slider(
                value: _quantity,
                min: Constants.QUANTITY_MIN,
                max: Constants.QUANTITY_MAX,
                divisions: Constants.QUANTITY_DIVISIONS,
                label: _quantity.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _quantity = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Range of QrCodes: ${_range.round()}',
              ),
            ),
            Center(
              child: Slider(
                value: _range,
                min: Constants.RANGE_MIN,
                max: Constants.RANGE_MAX,
                divisions: Constants.RANGE_DIVISIONS,
                label: _range.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _range = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              child: Text(
                'Start',
              ),
              onPressed: () {
                _goToListOfQrScreen(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _goToListOfQrScreen(BuildContext context) async {
    QrGame game = QrGame(_quantity.round(), _range.round());

    Route routeToListOfQr = MaterialPageRoute(
        builder: (context) =>
            ListOfQrScreen(game, widget.refreshDataCallBack));

    Navigator.pushReplacement(context, routeToListOfQr);
    print('save data when new game is created');
    saveData('qq', json.encode(game)); // save data when new game is created

  }
}
